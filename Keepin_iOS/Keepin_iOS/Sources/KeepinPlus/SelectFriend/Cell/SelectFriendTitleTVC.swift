//
//  SelectFriendTitleTVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/16.
//

import UIKit

// 높이 36
class SelectFriendTitleTVC: UITableViewCell {
    
    public static let identifier = "SelectFriendTitleTVC"

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        titleLabel.text = ""
    }
    
    func setUI(){
        titleLabel.font = UIFont.GmarketSansTTF(.medium, size: 16)
    }
    
}
