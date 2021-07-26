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
    @IBOutlet weak var doneButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
    }
    
    func setStyle(){
        nameLabel.font = UIFont.NotoSans(.regular, size: 16)
        nameLabel.textColor = .keepinBlack
        
        doneButton.tintColor = .keepinGray3
        doneButton.titleLabel?.font = UIFont.NotoSans(.bold, size: 16)
        
        lineView.backgroundColor = .keepinGray4
        
        nameText.attributedPlaceholder = NSAttributedString(string: "최대 5개까지 입력 가능합니다.", attributes: [NSAttributedString.Key.foregroundColor : UIColor.keepinGray4])
        nameText.addTarget(self, action: #selector(textFieldDidChange(_sender:)), for: .editingChanged)
    }
    
    
    @IBAction func toBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func textFieldDidChange(_sender: Any?){
        if nameText.text != ""{
            doneButton.tintColor = .keepinGreen
        }
    }
    
    @IBAction func doneButton(_ sender: Any) {
        let request = MyPageProfileNameRequest(name: nameText.text!)
        MyPageProfileDataManager().fixProfileName(modified: request, viewcontroller: self)
    }
    
    
}

extension MyPageEditNameVC{
    func didSuccessFixName(message: String){
        print(message)
    }

}
