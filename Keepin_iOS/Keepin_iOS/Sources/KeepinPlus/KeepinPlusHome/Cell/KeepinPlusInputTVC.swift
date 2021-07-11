//
//  KeepinPlusInputTVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/10.
//

import UIKit

class KeepinPlusInputTVC: UITableViewCell {
    
    public static let identifier = "KeepinPlusInputTVC"
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
    
    func setData(placeholder : String){
        textfield.placeholder = placeholder
    }
    
    func setUI(){
        underlineView.backgroundColor = .keepinGray3
        
        textfield.font = UIFont.NotoSans(.regular, size: 16)
    }
    
}
