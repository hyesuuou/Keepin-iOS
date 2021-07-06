//
//  EmailLoginVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/05.
//

import UIKit

class EmailLoginVC: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.backgroundColor = .keepinGray1
        loginButton.tintColor = .keepinGray3
        loginButton.layer.cornerRadius = 26
        
        setTextFieldUI(tf: idTextField)
        setTextFieldUI(tf: pwTextField)
        
        
    }

    func setTextFieldUI(tf : UITextField){
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.keepinGray3.cgColor
        tf.layer.cornerRadius = 12
        tf.addLeftPadding()
    }

    

}


extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12.9, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}
