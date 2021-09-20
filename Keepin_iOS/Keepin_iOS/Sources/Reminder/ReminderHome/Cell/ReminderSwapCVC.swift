//
//  ReminderSwapCVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/08/23.
//

import UIKit

protocol tableviewTouchCVC{
    func touched(touch: Bool)
    func alarm(data: MonthReminder)
    func presentEdit(data: MonthReminder)
}

class ReminderSwapCVC: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource, tableviewTouch, UIGestureRecognizerDelegate{
    
    func touchedTVC() {
        touched = !touched
        delegateTVC?.touched(touch: touched)
    }
    
    func touchedAlarm(tv: String, index: Int, value: Bool) {
        if tv == "upcoming"{
            upcomingData[index].isAlarm = value
            delegateTVC?.alarm(data: upcomingData[index])
        }
        else{
            pastData[index].isAlarm = value
            delegateTVC?.alarm(data: pastData[index])
        }
    }
    
    @IBOutlet weak var upcomingTV: UITableView!
    @IBOutlet weak var upcomingView: UIView!
    @IBOutlet weak var noUpcomingView: UIView!
    @IBOutlet weak var pastTV: UITableView!
    @IBOutlet weak var pastView: UIView!
    @IBOutlet weak var noPastView: UIView!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet var emptyLabels: [UILabel]!
    
    var serverData : MonthReminders?
    var upcomingData : [MonthReminder] = []
    var pastData : [MonthReminder] = []
    
    var delegate : tableviewTouch?
    var delegateTVC : tableviewTouchCVC?
    
    var touched : Bool = false
    
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
            cell.index = indexPath.section
            cell.delegate = self
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
            cell.TVname = "upcoming"
        }
        else{
            cell = pastTV.dequeueReusableCell(withIdentifier: "ReminderTVC", for: indexPath) as! ReminderTVC
            setCell(cell: cell, data: pastData)
            cell.TVname = "past"
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
        if tableView == upcomingTV{
            ReminderAddVC.reminderID = upcomingData[indexPath.section]._id!
            ReminderAddVC.fromEdit = true
            delegateTVC?.presentEdit(data: upcomingData[indexPath.section])
        }
        else{
            ReminderAddVC.reminderID = pastData[indexPath.section]._id!
            ReminderAddVC.fromEdit = true
            delegateTVC?.presentEdit(data: pastData[indexPath.section])
        }
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
                noCheck()
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
                noCheck()
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
        noUpcomingView.backgroundColor = .keepinGray
        noPastView.backgroundColor = .keepinGray
        emptyView.backgroundColor = .keepinGray
        emptyLabels.forEach{
            $0.textColor = .keepinGray3
        }
        
//        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
//        tapGesture.delegate = self
//        stackView.addGestureRecognizer(tapGesture)
    }
    
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
//        print("touched past view")
//        touched = !touched
//        print(touched)
//        if touched{
//            delegateTVC?.touched(touch: touched)
//        }
//        else{
//            delegateTVC?.touched(touch: touched)
//        }
//        return true
//    }
    
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
        pastTV.separatorStyle = .none
    }

    private func noCheck(){
        if upcomingData.isEmpty{
            upcomingTV.isHidden = true
            emptyLabels[1].text = "다가오는 이벤트가 없습니다."
        }
        if pastData.isEmpty{
            pastTV.isHidden = true
            emptyLabels[2].text = "지난 이벤트가 없습니다."
        }
        if pastData.isEmpty && upcomingData.isEmpty{
            stackView.isHidden = true
        }
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "ReminderSwapCVC", bundle: nil)
    }
    
    override func prepareForReuse() {
        upcomingView.isHidden = false
        pastView.isHidden = false
        
        upcomingTV.isHidden = false
        pastTV.isHidden = false
        
        stackView.isHidden = false
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
        
        noCheck()
        upcomingTV.reloadData()
        pastTV.reloadData()
    }
}
