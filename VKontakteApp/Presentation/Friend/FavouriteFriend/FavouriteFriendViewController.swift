//
//  FavouriteFriendViewController.swift
//  VKontakteApp
//
//  Created by Olga Chumakova on 14.07.2021.
//
import UIKit

class FavouriteFriendViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    var friends: [FriendModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storage = FriendStorage()
        friends = storage.friends
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToPhoto",
           let destinationController =  segue.destination as? PhotoViewController,
           let indexPath = sender as? IndexPath
           {
            let friend = friends[indexPath.row]
            destinationController.photos = friend.photos
            destinationController.title = friend.name
        }
    }
    
    @IBAction func addFriend(_ segue: UIStoryboardSegue) {
        guard
            segue.identifier == "addFriend",
            let sourceController = segue.source as? AllFriendsViewController,
            let indexPath = sourceController.tableView.indexPathForSelectedRow
        else {
            return
        }
        let friend = sourceController.friends[indexPath.row]
        if !friends.contains(where: {$0.name == friend.name}) {
            friends.append(friend)
            tableView.reloadData()
        }
    }
}
 
extension FavouriteFriendViewController: UITableViewDelegate, UITableViewDataSource {
    
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToPhoto", sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //Если была нажата кнопка "Удалить"
        if editingStyle == .delete {
            //Удаляем friend из массива
            friends.remove(at: indexPath.row)
            //И удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
