//
//  MainTabBarViewController.swift
//  Instagram
//
//  Created by Ant on 3/31/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    var tabBarItemBgViews: [UIView] = []
    
    var bottomMenu: BottomMenuView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = UIColor.white
        for it in self.tabBar.items! {
            it.badgeValue = "100"
        }
        
        self.delegate = self
        
        
        self.bottomMenu = self.storyboard?.instantiateViewController(withIdentifier: "BottomMenu") as! BottomMenuView
        self.bottomMenu.modalTransitionStyle = .coverVertical
        self.view.addSubview(self.bottomMenu.view)
        self.bottomMenu.view.alpha = 0
        
        NotificationCenter.default.addObserver(self, selector: #selector(MainTabBarViewController.showBottomMenu(_:)), name: NSNotification.Name(rawValue: "ShowBottomMenu"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MainTabBarViewController.dismissBottomMenu(_:)), name: NSNotification.Name(rawValue: "DismissBottomMenu"), object: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let ITEM_WIDTH = self.tabBar.frame.width / 5
        let ITEM_HEIGHT = CGFloat(49)
        
        //初始化 tab bar item 背景层
        for one in self.tabBar.items! {
            let vw = UIView()
            vw.backgroundColor = UIColor(red: 37/255, green: 29/255, blue: 42/255, alpha: 1)
            vw.frame = CGRect(x: ITEM_WIDTH * CGFloat(one.tag), y: 0, width: ITEM_WIDTH, height: ITEM_HEIGHT)
            self.tabBarItemBgViews.append(vw)
            tabBar.insertSubview(vw, at: 1)
        }
        
        //修改第一个 item 的背景色为选中状态颜色
        self.tabBarItemBgViews[0].backgroundColor = UIColor.black
        
        //自定义中间按钮样式
        self.tabBarItemBgViews[2].backgroundColor = UIColor(red: 17/255, green: 86/255, blue: 136/255, alpha: 1)
        //获取第三个 TabBarItem 对应的 viewController，然后调用修改样式函数
        let vc = self.viewControllers![2] as! ThirdViewController
        vc.initTabBarItem()
    }
//
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag != 2 {
            for one in tabBar.items! {
                if one.tag == item.tag {
                    self.tabBarItemBgViews[one.tag].backgroundColor = UIColor.black
                } else {
                    self.tabBarItemBgViews[one.tag].backgroundColor = UIColor(red: 37/255, green: 29/255, blue: 42/255, alpha: 1)
                }
            }
            
            self.tabBarItemBgViews[2].backgroundColor = UIColor(red: 17/255, green: 86/255, blue: 136/255, alpha: 1)
        }
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print(viewController.tabBarItem.tag)
        if viewController.tabBarItem.tag == 2 {
            
            return false
        } else {
            return true
        }
    }
    

    func showBottomMenu(_ notification: Foundation.Notification) {
        //获取当前 section id
        let tag = notification.object as! Int
        print(tag)
        
        self.bottomMenu.buttonPanel.frame.origin.y = self.view.frame.height
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.bottomMenu.view.alpha = 1
            self.bottomMenu.buttonPanel.frame.origin.y = self.view.frame.height - self.bottomMenu.buttonPanel.frame.height
        }) 
    }
    
    func dismissBottomMenu(_ notification: Foundation.Notification) {
        print(notification.object)
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.bottomMenu.view.alpha = 0
            self.bottomMenu.buttonPanel.frame.origin.y = self.view.frame.height
        }) 
    }
}
