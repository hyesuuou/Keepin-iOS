//
//  ReminderVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/02.
//

import UIKit

class ReminderVC: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet var yearArrow: [UIButton]!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var monthCV: UICollectionView!
    @IBOutlet weak var selectedMonth: UIImageView!
    @IBOutlet weak var tvBackground: UIView!
    @IBOutlet weak var reminderTV: UITableView!
    
    //MARK: - IBActions
    @IBAction func yearArrowClicked(_ sender: UIButton) {
        let index = yearArrow.firstIndex(of: sender)!
        var year = Int(yearLabel.text!)!
        monthTest()
        switch index {
        case 0:
            year -= 1
            yearLabel.text = String(year)
            let request = ReminderHomeRequest(year: yearLabel.text!, month: forServer)
            ReminderHomeDataManager().reminders(request, viewController: self)
        case 1:
            year += 1
            yearLabel.text = String(year)
            let request = ReminderHomeRequest(year: yearLabel.text!, month: forServer)
            ReminderHomeDataManager().reminders(request, viewController: self)
        default:
           break
        }
    }
    
    //MARK: - Custom Methods
    var navigationLeftLabel : String = "편집"
    var months = ["","","1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월","",""]
    var sample : Int = 0
    var serverData : MonthReminders?
    var forServer : String = "01"
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = false
        
        setNavigationBar()
        setUI()
        
        let layout = UICollectionViewFlowLayout()
        let cellWidth = UIScreen.main.bounds.width / 5
        layout.itemSize = CGSize(width: cellWidth, height: 36)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        monthCV.collectionViewLayout = layout
        monthCV.decelerationRate = .fast
        monthCV.isPagingEnabled = false
        monthCV.backgroundColor = .clear
        monthCV.register(ReminderCVC.nib(), forCellWithReuseIdentifier: "ReminderCVC")
        monthCV.delegate = self
        monthCV.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let request = ReminderHomeRequest(year: yearLabel.text!, month: forServer)
        ReminderHomeDataManager().reminders(request, viewController: self)
    }
    
    //MARK: - Custom Methods
    func monthTest(){
        if sample < 9{
            forServer = "0" + String(sample+1)
        }
        else{
            forServer = String(sample+1)
        }
    }
    
    func setUI(){
        yearLabel.text = Date().yearOnly()
        reminderTV.backgroundColor = .keepinGray
        reminderTV.contentInset.bottom = 50
        tvBackground.backgroundColor = .keepinGray
        reminderTV.separatorStyle = .none
//        let date = Date().monthOnly()
//        sample = date
    }

    func setNavigationBar(){
        let editButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        editButton.setTitle(navigationLeftLabel, for: .normal)
        editButton.titleLabel?.font = UIFont.NotoSans(.regular, size: 16)
        editButton.setTitleColor(.keepinGray4, for: .normal)
        editButton.addTarget(self, action: #selector(toEdit), for: UIControl.Event.touchUpInside)
        editButton.frame = CGRect(x: 0, y: 0, width: 30, height: 22)
        
        let addButton: UIButton = UIButton(type: UIButton.ButtonType.custom)
        addButton.setImage(UIImage(named: "icAdd"), for: UIControl.State.normal)
        addButton.addTarget(self, action: #selector(toAdd), for: UIControl.Event.touchUpInside)
        addButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        
        let editbarButton = UIBarButtonItem(customView: editButton)
        self.navigationItem.leftBarButtonItem = editbarButton
        
        let addbarButton = UIBarButtonItem(customView: addButton)
        self.navigationItem.rightBarButtonItem = addbarButton
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    //MARK: - @objc Methods
    @objc func toEdit(){
        //편집 체크박스
    }
    
    @objc func toAdd(){
        let ReminderAddNVC = UINavigationController(rootViewController: ReminderAddVC())
        ReminderAddNVC.modalPresentationStyle = .fullScreen
        self.present(ReminderAddNVC, animated: true, completion: nil)
    }
}

//MARK: - UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension ReminderVC : UIScrollViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if scrollView == monthCV {
            let layout = self.monthCV.collectionViewLayout as! UICollectionViewFlowLayout
            
            let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
            
            var offset = targetContentOffset.pointee
            let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
            let roundedIndex = round(index)
            sample = Int(roundedIndex)
            offset = CGPoint(x: CGFloat(roundedIndex * cellWidthIncludingSpacing) - scrollView.contentInset.left, y: -scrollView.contentInset.top)
            targetContentOffset.pointee = offset
            
            monthCV.reloadData()
            
            monthTest()
            let request = ReminderHomeRequest(year: yearLabel.text!, month: forServer)
            ReminderHomeDataManager().reminders(request, viewController: self)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = monthCV.dequeueReusableCell(withReuseIdentifier: "ReminderCVC", for: indexPath) as! ReminderCVC
        cell.monthLabel.text = months[indexPath.row]
        
        if indexPath.row == sample + 2{
            cell.setColor(color: UIColor.white, font: true)
        }
        else {
            cell.setColor(color: UIColor.gray, font: false)
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension ReminderVC : UITableViewDelegate, UITableViewDataSource{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (reminderTV.contentOffset.y < 0){
            reminderTV.contentOffset = CGPoint(x: 0, y: 0)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (serverData?.reminders.count)!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
        ReminderAddVC.reminderID = (serverData?.reminders[indexPath.section]?._id)!
        ReminderAddVC.fromEdit = true
        
        let ReminderAddNVC = UINavigationController(rootViewController: ReminderAddVC())
        ReminderAddNVC.modalPresentationStyle = .fullScreen
        present(ReminderAddNVC, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reminderTV.dequeueReusableCell(withIdentifier: "ReminderTVC", for: indexPath) as! ReminderTVC
        cell.backgroundColor = .keepinGray
        cell.dateLabel.text = serverData?.reminders[indexPath.section]?.date
        cell.reminderTitle.text = serverData?.reminders[indexPath.section]?.title
        let alarmStatus = (serverData?.reminders[indexPath.section]?.isAlarm)!
        if alarmStatus{
            cell.alarmOn.isOn = true
        }
        else{
            cell.alarmOn.isOn = false
        }
        let importantStatus = (serverData?.reminders[indexPath.section]?.isImportant)!
        if importantStatus{
            cell.backgronudImg.image = UIImage(named: "listReminderImportant")
        }
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UIScreen.main.bounds.height * (64/812)
        return 64
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 32
        }
        else{
            return 12
        }
    }
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .keepinGray
        return headerView
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                reminderTV.beginUpdates()
                var test : [String] = []
                test.append((serverData?.reminders[indexPath.section]?._id)!)
                serverData?.reminders.remove(at: indexPath.section)
                
                let request = EraseRequest(reminderArray: test)
                ReminderHomeDataManager().reminderDelete(request, viewController: self)
                //리마인더 삭제 서버통신
                let indexSet = NSMutableIndexSet()
                indexSet.add(indexPath.section)
                tableView.deleteSections(indexSet as IndexSet, with: .fade)
                reminderTV.endUpdates()
            }
        }
    
}

//MARK: - Server Functions
extension ReminderVC {
    func didSuccessReminders(message: String) {
        reminderTV.register(ReminderTVC.nib(), forCellReuseIdentifier: "ReminderTVC")
        reminderTV.delegate = self
        reminderTV.dataSource = self
        
        reminderTV.reloadData()
    }
    
    func failedToRequest(message: String) {
        print(message)
    }
}

