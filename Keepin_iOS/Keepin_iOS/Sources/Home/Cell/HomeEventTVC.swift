//
//  HomeEventTVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/02.
//

import UIKit

class HomeEventTVC: UITableViewCell {

    public static let identifier = "HomeEventTVC"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .keepinGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
