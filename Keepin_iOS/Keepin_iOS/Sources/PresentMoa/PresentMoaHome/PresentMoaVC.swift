//
//  PresentMoaVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import UIKit

class PresentMoaVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let searchButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        searchButton.setImage(UIImage(named: "icSearch"), for: UIControl.State.normal)
        searchButton.addTarget(self, action: #selector(toSearch), for: UIControl.Event.touchUpInside)
        searchButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        
        let searchbarButton = UIBarButtonItem(customView: searchButton)
        self.navigationItem.rightBarButtonItem = searchbarButton
    }
    
    @objc func toSearch(){
        let nextVC = SearchVC()
        let navBarOnModal: UINavigationController = UINavigationController(rootViewController: nextVC)
        navBarOnModal.modalPresentationStyle = .overFullScreen
        self.present(navBarOnModal, animated: true, completion: nil)
    }
    
    

}
 
