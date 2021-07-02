//
//  BaseTBC.swift
//  Keepin_iOS
//
//  Created by Yi Joon Choi on 2021/06/30.
//

import Foundation
import UIKit

class BaseTBC: UITabBarController, UITabBarControllerDelegate {
    
    let homeVC  = HomeVC()
    let presentMoaVC = PresentMoaVC()
    let keepinPlusVC  = KeepinPlusVC()
    let reminderVC  = ReminderVC()
    var myPageVC = MyPageVC()
    
    let homeTabBarItem  = UITabBarItem(title: "", image: UIImage(named: "home"), tag: 0)
    let presentMoaTabBarItem = UITabBarItem(title: "", image: UIImage(named: "icArchive"), tag: 1)
    let keepinPlusTabBarItem  = UITabBarItem(title: "", image: UIImage(named: "icPost"), tag: 2)
    let reminderTabBarItem  = UITabBarItem(title: "", image: UIImage(named: "icReminder"), tag: 3)
    let myPageTabBarItem  = UITabBarItem(title: "", image: UIImage(named: "icMypage"), tag: 4)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeNVC = UINavigationController(rootViewController: homeVC)
        let presentMoaNVC = UINavigationController(rootViewController: presentMoaVC)
        let keepinPlusNVC = UINavigationController(rootViewController: keepinPlusVC)
        let reminderNVC = UINavigationController(rootViewController: reminderVC)
        let myPageNVC = UINavigationController(rootViewController: myPageVC)
        
        homeNVC.tabBarItem = homeTabBarItem
        presentMoaNVC.tabBarItem = presentMoaTabBarItem
        keepinPlusNVC.tabBarItem  = keepinPlusTabBarItem
        reminderNVC.tabBarItem  = reminderTabBarItem
        myPageNVC.tabBarItem  = myPageTabBarItem
       
        self.viewControllers = [homeNVC,presentMoaNVC,keepinPlusNVC,reminderNVC,myPageNVC]
        
        self.delegate = self

        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().tintColor = .keepinGreen
        
    }
    
}
