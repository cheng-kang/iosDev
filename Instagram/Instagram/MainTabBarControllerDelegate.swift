//
//  MainTabBarControllerDelegate.swift
//  Instagram
//
//  Created by Ant on 3/31/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarControllerDelegate: NSObject, UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print(viewController.tabBarItem.tag)
        if viewController.tabBarItem.tag == 2 {
            return false
        } else {
            return true
        }
    }
}
