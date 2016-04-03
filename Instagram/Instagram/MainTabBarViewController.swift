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
        
        self.tabBar.tintColor = UIColor.whiteColor()
        for it in self.tabBar.items! {
            it.badgeValue = "100"
        }
        
        self.delegate = self
        
        
        self.bottomMenu = self.storyboard?.instantiateViewControllerWithIdentifier("BottomMenu") as! BottomMenuView
        self.bottomMenu.modalTransitionStyle = .CoverVertical
        self.view.addSubview(self.bottomMenu.view)
        self.bottomMenu.view.alpha = 0
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showBottomMenu:", name: "ShowBottomMenu", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "dismissBottomMenu:", name: "DismissBottomMenu", object: nil)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        let ITEM_WIDTH = self.tabBar.frame.width / 5
        let ITEM_HEIGHT = CGFloat(49)
        
        //初始化 tab bar item 背景层
        for one in self.tabBar.items! {
            let vw = UIView()
            vw.backgroundColor = UIColor(red: 37/255, green: 29/255, blue: 42/255, alpha: 1)
            vw.frame = CGRectMake(ITEM_WIDTH * CGFloat(one.tag), 0, ITEM_WIDTH, ITEM_HEIGHT)
            self.tabBarItemBgViews.append(vw)
            tabBar.insertSubview(vw, atIndex: 1)
        }
        
        //修改第一个 item 的背景色为选中状态颜色
        self.tabBarItemBgViews[0].backgroundColor = UIColor.blackColor()
        
        //自定义中间按钮样式
        self.tabBarItemBgViews[2].backgroundColor = UIColor(red: 17/255, green: 86/255, blue: 136/255, alpha: 1)
        //获取第三个 TabBarItem 对应的 viewController，然后调用修改样式函数
        let vc = self.viewControllers![2] as! ThirdViewController
        vc.initTabBarItem()
    }
//
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        if item.tag != 2 {
            for one in tabBar.items! {
                if one.tag == item.tag {
                    self.tabBarItemBgViews[one.tag].backgroundColor = UIColor.blackColor()
                } else {
                    self.tabBarItemBgViews[one.tag].backgroundColor = UIColor(red: 37/255, green: 29/255, blue: 42/255, alpha: 1)
                }
            }
            
            self.tabBarItemBgViews[2].backgroundColor = UIColor(red: 17/255, green: 86/255, blue: 136/255, alpha: 1)
        }
        
    }
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        print(viewController.tabBarItem.tag)
        if viewController.tabBarItem.tag == 2 {
            
            return false
        } else {
            return true
        }
    }
    

    func showBottomMenu(notification: NSNotification) {
        //获取当前 section id
        let tag = notification.object as! Int
        print(tag)
        
        self.bottomMenu.buttonPanel.frame.origin.y = self.view.frame.height
        UIView.animateWithDuration(0.3) { () -> Void in
            self.bottomMenu.view.alpha = 1
            self.bottomMenu.buttonPanel.frame.origin.y = self.view.frame.height - self.bottomMenu.buttonPanel.frame.height
        }
    }
    
    func dismissBottomMenu(notification: NSNotification) {
        print(notification.object)
        UIView.animateWithDuration(0.3) { () -> Void in
            self.bottomMenu.view.alpha = 0
            self.bottomMenu.buttonPanel.frame.origin.y = self.view.frame.height
        }
    }
}
