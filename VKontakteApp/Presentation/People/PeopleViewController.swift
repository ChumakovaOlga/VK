//
//  PeopleViewController.swift
//  VKontakteApp
//
//  Created by Olga Chumakova on 11.07.2021.
//

import UIKit

final class PeopleViewController: UIViewController {
    
    
    @IBOutlet var collectionView: UICollectionView!
    var peoples: [PeopleModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}
extension PeopleViewController: UICollectionViewDelegate {
    
}
extension PeopleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        peoples.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PeopleCollectionViewCell.identifier, for: indexPath) as! PeopleCollectionViewCell
        let people = peoples[indexPath.item]
        cell.configure(people: people)
        return cell
    }
    
    
}
