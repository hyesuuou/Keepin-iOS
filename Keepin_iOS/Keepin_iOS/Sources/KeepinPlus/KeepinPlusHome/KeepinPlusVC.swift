//
//  KeepinPlusVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import UIKit

class KeepinPlusVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
    }


    func setNavigationBar(){
        let dismissButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        dismissButton.setImage(UIImage(named: "icX"), for: UIControl.State.normal)
        dismissButton.addTarget(self, action: #selector(toDismiss), for: UIControl.Event.touchUpInside)
        dismissButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        let dismissbarButton = UIBarButtonItem(customView: dismissButton)
        self.navigationItem.leftBarButtonItem = dismissbarButton
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    @objc func toDismiss(){
        self.dismiss(animated: true, completion: nil)
        print("dismiss")
    }

}
