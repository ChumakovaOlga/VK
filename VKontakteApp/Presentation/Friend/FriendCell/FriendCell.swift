//
//  FriendCell.swift
//  VKontakteApp
//
//  Created by Olga Chumakova on 22.07.2021.
//

import UIKit

final class FriendCell: UITableViewCell {
    static let reusedIdentifier = "FriendCell"
    
    var buttonTapped: ((UIColor) -> Void)?
    
    @IBOutlet var avatarView: AvatarView!
    @IBOutlet var nameLabel: UILabel!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarView.setImage(nil)
        nameLabel.text = ""
    }
    
    /// Конфигурация ячейки
    /// - Parameter friend: Модель друга
    func configure(friend: FriendModel) {
        let image = UIImage(named: friend.avatarName)
        avatarView.setImage(image)
        nameLabel.text = friend.name
        backgroundColor = friend.color
    }
    
    
    @IBAction func changeColor(_ sender: Any) {
        buttonTapped?(.cyan)
    }
}
