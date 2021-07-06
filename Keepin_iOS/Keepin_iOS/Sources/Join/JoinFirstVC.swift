//
//  JoinFirstVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/06.
//

import UIKit

class JoinFirstVC: UIViewController {

    
    @IBOutlet var titleLabel: [UILabel]!
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel[0].font = UIFont.GmarketSansTTF(.medium, size: 20)
        titleLabel[1].font = UIFont.GmarketSansTTF(.medium, size: 16)
        titleLabel[2].font = UIFont.GmarketSansTTF(.medium, size: 16)
        titleLabel[3].font = UIFont.GmarketSansTTF(.medium, size: 16)
        
    }
    
    


    

}
