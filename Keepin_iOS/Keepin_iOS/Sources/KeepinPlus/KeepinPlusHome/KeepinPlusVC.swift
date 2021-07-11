//
//  KeepinPlusVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import UIKit

class KeepinPlusVC: UIViewController {

    var select : Int = 0
    
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
        
        let nameNib = UINib(nibName: KeepinPlusSearchTVC.identifier, bundle: nil)
        tableview.register(nameNib, forCellReuseIdentifier: KeepinPlusSearchTVC.identifier)
        
        let selectNib = UINib(nibName: KeppinPlusSelectTVC.identifier, bundle: nil)
        tableview.register(selectNib, forCellReuseIdentifier: KeppinPlusSelectTVC.identifier)
        
        let writeNib = UINib(nibName: KeepinPlusWriteTVC.identifier, bundle: nil)
        tableview.register(writeNib, forCellReuseIdentifier: KeepinPlusWriteTVC.identifier)
        
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
        return 14
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
            
        case 5:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeppinPlusSelectTVC.identifier, for: indexPath) as? KeppinPlusSelectTVC else {
                return UITableViewCell()
            }
            cell.setButtonUI(select: select)
            cell.button[0].addTarget(self, action: #selector(selectGetButtonClicked(_:)), for: .touchUpInside)
            cell.button[1].addTarget(self, action: #selector(selectGiveButtonClicked(_:)), for: .touchUpInside)
            return cell
            
        case 6:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusTitleTVC.identifier, for: indexPath) as? KeepinPlusTitleTVC else {
                return UITableViewCell()
            }
            cell.setData(title: "누구에게 받은 선물인가요?", subtitle: "", image: true)
            
            
            return cell
            
        case 7:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusSearchTVC.identifier, for: indexPath) as? KeepinPlusSearchTVC else {
                return UITableViewCell()
            }
            
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
            
        case 13:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusWriteTVC.identifier, for: indexPath) as? KeepinPlusWriteTVC else {
                return UITableViewCell()
            }
            
            return cell
        
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 1:
            return 72
            
        case 5:
            return 85
            
        case 7:
            return 75
            
        case 13:
            return 234
            
            
        default:
            return 43
        }
    }
    
    
}

extension KeepinPlusVC {
    
    // 어떤 선물인가요? - '받은' 버튼 눌렀을 때
    @objc
    func selectGetButtonClicked(_ sender : UIButton){
        print("바뀐다")
        select = 0
        tableview.reloadData()
        
    }
    
    // 어떤 선물인가요? - '준' 버튼 눌렀을 때
    @objc
    func selectGiveButtonClicked(_ sender : UIButton){
        select = 1
        tableview.reloadData()
    }
}
