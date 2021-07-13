//
//  PeopleCollectionViewCell.swift
//  VKontakteApp
//
//  Created by Olga Chumakova on 11.07.2021.
//

import UIKit


final class PeopleCollectionViewCell: UICollectionViewCell {
   static let identifier = "PeopleCollectionViewCell"
    @IBOutlet private var iconImageView: UIImageView!
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var numberLabel: UILabel!

    func configure(people: PeopleModel) {
        iconImageView.image = UIImage(systemName: people.iconName)
        dateLabel.text = people.date
        numberLabel.text = people.number
    }
}
