//
//  PhotoViewController.swift
//  VKontakteApp
//
//  Created by Olga Chumakova on 15.07.2021.
//

import UIKit

final class  PhotoViewController: UIViewController {
    
    
    @IBOutlet var dayPickerView: DayPicker!
    @IBOutlet var collectionView: UICollectionView!
    
    var photos:[PhotoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        dayPickerView.addTarget(self, action: #selector(dayChanged), for: .valueChanged)
    }
    @objc private func dayChanged() {
        title = dayPickerView.selectedDay?.title
        
    }
}
extension  PhotoViewController: UICollectionViewDelegate {
    
}
extension  PhotoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        let photo = photos[indexPath.item]
        cell.configure(photo: photo)
        
        return cell
    }
    
    
}
