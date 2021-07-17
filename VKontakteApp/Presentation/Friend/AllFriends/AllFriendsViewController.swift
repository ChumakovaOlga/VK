//
//  AllFriendsViewController.swift
//  VKontakteApp
//
//  Created by Olga Chumakova on 15.07.2021.
//

import UIKit

final class AllFriendsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var friends = [FriendModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       friends =  FriendStorage().allFriends
        tableView.delegate = self
        tableView.dataSource = self
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
