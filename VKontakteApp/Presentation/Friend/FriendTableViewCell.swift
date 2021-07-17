//
//  FriendTableViewCell.swift
//  VKontakteApp
//
//  Created by Olga Chumakova on 15.07.2021.
//

import UIKit

final class FriendTableViewCell: UITableViewCell {
    
    static let reusedIdentifier = "FriendTableViewCell"
    
    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    
    
    
    func configure(friend: FriendModel) {
        avatarImageView.image = UIImage(named: friend.avatarName)
        nameLabel.text = friend.name
    }
}
