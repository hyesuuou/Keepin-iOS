//
//  PwFindVC.swift
//  Keepin_iOS
//
//  Created by 이은영 on 2021/09/24.
//

import UIKit

class PwFindVC: UIViewController {
    
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        // Do any additional setup after loading the view.
    }

    @IBAction func toBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setUI(){
        
        doneButton.tintColor = .keepinGray3
        doneButton.titleLabel?.font = UIFont.NotoSans(.bold, size: 16)
        
        titleLabel.text = "비밀번호 찾기"
        subtitleLabel.text = "가입 시 입력한 이메일로 \n임시 비밀번호를 보내드립니다."
        titleLabel.textColor = .keepinBlack
        subtitleLabel.textColor = .keepinBlack
        titleLabel.font = UIFont.GmarketSansTTF(.medium, size: 20)
        subtitleLabel.font = UIFont.GmarketSansTTF(.medium, size: 16)
        lineView.backgroundColor = .keepinGray3
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
