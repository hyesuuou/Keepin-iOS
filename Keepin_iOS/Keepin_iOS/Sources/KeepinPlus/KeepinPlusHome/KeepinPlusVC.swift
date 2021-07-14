//
//  KeepinPlusVC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import UIKit

class KeepinPlusVC: UIViewController {

    var select : Int = 0
    var count : Int = 0
    var cnt : Int = 0
    var img : UIImage? = nil
    var tag : Int = 99
    
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var keepinButton: UIButton!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        print("viewwilappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewdidload")
        setNavigationBar()
        setTableview()
        registerXib()
        self.dismissKeyboardWhenTappedAround()
    }
    
    func setTableview(){
        tableview.delegate = self
        tableview.dataSource = self
        tableview.allowsSelection = false
    }
    
    func registerXib(){
        let titleNib = UINib(nibName: KeepinPlusTitleTVC.identifier, bundle: nil)
        tableview.register(titleNib, forCellReuseIdentifier: KeepinPlusTitleTVC.identifier)
        
        let inputNib = UINib(nibName: KeepinPlusInputTVC.identifier, bundle: nil)
        tableview.register(inputNib, forCellReuseIdentifier: KeepinPlusInputTVC.identifier)
        
        let nameNib = UINib(nibName: KeepinPlusSearchTVC.identifier, bundle: nil)
        tableview.register(nameNib, forCellReuseIdentifier: KeepinPlusSearchTVC.identifier)
        
        let selectNib = UINib(nibName: KeppinPlusSelectTVC.identifier, bundle: nil)
        tableview.register(selectNib, forCellReuseIdentifier: KeppinPlusSelectTVC.identifier)
        
        let writeNib = UINib(nibName: KeepinPlusWriteTVC.identifier, bundle: nil)
        tableview.register(writeNib, forCellReuseIdentifier: KeepinPlusWriteTVC.identifier)
        
        let categoryNib = UINib(nibName: KeepinPlusCategoryTVC.identifier, bundle: nil)
        tableview.register(categoryNib, forCellReuseIdentifier: KeepinPlusCategoryTVC.identifier)
        
        let imageNib = UINib(nibName: KeepinPlusImageTVC.identifier, bundle: nil)
        tableview.register(imageNib, forCellReuseIdentifier: KeepinPlusImageTVC.identifier)
        
        let blankXib = UINib(nibName: KeepinPlusBlankTVC.identifier , bundle: nil)
        tableview.register(blankXib, forCellReuseIdentifier: KeepinPlusBlankTVC.identifier)
        
    }

    func setNavigationBar(){
        //self.navigationController?.navigationBar.isHidden = true
        
        backButton.addTarget(self, action: #selector(toDismiss), for: UIControl.Event.touchUpInside)
        
        keepinButton.titleLabel?.font = UIFont.NotoSans(.bold, size: 16)
        keepinButton.tintColor = .keepinGray3

    }
    
    @objc func toDismiss(){
        self.dismiss(animated: true, completion: nil)
        print("dismiss")
    }
    
    @objc func pickImage(){
          self.present(self.imagePicker, animated: true)
      }


}

extension KeepinPlusVC : UITableViewDelegate {
    
}

extension KeepinPlusVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusBlankTVC.identifier, for: indexPath) as? KeepinPlusBlankTVC else { return UITableViewCell() }
            return cell
        
        case 1:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusTitleTVC.identifier, for: indexPath) as? KeepinPlusTitleTVC else {
                return UITableViewCell()
            }
            cell.setData(title: "선물에 이름을 붙여주세요.", subtitle: "", image: true)
            
            return cell
        
        case 2:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusInputTVC.identifier, for: indexPath) as? KeepinPlusInputTVC else {
                return UITableViewCell()
            }
            cell.setData(placeholder: "키핀이가 준 선물")
            return cell
            
        case 3:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusTitleTVC.identifier, for: indexPath) as? KeepinPlusTitleTVC else {
                return UITableViewCell()
            }
            cell.setData(title: "사진을 등록해주세요", subtitle: "(최대 3장)", image: true)
            
            return cell
            
        case 4:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusImageTVC.identifier, for: indexPath) as? KeepinPlusImageTVC else {
                return UITableViewCell()
            }
            cell.imagePlusButton[0].addTarget(self, action: #selector(actionSheetAlert(_:)), for: .touchUpInside)
            cell.imagePlusButton[1].addTarget(self, action: #selector(actionSheetAlert(_:)), for: .touchUpInside)
            cell.imagePlusButton[2].addTarget(self, action: #selector(actionSheetAlert(_:)), for: .touchUpInside)
            if let image = img {
                cell.setImage(image: image, tag: tag)
                //cell.imagePlusButton[0].setImage(image, for: .normal)
            }
            
            return cell
            
        case 5:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusTitleTVC.identifier, for: indexPath) as? KeepinPlusTitleTVC else {
                return UITableViewCell()
            }
            cell.setData(title: "어떤 선물인가요?", subtitle: "", image: true)
            
            return cell
            
        case 6:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeppinPlusSelectTVC.identifier, for: indexPath) as? KeppinPlusSelectTVC else {
                return UITableViewCell()
            }
            cell.setButtonUI(select: select)
            cell.button[0].addTarget(self, action: #selector(selectGetButtonClicked(_:)), for: .touchUpInside)
            cell.button[1].addTarget(self, action: #selector(selectGiveButtonClicked(_:)), for: .touchUpInside)
            return cell
            
        case 7:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusTitleTVC.identifier, for: indexPath) as? KeepinPlusTitleTVC else {
                return UITableViewCell()
            }
            cell.setData(title: "누구에게 받은 선물인가요?", subtitle: "", image: true)
            
            
            return cell
            
        case 8:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusSearchTVC.identifier, for: indexPath) as? KeepinPlusSearchTVC else {
                return UITableViewCell()
            }
            
            return cell
        
        case 9:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusTitleTVC.identifier, for: indexPath) as? KeepinPlusTitleTVC else {
                return UITableViewCell()
            }
            cell.setData(title: "언제 받은 선물인가요?", subtitle: "", image: true)
            
            return cell
            
        case 10:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusInputTVC.identifier, for: indexPath) as? KeepinPlusInputTVC else {
                return UITableViewCell()
            }
            cell.setData(placeholder: "YYYY.MM.DD")
            cell.textfield.setDatePicker(target: (Any).self)
            return cell
            
        case 11:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusTitleTVC.identifier, for: indexPath) as? KeepinPlusTitleTVC else {
                return UITableViewCell()
            }
            cell.setData(title: "선물 카테고리를 선택해주세요", subtitle: "(최대 2개)", image: false)
            
            
            return cell
            
        case 12:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusCategoryTVC.identifier, for: indexPath) as? KeepinPlusCategoryTVC else {
                return UITableViewCell()
            }
            
            cell.setButtonUI(select: KeepinPlusCategoryTVC.numberList)
            for i in 0 ... 7 {
                cell.button[i].addTarget(self, action: #selector(selectCategoryClicked(_:)), for: .touchUpInside)
            }
            
            
            
            return cell
            
        case 13:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusTitleTVC.identifier, for: indexPath) as? KeepinPlusTitleTVC else {
                return UITableViewCell()
            }
            cell.setData(title: "더 잘 키핀해볼까요?", subtitle: "", image: false)
            
            return cell
            
        case 14:
            guard let cell = tableview.dequeueReusableCell(withIdentifier: KeepinPlusWriteTVC.identifier, for: indexPath) as? KeepinPlusWriteTVC else {
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
            return 19
        
        case 2:
            return 72
            
        case 4:
            return 41 + 102
            
        case 6:
            return 85
            
        case 8:
            return 75
            
        case 10:
            return 76
            
        case 12:
            return 76 + 40
            
        case 14:
            return 234
            
            
        default:
            return 43
        }
    }
}

