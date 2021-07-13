//
//  GroupTableViewCell.swift
//  VKontakteApp
//
//  Created by Olga Chumakova on 11.07.2021.
//

import UIKit

final class GroupTableViewCell: UITableViewCell {
    static let reusedIdentifier = "GroupTableViewCell"
    
    
    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    
    func configure(group: GroupModel) {
        avatarImageView.image = UIImage(named: group.avatarName)
        nameLabel.text = group.name
    }
}
