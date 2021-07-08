//
//  MyPageDetailPresentCVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/05.
//

import UIKit

class MyPageDetailPresentCVC: UICollectionViewCell,UITextViewDelegate {
    
    public static let identifier = "MyPageDetailPresentCVC"
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var memoLabel: UILabel!
    @IBOutlet weak var memoView: UIView!
    @IBOutlet weak var lineCount: UILabel!
    @IBOutlet weak var numberLine: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        memoView.backgroundColor = .keepinGray
        textView.backgroundColor = .keepinGray
        memoView.layer.cornerRadius = 12
        memoLabel.text = "친구 메모"
        memoLabel.font = .GmarketSansTTF(.medium, size: 15)
        textView.textContainer.maximumNumberOfLines = 5
        textView.font = .NotoSans(.regular, size: 14)
        textView.textColor = .keepinGray5
        
        lineCount.text = "/5줄"
        lineCount.font = .NotoSans(.regular, size: 11)
        
        numberLine.text = "3"
        numberLine.font = .NotoSans(.regular, size: 11)
        
        placeholderSetting()
        textViewDidBeginEditing(textView)
        textViewDidEndEditing(textView)
    }
    
    
    func placeholderSetting(){
        textView.delegate = self
        textView.text = "친구의 취향을 기록해보세요.\n최대 5줄까지 입력 가능합니다."
        textView.textColor = .keepinGray5
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty{
            textView.text = "친구의 취향을 기록해보세요.\n최대 5줄까지 입력 가능합니다."
            textView.textColor = .keepinGray5
        }
    }
}
