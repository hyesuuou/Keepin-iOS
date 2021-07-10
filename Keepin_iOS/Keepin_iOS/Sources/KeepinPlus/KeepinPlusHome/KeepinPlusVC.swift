//
//  KeepinPlusVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import UIKit

class KeepinPlusVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        setTableview()
        registerXib()
    }
    
    func setTableview(){
        tableview.delegate = self
        tableview.dataSource = self
        tableview.allowsSelection = false
    }
    
    func registerXib(){
        let titleNib = UINib(nibName: KeepinPlusTitleTVC.identifier, bundle: nil)
        tableview.register(titleNib, forCellReuseIdentifier: KeepinPlusTitleTVC.identifier)
        
        let inputNib = UINib(nibName: KeepinPlusInputTVC.identifier, bundle: nil)
        tableview.register(inputNib, forCellReuseIdentifier: KeepinPlusInputTVC.identifier)
        
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

extension KeepinPlusVC : UITableViewDelegate {
    
}

extension KeepinPlusVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusTitleTVC.identifier, for: indexPath) as? KeepinPlusTitleTVC else {
                return UITableViewCell()
            }
            cell.setData(title: "선물에 이름을 붙여주세요.", subtitle: "", image: true)
            
            return cell
        
        case 1:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusInputTVC.identifier, for: indexPath) as? KeepinPlusInputTVC else {
                return UITableViewCell()
            }
            cell.setData(placeholder: "키핀이가 준 선물")
            return cell
            
        case 2:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusTitleTVC.identifier, for: indexPath) as? KeepinPlusTitleTVC else {
                return UITableViewCell()
            }
            cell.setData(title: "사진을 등록해주세요", subtitle: "(최대 3장)", image: true)
            
            return cell
            
        case 4:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusTitleTVC.identifier, for: indexPath) as? KeepinPlusTitleTVC else {
                return UITableViewCell()
            }
            cell.setData(title: "어떤 선물인가요?", subtitle: "", image: true)
            
            return cell
            
        case 6:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusTitleTVC.identifier, for: indexPath) as? KeepinPlusTitleTVC else {
                return UITableViewCell()
            }
            cell.setData(title: "누구에게 받은 선물인가요?", subtitle: "", image: true)
            
            return cell
        
        case 8:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusTitleTVC.identifier, for: indexPath) as? KeepinPlusTitleTVC else {
                return UITableViewCell()
            }
            cell.setData(title: "언제 받은 선물인가요?", subtitle: "", image: true)
            
            return cell
            
        case 10:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusTitleTVC.identifier, for: indexPath) as? KeepinPlusTitleTVC else {
                return UITableViewCell()
            }
            cell.setData(title: "선물 카테고리를 선택해주세요", subtitle: "(최대 2개)", image: false)
            
            return cell
            
        case 12:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusTitleTVC.identifier, for: indexPath) as? KeepinPlusTitleTVC else {
                return UITableViewCell()
            }
            cell.setData(title: "더 잘 키핀해볼까요?", subtitle: "", image: false)
            
            return cell
        
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 1:
            return 72
        default:
            return 43
        }
    }
    
    
}
