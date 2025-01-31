//
//  KeepinPlusSearchTVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/10.
//

import UIKit

class KeepinPlusSearchTVC: UITableViewCell {
    
    public static let identifier = "KeepinPlusSearchTVC"

    @IBOutlet weak var friendNameButton: UIButton!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var underlineView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI(){
        textfield.font = UIFont.NotoSans(.regular, size: 13)
        underlineView.backgroundColor = .keepinGray3
        
    }
    
}
