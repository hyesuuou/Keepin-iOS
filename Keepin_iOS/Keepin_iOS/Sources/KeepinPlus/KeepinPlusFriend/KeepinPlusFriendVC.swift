//
//  KeepinPlusFriendVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/10.
//

import UIKit

class KeepinPlusFriendVC: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var warnLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.addTarget(self, action: #selector(textFieldChange(_sender:)), for: .editingChanged)
        setWarnLabel(label: warnLabel)
        setStyle()
        textField.delegate=self
    }
    
    @objc func textFieldChange(_sender: Any?){
        if textField.text != ""{
            doneButton.tintColor = .keepinGreen
        }
    }
    
    func setWarnLabel(label:UILabel){
        label.isHidden = true
        label.font = UIFont.NotoSans(.regular, size: 14)
        label.textColor = .salmon
    }

    @IBAction func doneButton(_ sender: Any) {
        guard let newFriend = textField.text else {return}
        self.makeRequestAlert(title: "\(newFriend)님이 등록되었습니다.", message: "", okAction: {_ in
        let request = PlusFriendRequest(name: newFriend)
        PlusFriendDataManager().plusFriend(request, viewController: self)
        self.navigationController?.popViewController(animated: true)
        })
    }
    
    @IBAction func toBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setStyle(){
        mainLabel.textColor = UIColor.keepinBlack
        mainLabel.font = UIFont.GmarketSansTTF(.medium, size: 16)
        
        doneButton.tintColor = .keepinGray3
        doneButton.titleLabel?.font = .NotoSans(.bold, size: 16)
        
        lineView.backgroundColor = .keepinGray3
        
        textField.attributedPlaceholder = NSAttributedString(string: "등록할 이름을 입력해 주세요.(최대 5자)", attributes: [NSAttributedString.Key.foregroundColor: UIColor.keepinGray3])
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
     
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
     
        return updatedText.count <= 5
    }
}

extension KeepinPlusFriendVC{
    func didPlusFriend(message: String){
        print(message)
    }
}
