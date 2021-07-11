//
//  MyPageEditNameVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/11.
//

import UIKit

class MyPageEditNameVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var nameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.font = UIFont.NotoSans(.regular, size: 16)
        nameLabel.textColor = .keepinBlack
        
        lineView.backgroundColor = .keepinGray4
        
        nameText.attributedPlaceholder = NSAttributedString(string: "최대 5개까지 입력 가능합니다.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.keepinGray4])
    }
    
    
    @IBAction func toBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
