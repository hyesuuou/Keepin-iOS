//
//  SelectFriendMessageTVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/09/02.
//

import UIKit

class SelectFriendMessageTVC: UITableViewCell {
    
    public static let identifier = "SelectFriendMessageTVC"

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        label.textColor = .keepinGray3
        label.font = UIFont.GmarketSansTTF(.medium, size: 16)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
