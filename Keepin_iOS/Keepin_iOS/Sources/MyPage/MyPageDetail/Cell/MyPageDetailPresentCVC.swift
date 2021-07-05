//
//  MyPageDetailPresentCVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/07/05.
//

import UIKit

class MyPageDetailPresentCVC: UICollectionViewCell {
    
    public static let identifier = "MyPageDetailPresentCVC"
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var memoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textView.backgroundColor = .keepinGray
        textView.layer.cornerRadius = 12
        memoLabel.text = "친구 메모"
        
    }

}
