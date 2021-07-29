//
//  FriendTableViewCell.swift
//  VKontakteApp
//
//  Created by Olga Chumakova on 15.07.2021.
//

import UIKit

final class FriendTableViewCell: UITableViewCell {
    
    static let reusedIdentifier = "FriendTableViewCell"
    
    @IBOutlet private var avatarView: AvatarView!
    @IBOutlet private var nameLabel: UILabel!
     
    func configure(friend: FriendModel) {
        let image = UIImage(named: friend.avatarName)
        avatarView.setImage(image)
        nameLabel.text = friend.name
    }
}
