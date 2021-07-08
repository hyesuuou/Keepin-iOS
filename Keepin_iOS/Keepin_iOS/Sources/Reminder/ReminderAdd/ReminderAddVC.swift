//
//  ReminderAddVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/09.
//

import UIKit

class ReminderAddVC: UIViewController {

    @IBOutlet weak var eventTextField: UITextField!
    @IBOutlet var dividerView: [UIView]!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var remindLabel: UILabel!
    @IBOutlet weak var remindSwitch: UISwitch!
    
    @IBAction func importantButtonClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setNavigationBar()
    }

    func setUI(){
        dividerView[0].backgroundColor = .keepinGray3
        dividerView[1].backgroundColor = .keepinGray3
        
        dateLabel.isUserInteractionEnabled = true
        remindLabel.isUserInteractionEnabled = true
        
        let dateTapGesture = UITapGestureRecognizer(target:self,action:#selector(self.dateTap))
        dateLabel.addGestureRecognizer(dateTapGesture)
        
        let remindTapGesture = UITapGestureRecognizer(target:self,action:#selector(self.remindTap))
        remindLabel.addGestureRecognizer(remindTapGesture)
        
        remindSwitch.isOn = true
    }
    
    @objc func dateTap() {
        print("date")
    }
    
    @objc func remindTap() {
        print("remind")
    }
    
    
    func setNavigationBar(){
        let dismissButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        dismissButton.setImage(UIImage(named: "icX"), for: UIControl.State.normal)
        dismissButton.addTarget(self, action: #selector(toDismiss), for: UIControl.Event.touchUpInside)
        dismissButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        let doneButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        doneButton.setTitle("완료", for: .normal)
        doneButton.titleLabel?.font = UIFont.NotoSans(.regular, size: 16)
        doneButton.setTitleColor(.keepinGray4, for: .normal)
        doneButton.addTarget(self, action: #selector(toDone), for: UIControl.Event.touchUpInside)
        doneButton.frame = CGRect(x: 0, y: 0, width: 30, height: 22)
        
        let dismissbarButton = UIBarButtonItem(customView: dismissButton)
        self.navigationItem.leftBarButtonItem = dismissbarButton
        
        let donebarButton = UIBarButtonItem(customView: doneButton)
        self.navigationItem.rightBarButtonItem = donebarButton
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    @objc func toDismiss(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func toDone(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
