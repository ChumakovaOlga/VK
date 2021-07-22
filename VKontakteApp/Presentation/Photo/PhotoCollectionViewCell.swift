//
//  PhotoCollectionViewCell.swift
//  VKontakteApp
//
//  Created by Olga Chumakova on 15.07.2021.
//

import UIKit

final class PhotoCollectionViewCell : UICollectionViewCell {
    
   static let identifier = "PhotoCollectionViewCell"
    @IBOutlet private var imageNameView: UIImageView!
    @IBOutlet private var shadowImageView: UIView!
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var  placeLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        settingsView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        settingsView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let cornerRadius = imageNameView.bounds.height / 2
        imageNameView.layer.cornerRadius = cornerRadius
        shadowImageView.layer.cornerRadius = cornerRadius
    }
    
    func configure(photo: PhotoModel) {
        imageNameView.image =  UIImage(named: photo.imageName)
        dateLabel.text = photo.date
        placeLabel.text = photo.place
    }
    private func settingsView(){
        imageNameView.layer.borderWidth = 2
        imageNameView.layer.borderColor = UIColor.black.cgColor
        imageNameView.layer.masksToBounds = true
        
        shadowImageView.layer.shadowColor = UIColor.red.cgColor
        shadowImageView.layer.shadowOffset = .zero
        shadowImageView.layer.shadowRadius = 5
        shadowImageView.layer.shadowOpacity = 0.9
    }
}
