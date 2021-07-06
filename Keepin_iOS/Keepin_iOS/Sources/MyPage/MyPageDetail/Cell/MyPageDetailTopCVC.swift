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
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        userLabel.text = "\(userName)님과 \n주고받은 선물"
        userLabel.font = UIFont.GmarketSansTTF(.medium, size: 20)
        
        let attributedStr = NSMutableAttributedString(string: userLabel.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor.keepinGreen, range: (userLabel.text! as NSString).range(of: "\(userName)"))
        userLabel.attributedText = attributedStr
        
        
        allPresent.font = UIFont.NotoSans(.regular, size: 14)
        allPresent.text = "총 선물"
        receivePresent.font = UIFont.NotoSans(.regular, size: 14)
        receivePresent.text = "받은 선물"
        givePresent.font=UIFont.NotoSans(.regular, size: 14)
        givePresent.text = "준 선물"
        
        number1.font = UIFont.NotoSans(.bold, size: 16)
        number1.text = "2개"
        number2.font = UIFont.NotoSans(.bold, size: 16)
        number2.text = "1개"
        number3.font = UIFont.NotoSans(.bold, size: 16)
        number3.text = "1개"
        number1.textColor = .keepinGreen
        number2.textColor = .keepinGreen
        number3.textColor = .keepinGreen
        
        mainView.layer.cornerRadius = 12
        mainView.backgroundColor = .keepinGray
        view1.backgroundColor = .keepinGray
        view2.backgroundColor = .keepinGray4
        view3.backgroundColor = .keepinGray
        view4.backgroundColor = .keepinGray4
        view5.backgroundColor = .keepinGray
        view1.layer.cornerRadius = 12
        view5.layer.cornerRadius = 12
        
    }

}
