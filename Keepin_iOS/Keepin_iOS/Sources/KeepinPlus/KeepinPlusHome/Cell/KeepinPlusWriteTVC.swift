//
//  KeepinPlusWriteTVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/10.
//

import UIKit

class KeepinPlusWriteTVC: UITableViewCell {
    
    public static let identifier = "KeepinPlusWriteTVC"
    @IBOutlet weak var textfield: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textfield.layer.cornerRadius = 12
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.keepinGray3.cgColor
        textfield.addLeftPadding()
        textfield.font = UIFont.NotoSans(.regular, size: 14)
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
