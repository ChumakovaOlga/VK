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
    
    var friends = [FriendModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       friends =  FriendStorage().allFriends.sorted(by: { $0.name < $1.name })
        let firstLetters = getFirstLetters(friends)
        lettersControl.setLetters(firstLetters)
        lettersControl.addTarget(self, action: #selector(scrollToLetter), for: .valueChanged)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func scrollToLetter() {
        let letter = lettersControl.selectLetter
        guard
            let firstIndexForLetter = friends.firstIndex(where: { String($0.name.prefix(1)) == letter })
        else {
            return
        }

        tableView.scrollToRow(
            at: IndexPath(row: firstIndexForLetter, section: 0),
            at: .top,
            animated: true)
    }

    private func getFirstLetters(_ friends: [FriendModel]) -> [String] {
        let friendsName = friends.map { $0.name }
        let firstLetters = Array(Set(friendsName.map { String($0.prefix(1)) })).sorted()
        return firstLetters
    }
}

extension AllFriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.reusedIdentifier, for: indexPath) as? FriendTableViewCell
        else {
            return UITableViewCell()
        }
        let friend = friends[indexPath.row]
        cell.configure(friend: friend)
        return cell
    }
}
