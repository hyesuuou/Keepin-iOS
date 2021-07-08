//
//  MyPageVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import UIKit

class MyPageVC: UIViewController {
    
    @IBOutlet weak var nameLabel1: UILabel!
    @IBOutlet weak var nameLabel2: UILabel!
    @IBOutlet weak var presentView: UIView!
    @IBOutlet weak var lineView1: UIView!
    @IBOutlet weak var lineView2: UIView!
    
    @IBOutlet weak var allPresent: UILabel!
    @IBOutlet weak var receivePresent: UILabel!
    @IBOutlet weak var givePresent: UILabel!
    
    @IBOutlet weak var number1: UILabel!
    @IBOutlet weak var number2: UILabel!
    @IBOutlet weak var number3: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    let friendName = ["쓰리준","실버영","씨워터","박윤정","이채연","정서현","최고","박윤경","김영민","김보민","화이팅","키핀이들"]
    
    let header = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 77))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false

        tableView.register(MyPageTVC.nib(), forCellReuseIdentifier: "MyPageTVC")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.tableHeaderView = header
        
        let headerLabel = UILabel(frame: header.bounds)
        headerLabel.text = "친구 모아보기"
        headerLabel.font = UIFont.GmarketSansTTF(.medium, size: 18)
        header.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.leftAnchor.constraint(equalTo: header.leftAnchor, constant: 24).isActive = true
        headerLabel.topAnchor.constraint(equalTo: header.topAnchor, constant: 32).isActive = true
        
        let headerButton = UIButton()
        headerButton.setImage(UIImage(named: "icAdd.png"), for: .normal)
        header.addSubview(headerButton)
        headerButton.translatesAutoresizingMaskIntoConstraints = false
        headerButton.leftAnchor.constraint(equalTo: header.leftAnchor, constant: 327).isActive = true
        headerButton.topAnchor.constraint(equalTo: header.topAnchor, constant: 31).isActive = true

        
        nameLabel1.font = UIFont.GmarketSansTTF(.medium, size: 20)
        nameLabel1.textColor = .keepinGreen
        nameLabel2.font = UIFont.GmarketSansTTF(.medium, size: 20)
        
        presentView.backgroundColor = .keepinGray
        presentView.layer.cornerRadius = 12
        
        lineView1.backgroundColor = .keepinGray4
        lineView2.backgroundColor = .keepinGray4
        
        allPresent.font = UIFont.NotoSans(.regular, size: 14)
        receivePresent.font = UIFont.NotoSans(.regular, size: 14)
        givePresent.font = UIFont.NotoSans(.regular, size: 14)
        
        number1.font = UIFont.NotoSans(.bold, size: 16)
        number2.font = UIFont.NotoSans(.bold, size: 16)
        number3.font = UIFont.NotoSans(.bold, size: 16)
        
        number1.textColor = .keepinGreen
        number2.textColor = .keepinGreen
        number3.textColor = .keepinGreen
        
        tableView.backgroundColor = .keepinGray
    }

}

extension MyPageVC : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(MyPageDetailVC(), animated: true)
    }
    
}

extension MyPageVC : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendName.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageTVC.identifier, for: indexPath) as? MyPageTVC else {return UITableViewCell()}
        
        //cell.backgroundColor = .keepinGray
        cell.textLabel?.font = UIFont.GmarketSansTTF(.medium, size: 16)
        cell.layer.cornerRadius = 12
        cell.backgroundColor = .white
        cell.friendName.text = friendName[indexPath.row]
        
        cell.selectionStyle = .none
        
        return cell
    }
}
