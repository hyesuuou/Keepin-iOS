//
//  EmailLoginVC.swift
//  Keepin_iOS
//
//  Created by 김혜수 on 2021/07/05.
//

import UIKit

class EmailLoginVC: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.backgroundColor = .keepinGray1
        loginButton.tintColor = .keepinGray3
        loginButton.layer.cornerRadius = 26
        // Do any additional setup after loading the view.
    }


    

}
