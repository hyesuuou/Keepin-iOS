//
//  ReminderPastTVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/09/24.
//

import UIKit

class ReminderPastTVC: UITableViewCell {

    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var reminderTitle: UILabel!
    @IBAction func toKeepin(_ sender: UIButton) {
        delegate?.toKeepin(index: index)
    }
    
    var delegate : tableviewTouch?
    var index : Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        reminderTitle.font = UIFont.GmarketSansTTF(.medium, size: 16)
        reminderTitle.textColor = .keepinGray5
        backgroundImg.image = UIImage(named: "listReminderNotimportant")
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        backgroundImg.addGestureRecognizer(tapGesture)
        // Initialization code
    }

    override func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("touched TVC")
        delegate?.touchedTVC()
        return true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "ReminderPastTVC", bundle: nil)
    }
    
    override func prepareForReuse() {
        backgroundImg.image = UIImage(named: "listReminderNotimportant")
    }
}
