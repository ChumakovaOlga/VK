//
//  AllGroupsViewController.swift
//  VKontakteApp
//
//  Created by Olga Chumakova on 11.07.2021.
//

import UIKit

final class AllGroupsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var groups = [GroupModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groups = GroupStorage().allGroups
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension AllGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        guard
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupTableViewCell.reusedIdentifier, for: indexPath) as? GroupTableViewCell
        else {
            return UITableViewCell()
        }
        let group = groups[indexPath.row]
        cell.configure(group: group)
        return cell
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "moveToPeople", sender: nil)
//    }
}
