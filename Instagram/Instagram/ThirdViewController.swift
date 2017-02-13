//
//  ThirdViewController.swift
//  Instagram
//
//  Created by Ant on 3/31/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func initTabBarItem() {
        
        self.tabBarItem = UITabBarItem(title: nil, image: self.tabBarItem.image?.withRenderingMode(.alwaysOriginal), tag: self.tabBarItem.tag)
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
    }
}
