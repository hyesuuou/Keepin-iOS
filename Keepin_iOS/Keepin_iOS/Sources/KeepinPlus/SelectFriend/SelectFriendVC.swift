//
//  SelectFriendVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import UIKit

class SelectFriendVC: UIViewController {
    
    /// 친구의 아이디를 받아오기 위한..
    var allFriend: [Friend] = [] // 전체 친구
    var filteredFriend: [Friend] = [] // 검색된 친구
    
    var notSelectedFriend: [Friend] = [] // 선택되지 않은 친구
    var selectedFriend: [Friend] = [] // 선택된 친구
    
    var searchBool : Bool = false
    
    // MARK: - IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var titleLabel: [UILabel]!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var okButton: UIButton!
    
    @IBOutlet weak var newFriendView: UIView!
    @IBOutlet weak var addFriendButton: UIButton!
    
    // MARK: - View LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        print("친구선택뷰 viewWillAppear")
        selectedFriend = []
        searchBar.text = ""
        MyPageHomeDataManager().getNumberFriend(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        searchBar.delegate = self
        self.dismissKeyboardWhenTappedAround()
        
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
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "selectFriend"), object: selectedFriend) // 여기 고쳐야함
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func newFriendButtonClicked(_ sender: Any) {
        let newFriendVC = KeepinPlusFriendVC()
        self.navigationController?.pushViewController(newFriendVC, animated: true)
    }
}

// MARK:- SearchBar Config
extension SelectFriendVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredFriend = []
        
        /// 검색창에 글자가 없을 때
        if searchText == "" {
            filteredFriend = notSelectedFriend
            searchBool = false
        }
        /// 검색창에 글자가 있을 때 (검색했을 때)
        else {
            searchBool = true
            for friend in notSelectedFriend {
                if friend.name.lowercased().contains(searchText.lowercased()) {
                    filteredFriend.append(friend)
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
    
    // MARK: Row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        
        /// 선택된 친구
        case 0:
            if selectedFriend.count == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SelectFriendMessageTVC.identifier, for: indexPath) as? SelectFriendMessageTVC else {
                    return UITableViewCell()
                }
                cell.setData(message: "선택된 친구가 없습니다.")
                return cell
            } else {
                guard let cell = tableview.dequeueReusableCell(withIdentifier: SelectFriendListTVC.identifier, for: indexPath) as? SelectFriendListTVC
                else { return UITableViewCell()}
                cell.setDataUI(name: selectedFriend[indexPath.row].name, clicked: true)
                return cell
            }
        /// 검색된 친구
        case 1:
            /// 검색결과 없는 경우 -> '선택된 친구 없습니다' 메시지 띄우기
            if filteredFriend.count == 0 {
                guard let cell = tableview.dequeueReusableCell(withIdentifier: SelectFriendMessageTVC.identifier, for: indexPath) as? SelectFriendMessageTVC else {
                    return UITableViewCell()
                }
                cell.setData(message: "검색된 친구가 없습니다.")
                return cell
            }
            /// 검색결과 있는 경우 -> 검색된 목록 보여주기
            else {
                guard let cell = tableview.dequeueReusableCell(withIdentifier: SelectFriendListTVC.identifier, for: indexPath) as? SelectFriendListTVC
                else { return UITableViewCell()}
                cell.setDataUI(name: filteredFriend[indexPath.row].name, clicked: false)
                return cell
            }
        case 2:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: SelectFriendListTVC.identifier, for: indexPath) as? SelectFriendListTVC
            else { return UITableViewCell()}
            cell.setDataUI(name: allFriend[indexPath.row].name, clicked: false)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    // MARK: Section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2  // index 0: 선택된 친구 / index 1: 검색된 친구
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        /// 선택된 친구
        case 0:
            if selectedFriend.count == 0 {
                return 1
            } else {
            return selectedFriend.count
            }
        /// 검색된 친구
        case 1:
           
            /// 검색했는데 (searchBool == true) 아무도없으면 (filteredData.count == 0) 메시지 띄워주는 셀 보여주기
            if filteredFriend.count == 0 && searchBool == true{
                return 1
            }
            else {
                return filteredFriend.count
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
            
            if searchBool == false || searchBar.text == "" {
                guard let header = tableView.dequeueReusableCell(withIdentifier: SelectFriendTitleTVC.identifier) as? SelectFriendTitleTVC else {
                    return UIView()
                }
                header.setData(title: "친구 리스트")
                return header
            } else {
                guard let header = tableView.dequeueReusableCell(withIdentifier: SelectFriendTitleTVC.identifier) as? SelectFriendTitleTVC else {
                    return UIView()
                }
                header.setData(title: "검색된 친구")
                return header
            }
 
        default:
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 78
    }
    
    
    /// 해당 Row를 선택했을 때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            if searchBool == true {
            /// 여기서 선택하면 searchBar에 있는 text가 포함되어있는지 확인 후 포함되어 있으면
                if selectedFriend[indexPath.row].name.contains(searchBar.text ?? "") {
                    filteredFriend.insert(selectedFriend[indexPath.row], at: 0)
                    //filteredFriend.append(selectedFriend[indexPath.row])
                }
            } else {
                filteredFriend.insert(selectedFriend[indexPath.row], at: 0)
            }
            notSelectedFriend.insert(selectedFriend[indexPath.row], at: 0)
           // notSelectedFriend.append(selectedFriend[indexPath.row])
            selectedFriend.remove(at: indexPath.row)
            
        case 1:
            /// 여기서 선택하면 해당 내용 삭제 후 section 0 (selectedData에 추가)
            selectedFriend.append(filteredFriend[indexPath.row])
            /// 해당 값의 인덱스 찾기
            notSelectedFriend.remove(at: notSelectedFriend.firstIndex { friend in
                friend.name == filteredFriend[indexPath.row].name
            }!)
            filteredFriend.remove(at: indexPath.row)
            
        default:
            print("선택")
        }
        
        if selectedFriend.count != 0 {
            okButton.tintColor = .keepinGreen
        }
        else {
            okButton.tintColor = .keepinGray3
        }
        tableview.reloadData()
        
        print("selectedList: ", selectedFriend)
        print("not selectedList: ", notSelectedFriend)
    }
    
}

extension SelectFriendVC {
    func successConnect(){
        setTableview()
        filteredFriend = allFriend
        notSelectedFriend = allFriend
        tableview.reloadData()
    }
}
