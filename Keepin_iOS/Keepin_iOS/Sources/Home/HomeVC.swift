//
//  HomeVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import UIKit

class HomeVC: UIViewController {
    
    let refreshControl = UIRefreshControl()
    var message : String = ""
    var image : String = ""
    var reminderList : [Reminder] = []
    
    @IBOutlet weak var homeTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        initRefresh()
        
        homeTableview.backgroundColor = .none
        homeTableview.allowsSelection = false
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
       // self.navigationController?.navigationBar.isHidden = true
        
        HomeDataManager().getRandom(self)
        HomeDataManager().getReminderHome(self)
        
    }
    
    func registerXib(){
        let topNib = UINib(nibName: HomeTopTVC.identifier, bundle: nil)
        homeTableview.register(topNib, forCellReuseIdentifier: HomeTopTVC.identifier)
        
        let eventNib = UINib(nibName: HomeEventTVC.identifier, bundle: nil)
        homeTableview.register(eventNib, forCellReuseIdentifier: HomeEventTVC.identifier)
    }
    
    func initRefresh(){
            refreshControl.addTarget(self, action: #selector(refreshTable(refresh:)), for: .valueChanged)
            homeTableview.refreshControl = refreshControl
    }
    
    @objc func refreshTable(refresh: UIRefreshControl){
            print("새로고침 시작")
        
                    // 현재로부터 새로고침을 중단함
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){ // 1초
                HomeDataManager().getRandom(self)
                self.homeTableview.reloadData()
                refresh.endRefreshing()
            }
        }
    
    


}

extension HomeVC : UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if (homeTableview.contentOffset.y > 0){
            homeTableview.contentOffset = CGPoint(x: 0, y: 0)
        }
        
        
        
    }
    
}

extension HomeVC  : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTopTVC.identifier, for: indexPath) as? HomeTopTVC else {
                return UITableViewCell()
            }
            cell.messageLabel.text = message
            cell.randomImageView.setImage(with: image)
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeEventTVC.identifier, for: indexPath) as? HomeEventTVC else {
                return UITableViewCell()
            }
            
            cell.setData(date: reminderList[0].date, contents: reminderList[0].title,
                         secondDate: reminderList[1].date, secondContents: reminderList[1].title)
            
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return UIScreen.main.bounds.height * (436/812) - 3
        case 1:
            return UIScreen.main.bounds.height * (202/812)
        default:
            return 100
        }
       
    }
    
    
}

extension HomeVC {
    func didSuccessGetRandom(message: String, imgURL: String) {
        print("서버통신 성공")
        image = imgURL
        homeTableview.delegate = self
        homeTableview.dataSource = self
        homeTableview.reloadData()
    }
    
    func failedToRequest(message: String) {
        print(message)
    }
    
    func didSuccessGetHomeReminder(list: [Reminder]){
        print(list)
        
    }
    
}

