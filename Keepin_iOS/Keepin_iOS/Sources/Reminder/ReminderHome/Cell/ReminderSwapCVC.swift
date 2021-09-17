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
    var upcomingData : [MonthReminder] = []
    var pastData : [MonthReminder] = []
    
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
        if serverData != nil{
            if tableView == upcomingTV{
                return upcomingData.count
            }
            else{
                return pastData.count
            }
        }
        else{
            return 0
        }
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

        func setCell(cell: ReminderTVC, data: [MonthReminder]){
            cell.backgroundColor = .keepinGray
            cell.dateLabel.text = data[indexPath.section].date
            cell.reminderTitle.text = data[indexPath.section].title
            let alarmStatus = data[indexPath.section].isAlarm!
            if alarmStatus{
                cell.alarmOn.isOn = true
            }
            else{
                cell.alarmOn.isOn = false
            }
            let importantStatus = data[indexPath.section].isImportant!
            if importantStatus{
                cell.backgronudImg.image = UIImage(named: "listReminderImportant")
            }
            let backgroundView = UIView()
            backgroundView.backgroundColor = .clear
            cell.selectedBackgroundView = backgroundView
            
        }
        
        if tableView == upcomingTV{
            cell = upcomingTV.dequeueReusableCell(withIdentifier: "ReminderTVC", for: indexPath) as! ReminderTVC
            setCell(cell: cell, data: upcomingData)
        }
        else{
            cell = pastTV.dequeueReusableCell(withIdentifier: "ReminderTVC", for: indexPath) as! ReminderTVC
            setCell(cell: cell, data: pastData)
        }
        
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
        upcomingView.backgroundColor = .keepinGray
        pastView.backgroundColor = .keepinGray
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
        upcomingTV.contentInset.bottom = 50
        upcomingTV.separatorStyle = .none
        
        pastTV.backgroundColor = .keepinGray
//        upcomingTV.contentInset.bottom = 50
        pastTV.separatorStyle = .none
    }

    static func nib() -> UINib{
        return UINib(nibName: "ReminderSwapCVC", bundle: nil)
    }
    
    override func prepareForReuse() {
        upcomingView.isHidden = false
        pastView.isHidden = false
        upcomingData = []
        pastData = []
    }
}

extension ReminderSwapCVC {
    func didSuccessReminders(data: MonthReminders) {
        serverData = data
        viewHeight.constant = CGFloat((serverData?.reminders.count)! * 50)
        
        serverData?.reminders.forEach{
            if $0?.isPassed == true{
                pastData.append($0!)
            }
            else{
                upcomingData.append($0!)
            }
        }
        
        upcomingTV.reloadData()
        pastTV.reloadData()
    }
}

