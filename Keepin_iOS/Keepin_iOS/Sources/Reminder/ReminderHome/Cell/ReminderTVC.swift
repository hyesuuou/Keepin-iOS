//
//  ReminderTVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/11.
//

import UIKit

class ReminderTVC: UITableViewCell {
    @IBOutlet weak var backgronudImg: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var alarmOn: UISwitch!
    @IBOutlet weak var reminderTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        reminderTitle.font = UIFont.GmarketSansTTF(.medium, size: 16)
        reminderTitle.textColor = .keepinGray5
        alarmOn.set(width: 44, height: 24)
        alarmOn.isOn = true
        backgronudImg.image = UIImage(named: "listReminderNotimportant")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "ReminderTVC", bundle: nil)
    }
    
    override func prepareForReuse() {
        backgronudImg.image = UIImage(named: "listReminderNotimportant")
    }
    
}
