//
//  KeepinPlusWriteTVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/10.
//

import UIKit

class KeepinPlusWriteTVC: UITableViewCell, UITextViewDelegate {
    
    public static let identifier = "KeepinPlusWriteTVC"
    let dummyText : String = ""
    
    @IBOutlet weak var textfieldView: UITextView!
    @IBOutlet weak var textfieldContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textfieldContainer.layer.cornerRadius = 12
        textfieldContainer.layer.borderWidth = 1
        textfieldContainer.layer.borderColor = UIColor.keepinGray3.cgColor
        //textfield.addLeftPadding()
        textfieldView.font = UIFont.NotoSans(.regular, size: 14)
        
//        textfieldView.translatesAutoresizingMaskIntoConstraints = true
//        textfieldView.sizeToFit()
        
        // 텍스트가 있으면
        if dummyText == "" {
            placeholderSetting()
        }
        else {
        // 텍스트가 없으면
            textfieldView.text = dummyText
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func placeholderSetting() {
        textfieldView.delegate = self // txtvReview가 유저가 선언한 outlet
        textfieldView.text = "선물을 주고받은 상황, 느낌 등을 기록해 보세요!"
        textfieldView.textColor = UIColor.lightGray
            
        }
        
        
        // TextView Place Holder
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == UIColor.lightGray {
                textView.text = nil
                textView.textColor = UIColor.black
            }
            
        }
        // TextView Place Holder
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.isEmpty {
                textView.text = "선물을 주고받은 상황, 느낌 등을 기록해 보세요!"
                textView.textColor = UIColor.lightGray
            }
        }
    
    
    // 글자수제한
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            guard let str = textView.text else { return true }
           let newLength = str.count + text.count - range.length
           return newLength <= 200
       
    }

}
