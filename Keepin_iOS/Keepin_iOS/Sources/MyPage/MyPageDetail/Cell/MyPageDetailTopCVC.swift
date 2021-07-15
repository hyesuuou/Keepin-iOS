//
//  MyPageDetailTopCVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/05.
//

import UIKit

class MyPageDetailTopCVC: UICollectionViewCell {

    
    var detail1 : Int = 0
    var detail2 : Int = 0
    var detail3 : Int = 0
    public static let identifier = "MyPageDetailTopCVC"
    var userName : String = ""
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
    
    @IBOutlet weak var allPresentPad: NSLayoutConstraint!
    
    @IBOutlet weak var givePresentPad: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        allPresent.font = UIFont.NotoSans(.regular, size: 14)
        allPresent.text = "총 선물"
        allPresent.textColor = .keepinGray5
        receivePresent.font = UIFont.NotoSans(.regular, size: 14)
        receivePresent.text = "받은 선물"
        receivePresent.textColor = .keepinGray5
        givePresent.font=UIFont.NotoSans(.regular, size: 14)
        givePresent.text = "준 선물"
        givePresent.textColor = .keepinGray5
        
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
    
    func setAuto(){
        allPresentPad.constant = UIScreen.main.bounds.width * (36/375)
        givePresentPad.constant = UIScreen.main.bounds.width * (
            31.5/375)
    }

}
