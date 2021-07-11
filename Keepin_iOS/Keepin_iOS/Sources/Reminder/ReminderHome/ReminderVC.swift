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
    
    var navigationLeftLabel : String = "편집"
    var months = ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        setUI()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 51, height: 36)
        layout.scrollDirection = .horizontal
        monthCV.collectionViewLayout = layout
        monthCV.isPagingEnabled = true
        monthCV.register(ReminderCVC.nib(), forCellWithReuseIdentifier: "ReminderCVC")
        monthCV.delegate = self
        monthCV.dataSource = self
    }
    
    func setUI(){
        yearLabel.text = Date().yearOnly()
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
    
//    private func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<Any>) {
//        // item의 사이즈와 item 간의 간격 사이즈를 구해서 하나의 item 크기로 설정.
//        let layout = self.monthCV.collectionViewLayout as! UICollectionViewFlowLayout
//        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
//            // targetContentOff을 이용하여 x좌표가 얼마나 이동했는지 확인
//        // 이동한 x좌표 값과 item의 크기를 비교하여 몇 페이징이 될 것인지 값 설정
//        var offset = targetContentOffset.pointee
//        let index = ((offset as AnyObject).x + scrollView.contentInset.left) / cellWidthIncludingSpacing
//        var roundedIndex = round(index)
//        // scrollView, targetContentOffset의 좌표 값으로 스크롤 방향을 알 수 있다.
//        // index를 반올림하여 사용하면 item의 절반 사이즈만큼 스크롤을 해야 페이징이 된다.
//        // 스크로로 방향을 체크하여 올림,내림을 사용하면 좀 더 자연스러운 페이징 효과를 낼 수 있다.
//        if scrollView.contentOffset.x > (targetContentOffset.pointee as AnyObject).x { roundedIndex = floor(index) }
//        else { roundedIndex = ceil(index) }
//        // 위 코드를 통해 페이징 될 좌표값을 targetContentOffset에 대입하면 된다.
//        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
//
//        targetContentOffset.pointee = offset
//    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = monthCV.dequeueReusableCell(withReuseIdentifier: "ReminderCVC", for: indexPath) as! ReminderCVC
        cell.monthLabel.text = months[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let cellWidth = UIScreen.main.bounds.size.width / 8
        return CGSize(width: cellWidth, height: 36)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
