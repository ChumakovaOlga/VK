//
//  FavouriteGroupViewController.swift
//  VKontakteApp
//
//  Created by Olga Chumakova on 09.07.2021.

import UIKit

class FavouriteGroupViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    var groups: [GroupModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storage = GroupStorage()
        groups = storage.groups
    }
    
    override func viewDidAppear(_ animated: Bool) {//когда view уже на экране
        super.viewDidAppear(animated)
        layerAnimation()
      
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToPeople",
           let destinationController = segue.destination as? PeopleViewController,
            let indexPath = sender as? IndexPath
            {
            let group = groups[indexPath.row]
            destinationController.peoples = group.peoples
            destinationController.title = group.name
        }
    }
    
    
    @IBAction func addGroup (_ segue: UIStoryboardSegue) {
        guard
            segue.identifier == "addGroup",
        let sourceController = segue.source as? AllGroupsViewController,
        let indexPath = sourceController.tableView.indexPathForSelectedRow
        else {
            return
        }
        let group = sourceController.groups[indexPath.row]
        if !groups.contains(where: {$0.name == group.name}){
            groups.append(group)
           tableView.reloadData()
        }
    }
}

extension FavouriteGroupViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func layerAnimation() {
   
        
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animation.fromValue = 0
        animation.toValue = 1
     
        
        
        let identityPosition = tableView.layer.position.x
        let animationTransition = CABasicAnimation(keyPath: "position.x")
        
        animationTransition.fromValue = 500
        animationTransition.toValue = identityPosition
     
        
        let animationsGroup = CAAnimationGroup()
        animationsGroup.duration = 1
        animationsGroup.fillMode = .backwards
        animationsGroup.isRemovedOnCompletion = false
        animationsGroup.animations = [animation, animationTransition]
        
        
        tableView.layer.add(animationsGroup, forKey: nil)
}
    
    
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToPeople", sender: indexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //Если была нажата кнопка "Удалить"
        if editingStyle == .delete {
            //Удаляем город из массива
            groups.remove(at: indexPath.row)
            //И удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
