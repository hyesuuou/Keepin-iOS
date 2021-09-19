//
//  ReminderTVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/11.
//

import UIKit
protocol tableviewTouch{
    func touchedTVC()
    func notTVC()
    func touchedAlarm(tv: String, index: Int, value: Bool)
}

class ReminderTVC: UITableViewCell {
    @IBOutlet weak var backgronudImg: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var alarmOn: UISwitch!
    @IBOutlet weak var reminderTitle: UILabel!
    
    @IBAction func alarmChanged(_ sender: UISwitch) {
        delegate?.touchedAlarm(tv: TVname, index: index, value: sender.isOn)
    }
    
    var delegate : tableviewTouch?
    var index : Int = 0
    var TVname : String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        reminderTitle.font = UIFont.GmarketSansTTF(.medium, size: 16)
        reminderTitle.textColor = .keepinGray5
        alarmOn.set(width: 44, height: 24)
        alarmOn.isOn = true
        backgronudImg.image = UIImage(named: "listReminderNotimportant")
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        backgronudImg.addGestureRecognizer(tapGesture)
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
        return UINib(nibName: "ReminderTVC", bundle: nil)
    }
    
    override func prepareForReuse() {
        backgronudImg.image = UIImage(named: "listReminderNotimportant")
    }
    
}
