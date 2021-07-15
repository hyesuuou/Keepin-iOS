//
//  SelectFriendVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import UIKit

class SelectFriendVC: UIViewController {

    @IBOutlet var titleLabel: [UILabel]!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()

        // Do any additional setup after loading the view.
    }
    
    func setUI(){
        titleLabel[0].font = UIFont.GmarketSansTTF(.medium, size: 16)
        titleLabel[1].font = UIFont.GmarketSansTTF(.light, size: 16)
        titleLabel[1].textColor = .keepinGray4
    }



}
