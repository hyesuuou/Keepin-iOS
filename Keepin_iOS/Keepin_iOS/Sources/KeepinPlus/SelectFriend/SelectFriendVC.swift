//
//  SelectFriendVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import UIKit

class SelectFriendVC: UIViewController {
    
    var allData : [String] = [] // 전체 데이터 (전체 친구목록)
    var filteredData : [String] = [] // 검색된 결과
    var selectedData : [String] = [] // 선택된 결과
    var searchBool : Bool = false
    
    // MARK: - IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var titleLabel: [UILabel]!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var okButton: UIButton!
    
    @IBOutlet weak var newFriendView: UIView!
    @IBOutlet weak var addFriendButton: UIButton!
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTableview()
        
        searchBar.delegate = self
        self.dismissKeyboardWhenTappedAround()
        MyPageHomeDataManager().getNumberFriend(self)
    }
    
    // MARK: - UI
    func setUI(){
        setSearchBarUI()
        titleLabel[0].font = UIFont.GmarketSansTTF(.medium, size: 16)
        titleLabel[1].font = UIFont.GmarketSansTTF(.light, size: 16)
        titleLabel[1].textColor = .keepinGray4

        okButton.tintColor = .keepinGray3
        okButton.titleLabel?.font = UIFont.NotoSans(.bold, size: 16)

        addFriendButton.titleLabel?.font = UIFont.NotoSans(.regular, size: 14)
        addFriendButton.tintColor = .keepinGreen
    }
    
    func setSearchBarUI(){
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: UIBarMetrics.default)
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            //서치바 백그라운드 컬러
            textfield.backgroundColor = UIColor.white
            //플레이스홀더 글씨 색 정하기
            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            //서치바 텍스트입력시 색 정하기
            textfield.textColor = UIColor.black
            textfield.font = UIFont.NotoSans(.regular, size: 16)
            //왼쪽 아이콘 이미지넣기
            if let leftView = textfield.leftView as? UIImageView {
                leftView.image = UIImage(named: "icSearch")
                //이미지 틴트컬러 정하기
                leftView.tintColor = UIColor.black
            }
        }
    }
    
    // MARK: - TableView
    func setTableview(){
        registerXib()
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func registerXib(){
        let friendNib = UINib(nibName: SelectFriendListTVC.identifier, bundle: nil)
        tableview.register(friendNib, forCellReuseIdentifier: SelectFriendListTVC.identifier)
        
        let titleNib = UINib(nibName: SelectFriendTitleTVC.identifier, bundle: nil)
        tableview.register(titleNib, forCellReuseIdentifier: SelectFriendTitleTVC.identifier)
        
        let messageNib = UINib(nibName: SelectFriendMessageTVC.identifier, bundle: nil)
        tableview.register(messageNib, forCellReuseIdentifier: SelectFriendMessageTVC.identifier)
    }
    
    // MARK: - IBAction
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func okButtonClicked(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load2"), object: selectedData)
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK:- SearchBar Config
extension SelectFriendVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        
        if searchText == "" {
            //filteredData = data
            searchBool = false
        }
        else {
            searchBool = true
            for name in allData {
                if name.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(name)
                }
            }
        }
        self.tableview.reloadData()
    }
}

// MARK:- Tableview Delegate
extension SelectFriendVC : UITableViewDelegate {
    
}

extension SelectFriendVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: SelectFriendListTVC.identifier, for: indexPath) as? SelectFriendListTVC
            else { return UITableViewCell()}
            cell.setDataUI(name: selectedData[indexPath.row], clicked: true)
            return cell
            
        case 1:
            if filteredData.count == 0 {
                guard let cell = tableview.dequeueReusableCell(withIdentifier: SelectFriendMessageTVC.identifier, for: indexPath) as? SelectFriendMessageTVC else {
                    return UITableViewCell()
                }
                return cell
            }
            else {
                guard let cell = tableview.dequeueReusableCell(withIdentifier: SelectFriendListTVC.identifier, for: indexPath) as? SelectFriendListTVC
                else { return UITableViewCell()}
                cell.setDataUI(name: filteredData[indexPath.row], clicked: false)
                return cell
            }
            
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2  // index 0: 선택된 친구 / index 1: 검색된 친구
    }
    
    // 각 Section 안에 rows가 몇개?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return selectedData.count
        case 1:
            if filteredData.count == 0 && searchBool == true{
                return 1
            }
            else {
                return filteredData.count
            }
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            guard let header = tableView.dequeueReusableCell(withIdentifier: SelectFriendTitleTVC.identifier) as? SelectFriendTitleTVC else {
                return UIView()
            }
            header.setData(title: "선택된 친구")
            return header
            
        case 1:
            guard let header = tableView.dequeueReusableCell(withIdentifier: SelectFriendTitleTVC.identifier) as? SelectFriendTitleTVC else {
                return UIView()
            }
            header.setData(title: "검색된 친구")
            return header
            
        default:
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if selectedData.count == 0 && filteredData.count == 0 {
            
            //okButton.tintColor = .keepinGray3
            if searchBool == false {
               // searchNoFriend.isHidden = false
                
                
                switch section {
                case 0:
                    return 0
                case 1:
                    return 0
                    
                default:
                    return 78
                }
                
            }
            
            else {
               // searchNoFriend.isHidden = false
                
                
                switch section {
                case 0:
                    return 0
                case 1:
                    return 78
                    
                default:
                    return 78
                }
            }
            
            
        }
        
        
        
        else if selectedData.count != 0  && filteredData.count == 0 {
           // searchNoFriend.isHidden = false
            //okButton.tintColor = .keepinGreen
            
            switch section {
            case 0:
                return 78
            case 1:
                return 78
            default:
                return 78
            }
            
            
        }
        
        else if selectedData.count == 0 && filteredData.count != 0 {
            //okButton.tintColor = .keepinGray3
          //  searchNoFriend.isHidden = true
            
            switch section {
            case 0:
                return 0
            case 1:
                return 78
            default:
                return 78
            }
            
            
        }
        else {
            //okButton.tintColor = .keepinGray3
          //  searchNoFriend.isHidden = true
            
            return 78
            
            
        }
        
    }
    
    
    // section 마다 내용들.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            print("먼데..")
            // 여기서 선택하면 해당 내용 filteredData에 추가 후 내용 삭제
           // filteredData.append(selectedData[indexPath.row])
            selectedData.remove(at: indexPath.row)
            
        case 1:
            // 여기서 선택하면 해당 내용 삭제 후 section 0 (selectedData에 추가)
            selectedData.append(filteredData[indexPath.row])
            filteredData.remove(at: indexPath.row)
            
        default:
            print("선택")
        }
        
        if selectedData.count != 0 {
            okButton.tintColor = .keepinGreen
        }
        else {
            okButton.tintColor = .keepinGray3
        }
        tableview.reloadData()
    }
   
    
    
}
