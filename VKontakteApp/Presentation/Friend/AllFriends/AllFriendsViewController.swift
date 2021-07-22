//
//  AllFriendsViewController.swift
//  VKontakteApp
//
//  Created by Olga Chumakova on 15.07.2021.
//

import UIKit

final class AllFriendsViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var lettersControl: LettersControl!
    
    var friendsSection = [[FriendModel]]()
    private var firstLetters:  [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let friends =  FriendStorage().allFriends.sorted(by: { $0.name < $1.name })
        firstLetters = getFirstLetters(friends)
        lettersControl.setLetters(firstLetters)
        lettersControl.addTarget(self, action: #selector(scrollToLetter), for: .valueChanged)
        
        friendsSection = sortedForSection(friends, firstLetters: firstLetters)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: FriendCell.reusedIdentifier, bundle: nil),
                           forCellReuseIdentifier: FriendCell.reusedIdentifier)
        
        tableView.register(FriendHeaderSection.self,
                           forHeaderFooterViewReuseIdentifier: FriendHeaderSection.reuseIdentifier)
        
        let tableHeader = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 160))
        tableHeader.contentMode = .scaleAspectFill
        tableHeader.image = UIImage(named: "header")
        tableHeader.clipsToBounds = true
        tableView.tableHeaderView = tableHeader
    }
    
    @objc func scrollToLetter() {
        let letter = lettersControl.selectLetter
        guard
            let firstIndexForLetter = friendsSection.firstIndex(where: { String($0.first?.name.prefix(1) ?? "") == letter })
        else {
            return
        }

        tableView.scrollToRow(
            at: IndexPath(row: 0, section: firstIndexForLetter),
            at: .top,
            animated: true)
    }

    private func getFirstLetters(_ friends: [FriendModel]) -> [String] {
        let friendsName = friends.map { $0.name }
        let firstLetters = Array(Set(friendsName.map { String($0.prefix(1)) })).sorted()
        return firstLetters
    }
    private func sortedForSection(_ friends: [FriendModel], firstLetters: [String]) ->[[FriendModel]] {
        var friendsSorted: [[FriendModel]] = []
        firstLetters.forEach {letter in
            let friendsForLetter = friends.filter{String($0.name.prefix(1)) == letter}
            friendsSorted.append(friendsForLetter)
        }
        return friendsSorted
    }
}


extension AllFriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        friendsSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friendsSection[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.reusedIdentifier, for: indexPath) as? FriendCell
        else {
            return UITableViewCell()
        }
        let friend = friendsSection[indexPath.section][indexPath.row]
        cell.configure(friend: friend)
        cell.buttonTapped = {[weak self] color in
            self?.friendsSection[indexPath.section][indexPath.row].color = color
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: FriendHeaderSection.reuseIdentifier) as? FriendHeaderSection
        else {
            return nil
        }
        header.configure(title: firstLetters[section])
        return header
    }
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath ) {
                   performSegue(withIdentifier: "addFriend", sender: nil)
}

}
