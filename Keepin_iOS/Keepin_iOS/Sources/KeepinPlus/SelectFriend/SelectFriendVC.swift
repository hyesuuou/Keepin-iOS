//
//  SelectFriendVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import UIKit

class SelectFriendVC: UIViewController {

    @IBOutlet var titleLabel: [UILabel]!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTableview()
        registerXib()
    }
    
    func setUI(){
        titleLabel[0].font = UIFont.GmarketSansTTF(.medium, size: 16)
        titleLabel[1].font = UIFont.GmarketSansTTF(.light, size: 16)
        titleLabel[1].textColor = .keepinGray4
    }
    
    func setTableview(){
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func registerXib(){
        let friendNib = UINib(nibName: SelectFriendListTVC.identifier, bundle: nil)
        tableview.register(friendNib, forCellReuseIdentifier: SelectFriendListTVC.identifier)
    }
    
}

extension SelectFriendVC : UITableViewDelegate {
    
}

extension SelectFriendVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: SelectFriendListTVC.identifier, for: indexPath) as? SelectFriendListTVC else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    
}
