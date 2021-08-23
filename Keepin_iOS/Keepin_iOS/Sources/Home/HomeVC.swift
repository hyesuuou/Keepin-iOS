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
        setUI()
        serverConnect()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigationBarUI()
        HomeDataManager().getReminderHome(self)
    }
    
    func serverConnect(){
        HomeDataManager().getRandom(self)
    }
    
    func setUI(){
        setNavigationBarUI()
        homeTableview.backgroundColor = .none
        homeTableview.allowsSelection = false
    }
    
    func setNavigationBarUI(){
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func registerXib(){
        let blankNib = UINib(nibName: KeepinPlusBlankTVC.identifier, bundle: nil)
        homeTableview.register(blankNib, forCellReuseIdentifier: KeepinPlusBlankTVC.identifier)
        
        let topNib = UINib(nibName: HomeTopTVC.identifier, bundle: nil)
        homeTableview.register(topNib, forCellReuseIdentifier: HomeTopTVC.identifier)
        
        let eventNib = UINib(nibName: HomeEventTVC.identifier, bundle: nil)
        homeTableview.register(eventNib, forCellReuseIdentifier: HomeEventTVC.identifier)
        
        let eventSignleNib = UINib(nibName: HomeTopSingleTVC.identifier, bundle: nil)
        homeTableview.register(eventSignleNib, forCellReuseIdentifier: HomeTopSingleTVC.identifier)
    }
    
    func initRefresh(){
        refreshControl.addTarget(self, action: #selector(refreshTable(refresh:)), for: .valueChanged)
        homeTableview.refreshControl = refreshControl
    }
    
    @objc func refreshTable(refresh: UIRefreshControl){
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

extension HomeVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: KeepinPlusBlankTVC.identifier, for: indexPath) as? KeepinPlusBlankTVC else {
                return UITableViewCell()
            }
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTopTVC.identifier, for: indexPath) as? HomeTopTVC else {
                return UITableViewCell()
            }
            cell.messageLabel.text = message
            cell.randomImageView.setImage(with: image)
            return cell
            
        case 2:
            if UIScreen.main.bounds.height == 667.0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTopSingleTVC.identifier, for: indexPath) as? HomeTopSingleTVC else {
                    return UITableViewCell()
                }
                cell.setData(date: reminderList[0].date,
                             content: reminderList[0].title,
                             important: reminderList[0].isImportant)
                return cell
                
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeEventTVC.identifier, for: indexPath) as? HomeEventTVC else {
                    return UITableViewCell()
                }
                cell.setData(date: reminderList[0].date,
                             contents: reminderList[0].title,
                             important: reminderList[0].isImportant,
                             secondDate: reminderList[1].date,
                             secondContents: reminderList[1].title,
                             secondImportant: reminderList[1].isImportant)
                
                return cell
            }
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            if UIScreen.main.bounds.height == 667.0 {
                return 50
            }
            else {
                return UIScreen.main.bounds.height * (50/812)
            }
        case 1:
            if UIScreen.main.bounds.height == 667.0 {
                return 417
            }
            else {
                return UIScreen.main.bounds.height * (436/812)
            }
            
        case 2:
            if UIScreen.main.bounds.height == 667.0 {
                return 133
            }
            else {
                return UIScreen.main.bounds.height * (202/812)
            }
            
        default:
            return 100
        }
    }
}

extension HomeVC {
    func didSuccessGetRandom(message: String, imgURL: String) {
        self.message = message
        self.image = imgURL
        homeTableview.delegate = self
        homeTableview.dataSource = self
        homeTableview.reloadData()
    }
    
    func failedToRequest(message: String) {
        print(message)
    }
}

