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
        monthLabel.textColor = UIColor(hex: 0x7e7e7e)
        self.backgroundColor = .clear
    }
    
    override var isSelected: Bool{
        didSet{
            monthLabel.font = isSelected ? UIFont.NotoSans(.bold, size: 16) : UIFont.NotoSans(.regular, size: 16)
            monthLabel.textColor = isSelected ? .white : .gray
        }
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "ReminderCVC", bundle: nil)
    }
}
