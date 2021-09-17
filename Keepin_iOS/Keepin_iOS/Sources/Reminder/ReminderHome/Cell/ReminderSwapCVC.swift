//
//  ReminderSwapCVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/08/23.
//

import UIKit

class ReminderSwapCVC: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var upcomingTV: UITableView!
    @IBOutlet weak var upcomingView: UIView!
    @IBOutlet weak var pastTV: UITableView!
    @IBOutlet weak var pastView: UIView!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var serverData : MonthReminders?
    
    var samples = ["생일1","생일2","생일3","생일4"]
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (upcomingTV.contentOffset.y < 0){
            upcomingTV.contentOffset = CGPoint(x: 0, y: 0)
        }
        else if (pastTV.contentOffset.y < 0){
            pastTV.contentOffset = CGPoint(x: 0, y: 0)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return samples.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .keepinGray
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 18
        }
        else{
            return 12
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : ReminderTVC
        
        if tableView == upcomingTV{
            cell = upcomingTV.dequeueReusableCell(withIdentifier: "ReminderTVC", for: indexPath) as! ReminderTVC
            cell.reminderTitle.text = samples[indexPath.section]
        }
        else{
            cell = pastTV.dequeueReusableCell(withIdentifier: "ReminderTVC", for: indexPath) as! ReminderTVC
            cell.reminderTitle.text = samples[indexPath.section]
        }
        
        cell.backgroundColor = .keepinGray
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        setTV()
    }
    
    private func setUI(){
        scrollView.backgroundColor = .keepinGray
        
//        upcomingView.backgroundColor = .keepinGray
//        pastView.backgroundColor = .keepinGray
        
        upcomingView.backgroundColor = .blue
        
//        dynamic height
        viewHeight.constant = CGFloat(samples.count * 70)
    }
    
    private func setTV(){
        upcomingTV.register(ReminderTVC.nib(), forCellReuseIdentifier: "ReminderTVC")
        pastTV.register(ReminderTVC.nib(), forCellReuseIdentifier: "ReminderTVC")
        upcomingTV.delegate = self
        upcomingTV.dataSource = self
        pastTV.delegate = self
        pastTV.dataSource = self
        
        upcomingTV.isScrollEnabled = false
        pastTV.isScrollEnabled = false
    
        upcomingTV.backgroundColor = .keepinGray
//        upcomingTV.contentInset.bottom = 50
        upcomingTV.separatorStyle = .none
        
        pastTV.backgroundColor = .keepinGray
//        upcomingTV.contentInset.bottom = 50
        pastTV.separatorStyle = .none
    }

    static func nib() -> UINib{
        return UINib(nibName: "ReminderSwapCVC", bundle: nil)
    }
    
//    override func prepareForReuse() {
//        upcomingView.isHidden = false
//        pastView.isHidden = false
//    }
}

