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
    @IBOutlet weak var clickedImageView: UIImageView!
    
    
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
    
    func setDataUI(name: String, clicked: Bool){
        nameLabel.text = name
        if clicked == true {
            bgView.backgroundColor = .ice
            clickedImageView.image = UIImage(named: "icnCheckActive")
        }
        else {
            bgView.backgroundColor = .keepinGray1
            clickedImageView.image = UIImage(named: "icCheckNot")
        }
    }
    
}
