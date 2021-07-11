//
//  MyPageProfileVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/09.
//

import UIKit

class MyPageProfileVC: UIViewController {

    @IBOutlet weak var profileEdit: UILabel!
    @IBOutlet weak var keepinLabel: UILabel!
    @IBOutlet weak var lineView1: UIView!
    @IBOutlet weak var lineView2: UIView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var birth: UILabel!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var logout: UIButton!
    @IBOutlet weak var delete: UIButton!
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var phoneView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lineView1.backgroundColor = .keepinGray4
        lineView2.backgroundColor = .keepinGray4
        profileEdit.font = UIFont.GmarketSansTTF(.medium, size: 20)
        keepinLabel.font = UIFont.GmarketSansTTF(.medium, size: 20)
        
        name.font = UIFont.NotoSans(.regular, size: 16)
        password.font = UIFont.NotoSans(.regular, size: 16)
        phone.font = UIFont.NotoSans(.regular, size: 16)
        email.font = UIFont.NotoSans(.regular, size: 16)
        birth.font = UIFont.NotoSans(.regular, size: 16)
        
        label1.font = UIFont.NotoSans(.regular, size: 16)
        label2.font = UIFont.NotoSans(.regular, size: 16)
        label3.font = UIFont.NotoSans(.regular, size: 16)
        label4.font = UIFont.NotoSans(.regular, size: 16)
        
        logout.setTitleColor(.keepinGray4, for: .normal)
        
        delete.setTitleColor(.keepinGray4, for: .normal)
        
        naviagationBar()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(toNameEdit(sender:)))
        nameView.addGestureRecognizer(gesture)
        
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(toPWEdit(sender:)))
        passwordView.addGestureRecognizer(gesture2)
        
        let gesture3 = UITapGestureRecognizer(target: self, action: #selector(toPhoneEdit(sender:)))
        phoneView.addGestureRecognizer(gesture3)
    }

    @objc func toNameEdit(sender: UITapGestureRecognizer){
        self.navigationController?.pushViewController(MyPageEditNameVC(), animated: true)
    }
    
    @objc func toPWEdit(sender: UITapGestureRecognizer){
        self.navigationController?.pushViewController(MyPageEditPwVC(), animated: true)
    }
    
    @objc func toPhoneEdit(sender: UITapGestureRecognizer){
        self.navigationController?.pushViewController(MyPageEditPhoneVC(), animated: true)
    }
    
    func naviagationBar(){
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func toBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func logout(_ sender: Any) {
        let alert = UIAlertController(title: "다시 키핀하려면 로그인 해야 합니다. 로그아웃하시겠습니까?", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        let cancelAction = UIAlertAction(title: "취소", style: .default, handler: nil)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        
        
    }
    
}
