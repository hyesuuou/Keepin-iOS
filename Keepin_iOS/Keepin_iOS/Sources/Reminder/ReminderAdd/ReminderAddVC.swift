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
    
    var list = ["당일 (오전 9:00)",
                "1일 전 (오전 9:00)",
                "2일 전 (오전 9:00)",
                "3일 전 (오전 9:00)",
                "1주일 전 (오전 9:00)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dismissKeyboardWhenTappedAround()
        
        setUI()
        setNavigationBar()
        eventTextField.delegate = self
    }
    
    func nonactivatedDoneButton(){
        let doneButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        doneButton.setTitle("완료", for: .normal)
        doneButton.titleLabel?.font = UIFont.NotoSans(.regular, size: 16)
        doneButton.setTitleColor(.keepinGray4, for: .normal)
        doneButton.frame = CGRect(x: 0, y: 0, width: 30, height: 22)
        
        let donebarButton = UIBarButtonItem(customView: doneButton)
        self.navigationItem.rightBarButtonItem = donebarButton
    }
    
    func activatedDoneButton(){
        let doneButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        doneButton.setTitle("완료", for: .normal)
        doneButton.titleLabel?.font = UIFont.NotoSans(.regular, size: 16)
        doneButton.setTitleColor(.keepinGreen, for: .normal)
        doneButton.addTarget(self, action: #selector(toDone), for: UIControl.Event.touchUpInside)
        doneButton.frame = CGRect(x: 0, y: 0, width: 30, height: 22)
        
        let donebarButton = UIBarButtonItem(customView: doneButton)
        self.navigationItem.rightBarButtonItem = donebarButton
    }
    
    @objc func toDone(){
        self.presentAlert(title: "", message: "이벤트가 등록되었습니다", isCancelActionIncluded: true) { action in
                self.dismiss(animated: true, completion: nil)
            }
    }
    
    func setNavigationBar(){
        let dismissButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        dismissButton.setImage(UIImage(named: "icX"), for: UIControl.State.normal)
        dismissButton.addTarget(self, action: #selector(toDismiss), for: UIControl.Event.touchUpInside)
        dismissButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    
        let dismissbarButton = UIBarButtonItem(customView: dismissButton)
        self.navigationItem.leftBarButtonItem = dismissbarButton
        
        nonactivatedDoneButton()
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    @objc func toDismiss(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func setUI(){
        eventTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        
        dividerView[0].backgroundColor = .keepinGray3
        dividerView[1].backgroundColor = .keepinGray3
        
        dateLabel.isUserInteractionEnabled = true
        remindLabel.isUserInteractionEnabled = true
        
        dateLabel.text = Date().toString()
        remindLabel.text = "당일"
        
        let dateTapGesture = UITapGestureRecognizer(target:self,action:#selector(dateTap))
        dateLabel.addGestureRecognizer(dateTapGesture)
        
        let remindTapGesture = UITapGestureRecognizer(target:self,action:#selector(remindTap))
        remindLabel.addGestureRecognizer(remindTapGesture)
        
        remindSwitch.isOn = true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text == ""{
            nonactivatedDoneButton()
        }
        else{
            activatedDoneButton()
        }
    }
    
    //데이트피커 실시간 반영 selector
    @objc func onDatePickerValueChanged(datePicker: UIDatePicker) {
        dateLabel.text = datePicker.date.toString()
    }
    
    //오늘날짜를 터치하면
    @objc func dateTap() {
        self.setDatePicker(selector: #selector(onDatePickerValueChanged))
    }

    //리마인드 터치하면
    @objc func remindTap() {
        let tempInput = UITextField( frame:CGRect.zero )
        
        let myPicker = UIPickerView()
        tempInput.inputView = myPicker
        self.view.addSubview( tempInput )
        tempInput.becomeFirstResponder()
                
        myPicker.delegate = self
        myPicker.dataSource = self
    }

}

extension ReminderAddVC : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       guard let text = textField.text else { return true }
       let newLength = text.count + string.count - range.length
        return newLength <= 10
    }
}

extension ReminderAddVC : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        remindLabel.text = String(list[row].prefix(list[row].count - 9))
    }
}

