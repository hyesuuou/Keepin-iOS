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
    let myPageVC  = MyPageVC()
    var settingVC = SettingVC()
    
    
    let homeTabBarItem  = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 0)
    let presentMoaTabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "star.fill"), tag: 1)
    let keepinPlusTabBarItem  = UITabBarItem(title: "", image: UIImage(systemName: "plus.circle.fill"), tag: 2)
    let myPageTabBarItem  = UITabBarItem(title: "", image: UIImage(systemName: "folder"), tag: 3)
    let settingTabBarItem  = UITabBarItem(title: "", image: UIImage(systemName: "person.fill"), tag: 4)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeNVC = UINavigationController(rootViewController: homeVC)
        let presentMoaNVC = UINavigationController(rootViewController: presentMoaVC)
        let keepinPlusNVC = UINavigationController(rootViewController: keepinPlusVC)
        let myPageNVC = UINavigationController(rootViewController: myPageVC)
        let profileNVC = UINavigationController(rootViewController: settingVC)
        
        homeNVC.tabBarItem = homeTabBarItem
        presentMoaNVC.tabBarItem = presentMoaTabBarItem
        keepinPlusNVC.tabBarItem  = keepinPlusTabBarItem
        myPageNVC.tabBarItem  = myPageTabBarItem
        profileNVC.tabBarItem  = settingTabBarItem
       
        self.viewControllers = [homeNVC,presentMoaNVC,keepinPlusNVC,myPageNVC,profileNVC]
        
        self.delegate = self
        
        UITabBar.appearance().tintColor = .systemGreen
        
    }
    
}
