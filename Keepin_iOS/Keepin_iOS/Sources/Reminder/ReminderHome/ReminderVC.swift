//
//  ReminderVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/07/02.
//

import UIKit

class ReminderVC: UIViewController {

    @IBOutlet var yearArrow: [UIButton]!
    @IBAction func yearArrowClicked(_ sender: UIButton) {
        let index = yearArrow.firstIndex(of: sender)!
        var year = Int(yearLabel.text!)!
        switch index {
        case 0:
            year -= 1
            yearLabel.text = String(year)
        case 1:
            year += 1
            yearLabel.text = String(year)
        default:
           break
        }
    }
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var monthCV: UICollectionView!
    @IBOutlet weak var reminderTV: UITableView!
    
    var itemNum = 3
    var navigationLeftLabel : String = "편집"
    var months = ["","","1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월","",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        setUI()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 51, height: 36)
        layout.scrollDirection = .horizontal
        monthCV.collectionViewLayout = layout
        monthCV.decelerationRate = .fast
        monthCV.isPagingEnabled = false
        monthCV.register(ReminderCVC.nib(), forCellWithReuseIdentifier: "ReminderCVC")
        monthCV.delegate = self
        monthCV.dataSource = self
        
        reminderTV.register(ReminderTVC.nib(), forCellReuseIdentifier: "ReminderTVC")
        reminderTV.delegate = self
        reminderTV.dataSource = self
    }
    
    func setUI(){
        yearLabel.text = Date().yearOnly()
        reminderTV.backgroundColor = .keepinGray
        reminderTV.contentInset.bottom = 50
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
    
    @objc func toEdit(){
        //편집 체크박스
    }
    
    @objc func toAdd(){
        //let nextVC = ReminderAddVC()
        let ReminderAddNVC = UINavigationController(rootViewController: ReminderAddVC())
        ReminderAddNVC.modalPresentationStyle = .fullScreen
        self.present(ReminderAddNVC, animated: true, completion: nil)
    }

}

extension ReminderVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / 51
        let roundedIndex: CGFloat = round(index)
        offset = CGPoint(x: roundedIndex * 51 - scrollView.contentInset.left, y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = monthCV.dequeueReusableCell(withReuseIdentifier: "ReminderCVC", for: indexPath) as! ReminderCVC
        cell.monthLabel.text = months[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cellWidth = UIScreen.main.bounds.size.width / 5
        return CGSize(width: cellWidth, height: 36)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}

extension ReminderVC : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return itemNum
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reminderTV.dequeueReusableCell(withIdentifier: "ReminderTVC", for: indexPath) as! ReminderTVC
        cell.backgroundColor = .keepinGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * (64 / 812)
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
    
}
