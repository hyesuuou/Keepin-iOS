//
//  SelectFriendListTVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/16.
//

import UIKit

class SelectFriendListTVC: UITableViewCell {
    
    public static let identifier = "SelectFriendListTVC"
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI(){
        bgView.backgroundColor = .keepinGray1
        bgView.layer.cornerRadius = 10
        nameLabel.font = UIFont.NotoSans(.regular, size: 14)

    }
    
}
