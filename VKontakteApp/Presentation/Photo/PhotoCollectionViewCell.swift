//
//  PhotoCollectionViewCell.swift
//  VKontakteApp
//
//  Created by Olga Chumakova on 15.07.2021.
//

import UIKit

final class PhotoCollectionViewCell : UICollectionViewCell {
   static let identifier = "PhotoCollectionViewCell "
    @IBOutlet private var imageNameView: UIImageView!
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var  placeLabel: UILabel!
    
    func configure(photo: PhotoModel) {
        imageNameView.image =  UIImage(named: photo.imageName)
        dateLabel.text = photo.date
        placeLabel.text = photo.place
    }
    
}
