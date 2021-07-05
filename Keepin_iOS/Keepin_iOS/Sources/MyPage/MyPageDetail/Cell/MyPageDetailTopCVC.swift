//
//  MyPageDetailTopCVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/05.
//

import UIKit

class MyPageDetailTopCVC: UICollectionViewCell {

    public static let identifier = "MyPageDetailTopCVC"
    let userName : String = "이채연"
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var allPresent: UILabel!
    @IBOutlet weak var receivePresent: UILabel!
    @IBOutlet weak var givePresent: UILabel!
    @IBOutlet weak var number1: UILabel!
    @IBOutlet weak var number2: UILabel!
    @IBOutlet weak var number3: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        let attributedStr = NSMutableAttributedString(string: userLabel.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.keepinGreen, range: (userLabel.text! as NSString).range(of: "userName"))
        userLabel.attributedText = attributedStr
        
        userLabel.text = "이채연님과 \n주고받은 선물"
        userLabel.font = UIFont.GmarketSansTTF(.medium, size: 20)
        
        allPresent.font = UIFont.NotoSans(.regular, size: 14)
        receivePresent.font = UIFont.NotoSans(.regular, size: 14)
        givePresent.font=UIFont.NotoSans(.regular, size: 14)
        
        number1.font = UIFont.NotoSans(.bold, size: 16)
        number2.font = UIFont.NotoSans(.bold, size: 16)
        number3.font = UIFont.NotoSans(.bold, size: 16)
        number1.textColor = .keepinGreen
        number2.textColor = .keepinGreen
        number3.textColor = .keepinGreen

    }

}
