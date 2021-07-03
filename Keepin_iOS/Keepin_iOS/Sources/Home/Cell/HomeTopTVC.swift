//
//  HomeTopTVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/02.
//

import UIKit

class HomeTopTVC: UITableViewCell {
    
    public static let identifier = "HomeTopTVC"
    
    let username : String = "윤정"
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        welcomeLabel.text = "\(username)님\n키핀은 아름다워요."
        welcomeLabel.font = UIFont.GmarketSansTTF(.medium, size: 22)
        
        messageLabel.text = "PM이 탕수육 사줬다~~"
        messageLabel.font = UIFont.GmarketSansTTF(.medium, size: 14)
        messageLabel.textColor = .keepinGray5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
