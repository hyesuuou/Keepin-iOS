//
//  SearchVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/02.
//

import UIKit

class SearchVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let exitButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        exitButton.setImage(UIImage(named: "icX"), for: UIControl.State.normal)
        exitButton.addTarget(self, action: #selector(dismissScreen), for: UIControl.Event.touchUpInside)
        exitButton.frame = CGRect(x: -14, y: 0, width: 40, height: 40)

        let exitbarButton = UIBarButtonItem(customView: exitButton)
        let negativeSpacer:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.fixedSpace, target: nil, action: nil)
            negativeSpacer.width = -10
        self.navigationItem.leftBarButtonItems = [negativeSpacer,exitbarButton]
    }
    
    @objc func dismissScreen(){
        self.dismiss(animated: true, completion: nil)
    }

}
