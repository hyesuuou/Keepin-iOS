//
//  MyPageEditPwVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/11.
//

import UIKit

class MyPageEditPwVC: UIViewController {

    @IBOutlet weak var line1: UIView!
    @IBOutlet weak var line2: UIView!
    @IBOutlet weak var line3: UIView!

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    
    @IBOutlet weak var animateView: UIView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var animateView2: UIView!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var animateView3: UIView!
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setAddTarget()
    }
    
    func setStyle(){
        line1.backgroundColor = .keepinGray4
        line2.backgroundColor = .keepinGray4
        line3.backgroundColor = .keepinGray4
        
        label1.textColor = .keepinGray4
        label2.textColor = .keepinGray4
        label3.textColor = .keepinGray4
        
        doneButton.titleLabel?.font = UIFont.NotoSans(.bold, size: 16)
        doneButton.tintColor = .keepinGray3
    }
    
    func setAddTarget(){
        textField1.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        
        textField2.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        
        textField3.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }

    @IBAction func toBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @objc func textFieldDidChange(_ sender: Any?){
        if textField1.text != ""{
            UIView.animate(withDuration: 0.0001){
                let trans = CGAffineTransform(translationX: 0, y: -20)
                self.label1.textColor = .keepinBlack
                
                self.animateView.transform = trans
            }
        }
        
        if textField2.text != ""{
            UIView.animate(withDuration: 0.001){
                let trans = CGAffineTransform(translationX: 0, y: -20)
                self.label2.textColor = .keepinBlack
                self.animateView2.transform = trans
            }
        }
        
        if textField3.text != ""{
            UIView.animate(withDuration: 0.001){
                let trans = CGAffineTransform(translationX: 0, y: -20)
                self.label3.textColor = .keepinBlack
                self.animateView3.transform = trans
            }
        }
        
        if textField1.text != "" && textField2.text != "" && textField3.text != ""{
            doneButton.tintColor = .keepinGreen
        }
    }
    
}
