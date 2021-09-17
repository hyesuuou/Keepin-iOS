//
//  TeamKeepinVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/09/17.
//

import UIKit



class TeamKeepinVC: UIViewController {
    
    
    @IBOutlet weak var TeamKeepin: UILabel!
    @IBOutlet var partName: [UILabel]!
    
    @IBOutlet var name: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    @IBAction func pop(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func setUI(){
        for i in 0...4{
            partName[i].font = UIFont.GmarketSansTTF(.medium, size: 16)
            partName[i].textColor = .keepinBlack
        }
        
        TeamKeepin.font = UIFont.GmarketSansTTF(.medium, size: 20)
        TeamKeepin.textColor = .keepinBlack
        
        for i in 0...14{
            name[i].font = UIFont.NotoSans(.regular, size: 14)
            name[i].textColor = .keepinGray5
        }
        
    }


  

}
