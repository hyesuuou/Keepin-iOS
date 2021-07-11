//
//  ReminderCVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/11.
//

import UIKit

class ReminderCVC: UICollectionViewCell {

    @IBOutlet weak var monthLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "ReminderCVC", bundle: nil)
    }

}
