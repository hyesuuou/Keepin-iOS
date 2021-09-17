//
//  ReminderSwapCVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/08/23.
//

import UIKit

protocol tableviewTouch{
    func touchedTV()
    func notTV()
}

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
    
    var delegate : tableviewTouch?
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate?.touchedTV()
        
        if tableView == upcomingTV{
            print(indexPath.section)
            ReminderAddVC.reminderID = upcomingData[indexPath.section]._id!
            ReminderAddVC.fromEdit = true
        }
        else{
            print(indexPath.section)
            ReminderAddVC.reminderID = pastData[indexPath.section]._id!
            ReminderAddVC.fromEdit = true
        }
       
//        let ReminderAddNVC = UINavigationController(rootViewController: ReminderAddVC())
//        ReminderAddNVC.modalPresentationStyle = .fullScreen
//        present(ReminderAddNVC, animated: true, completion: nil)
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if tableView == upcomingTV{
                if editingStyle == .delete {
                    upcomingTV.beginUpdates()
                var test : [String] = []
                test.append(upcomingData[indexPath.section]._id!)
                serverData?.reminders.remove(at: indexPath.section)
                upcomingData.remove(at: indexPath.section)

                let request = EraseRequest(reminderArray: test)
                ReminderHomeDataManager().reminderDelete(request)
                //리마인더 삭제 서버통신
                let indexSet = NSMutableIndexSet()
                indexSet.add(indexPath.section)
                tableView.deleteSections(indexSet as IndexSet, with: .fade)
                upcomingTV.endUpdates()
            }
        }
            else{
                if editingStyle == .delete {
                pastTV.beginUpdates()
                var test : [String] = []
                test.append(pastData[indexPath.section]._id!)
                serverData?.reminders.remove(at: indexPath.section)
                pastData.remove(at: indexPath.section)

                let request = EraseRequest(reminderArray: test)
                ReminderHomeDataManager().reminderDelete(request)
                //리마인더 삭제 서버통신
                let indexSet = NSMutableIndexSet()
                indexSet.add(indexPath.section)
                tableView.deleteSections(indexSet as IndexSet, with: .fade)
                pastTV.endUpdates()
            }
        }
            
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
        viewHeight.constant = 0
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
        upcomingTV.contentInset.bottom = 0
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
        viewHeight.constant = 0
        upcomingData = []
        pastData = []
    }
}

extension ReminderSwapCVC {
    func didSuccessReminders(data: MonthReminders) {
        serverData = data
        
        if scrollView.frame.height < CGFloat((serverData?.reminders.count)! * 80){
            viewHeight.constant = CGFloat((serverData?.reminders.count)! * 75)
        }
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
