//
//  MyPageProfileVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/09.
//

import UIKit
import SafariServices
import MessageUI

class MyPageProfileVC: UIViewController, MFMailComposeViewControllerDelegate {
    
    var serverData: ProfileData?

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
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    
    @IBOutlet var KeepinInfo: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setText()
        naviagationBar()
        setGesture()
        
        MyPageProfileDataManager().getProfileInfo(viewcontroller: self)
    }
    
    
    func setGesture(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(toNameEdit(sender:)))
        nameView.addGestureRecognizer(gesture)
        
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(toPWEdit(sender:)))
        passwordView.addGestureRecognizer(gesture2)
        
        let gesture3 = UITapGestureRecognizer(target: self, action: #selector(toPhoneEdit(sender:)))
        phoneView.addGestureRecognizer(gesture3)
        
        let gesture4 = UITapGestureRecognizer(target: self, action: #selector(toTeamKeepin(sender:)))
        KeepinInfo[3].addGestureRecognizer(gesture4)
        
        let gestrue5 = UITapGestureRecognizer(target: self, action: #selector(toService(sender:)))
        KeepinInfo[0].addGestureRecognizer(gestrue5)
        
        let gesture6 = UITapGestureRecognizer(target: self, action: #selector(toPrivacy(sender:)))
        KeepinInfo[1].addGestureRecognizer(gesture6)
        
        let gesture7 = UITapGestureRecognizer(target: self, action: #selector(toMail(sender:)))
        KeepinInfo[2].addGestureRecognizer(gesture7)
        
    }
    
    func setText(){
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
        
        emailLabel.font = UIFont.NotoSans(.regular, size: 16)
        emailLabel.textColor = .keepinGray4
        
        birthLabel.font = UIFont.NotoSans(.regular, size: 16)
        birthLabel.textColor = .keepinGray4
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
    
    @objc func toTeamKeepin(sender: UITapGestureRecognizer){
        self.navigationController?.pushViewController(TeamKeepinVC(), animated: true)
    }
    
    @objc func toService(sender: UITapGestureRecognizer){
        let serviceUrl = NSURL(string: "https://fluff-munchkin-8cc.notion.site/4c1b2962dcaf45a1a4863a18c08261e8")
        let serviceSafriView: SFSafariViewController = SFSafariViewController(url: serviceUrl as! URL)
        
        self.present(serviceSafriView, animated: true, completion: nil)
    }
    
    @objc func toPrivacy(sender: UITapGestureRecognizer){
        let privacyURL = NSURL(string: "https://fluff-munchkin-8cc.notion.site/99ea54ae24564b289da492cc4b5d7c61")
        let privacySafriView: SFSafariViewController = SFSafariViewController(url: privacyURL as! URL)
        self.present(privacySafriView, animated: true, completion: nil)
    }
    
    @objc func toMail(sender: UITapGestureRecognizer) {
       
        if MFMailComposeViewController.canSendMail(){
            let emailVC = MFMailComposeViewController()
            emailVC.mailComposeDelegate = self
            
            emailVC.setToRecipients(["keepinofficial@gmail.com"])
            emailVC.setSubject("메세지 제목")
            emailVC.setMessageBody("메세지 컨텐츠", isHTML: false)
            
            self.present(emailVC, animated: true, completion: nil)
            
        }else{
            self.showSendMailErrorAlert()
        }
        
    }
    
    func showSendMailErrorAlert(){
        let sendMailErrorAlert = UIAlertController(title: "메일 전송 실패", message: "아이폰 이메일 설정을 확인하고 다시 시도해주세요", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default){
            (action) in
            print("확인")
        }
        
        sendMailErrorAlert.addAction(confirmAction)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func naviagationBar(){
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func toBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func logout(_ sender: Any) {
        let alert = UIAlertController(title: "다시 키핀하려면 로그인 해야 합니다.\n 로그아웃하시겠습니까?", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        let cancelAction = UIAlertAction(title: "취소", style: .default, handler: nil)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        let alert = UIAlertController(title: "계정 삭제 시 키핀한 기록이 모두 삭제됩니다.\n정말 삭제하시겠습니까?", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        let cancelAction = UIAlertAction(title: "취소", style: .default, handler: nil)
        let okAction = UIAlertAction(title: "확인", style: .default, handler:nil)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

extension MyPageProfileVC{
    func didSuccessProfileInfo(message: String){
        emailLabel.text = serverData?.email
        birthLabel.text = serverData?.birth
        
        print(message)
    }
}
