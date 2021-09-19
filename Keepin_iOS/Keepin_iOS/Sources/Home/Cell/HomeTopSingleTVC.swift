//
//  HomeTopSingleTVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/15.
//

import UIKit

class HomeTopSingleTVC: UITableViewCell {
    
    public static let identifier = "HomeTopSingleTVC"
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var reminderButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI(){
        titleLabel.font = UIFont.GmarketSansTTF(.medium, size: 16)
        backView.backgroundColor = .keepinGray
        label.font = UIFont.GmarketSansTTF(.medium, size: 14)
        label.textColor = .keepinGray3
    }

}
