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
        dateLabel.font = UIFont.NotoSans(.regular, size: 12)
        contentsLabel.font = UIFont.GmarketSansTTF(.medium, size: 14)
    }
    func setData(date: String, content: String, important: Bool){
        dateLabel.text = date
        contentsLabel.text = content
        if important  == false {
            reminderButton.setImage(UIImage(named: "listReminderHome"), for: .normal)
        }
        else {
            reminderButton.setImage(UIImage(named: "listReminderHomeImp"), for: .normal)
        }
    }

}
