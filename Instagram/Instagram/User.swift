//
//  User.swift
//  Instagram
//
//  Created by Ant on 4/3/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import Foundation
import UIKit

class User {
    private var _username: String!
    private var _avatar: UIImage!
    
    var username: String {
        return _username
    }
    
    var avatar: UIImage {
        return _avatar
    }
    
    init(username: String, avatar: UIImage) {
        self._username = username
        self._avatar = avatar
    }
}