extension KeepinPlusVC {
    
    // 어떤 선물인가요? - '받은' 버튼 눌렀을 때
    @objc
    func selectGetButtonClicked(_ sender : UIButton){
        print("바뀐다")
        select = 0
        tableview.reloadData()
        
    }
    
    // 어떤 선물인가요? - '준' 버튼 눌렀을 때
    @objc
    func selectGiveButtonClicked(_ sender : UIButton){
        select = 1
        tableview.reloadData()
    }
    
    // 선물 카테고리 버튼 눌렀을 때
    @objc
    func selectCategoryClicked(_ sender : UIButton){
        print(sender.tag)
       
        count = 0
        for i in 0 ... KeepinPlusCategoryTVC.numberList.count - 1 {
            if KeepinPlusCategoryTVC.numberList[i] == 1 {
                count = count + 1
            }
        }
        
        if count == 2 {
            if KeepinPlusCategoryTVC.numberList[sender.tag] == 1 {
                KeepinPlusCategoryTVC.numberList[sender.tag] = 0
            }
        }
        
        
        if count < 2 {
            KeepinPlusCategoryTVC.numberList[sender.tag] = abs(KeepinPlusCategoryTVC.numberList[sender.tag]-1)
        }
        
        tableview.reloadData()
    }
    
    
}

extension KeepinPlusVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc
    func actionSheetAlert(_ sender: UIButton){
        print(sender.tag)
        tag = sender.tag
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let camera = UIAlertAction(title: "카메라", style: .default) { [weak self] (_) in
            self?.presentCamera()
        }
        let album = UIAlertAction(title: "앨범", style: .default) { [weak self] (_) in
            self?.presentAlbum()
        }
        
        alert.addAction(cancel)
        alert.addAction(camera)
        alert.addAction(album)
        
        present(alert, animated: true, completion: nil)
        
    }
    func presentCamera(){
        
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        vc.cameraFlashMode = .on
        
        present(vc, animated: true, completion: nil)
    }
    func presentAlbum(){
        
        
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        
        present(vc, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //카메라나 앨범등 PickerController가 사용되고 이미지 촬영을 했을 때 발동 된다.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("picker -> \(String(describing: info[UIImagePickerController.InfoKey.imageURL]))")
        
        if cnt % 2 == 0 {
            
            if let image = info[.editedImage] as? UIImage {
                img = image
            }
            
        }
        else{
            
            if let image = info[.originalImage] as? UIImage {
                img = image
            }
            
        }
        
        cnt += 1
        
        print(cnt)
        tableview.reloadData()
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
}

extension UITextField {
    func setDatePicker(target: Any) {
        let SCwidth = self.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: SCwidth, height: 216))
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.addTarget(self, action: #selector(onDatePickerValueChanged), for: .valueChanged)
        self.inputView = datePicker
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: SCwidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "취소", style: .plain, target: nil, action: #selector(tapCancel))
        let barButton = UIBarButtonItem(title: "완료", style: .plain, target: target, action: #selector(doneButtonClicked))
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        self.inputAccessoryView = toolBar
        
    }
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
    
    @objc
    func doneButtonClicked(){
        self.resignFirstResponder()
    }
    
    @objc
    func onDatePickerValueChanged(datePicker: UIDatePicker){
        self.text = datePicker.date.toString()
    }
}
