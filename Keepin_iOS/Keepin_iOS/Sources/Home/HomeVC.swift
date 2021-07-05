//
//  HomeVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import UIKit

class HomeVC: UIViewController {
    
    let refreshControl = UIRefreshControl()
    

    @IBOutlet weak var homeTableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        initRefresh()
        homeTableview.delegate = self
        homeTableview.dataSource = self
        homeTableview.backgroundColor = .none
        homeTableview.allowsSelection = false
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        
        
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
                self.homeTableview.reloadData()
                refresh.endRefreshing()
            }
        }
    
    


}

extension HomeVC : UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(homeTableview.contentOffset)
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
            
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeEventTVC.identifier, for: indexPath) as? HomeEventTVC else {
                return UITableViewCell()
            }
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
