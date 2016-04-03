//
//  Post.swift
//  Instagram
//
//  Created by Ant on 4/2/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import Foundation
import UIKit

class Post {
    
    private var _username: String!
    private var _img: UIImage!
    private var _like: [String]!
    private var _comments: [[String]]!
    private var _date: String!
    
    var username: String {
        return _username
    }
    
    var img: UIImage {
        return _img
    }
    
    var like: [String] {
        return _like
    }
    
    var comments: [[String]] {
        return _comments
    }
    
    var date: String {
        return _date
    }
    
    func removeLikeAtIndex(index: Int) {
        self._like.removeAtIndex(index)
    }
    
    func appendLike(username: String) {
        self._like.append(username)
    }
    
    init(username: String, img: UIImage, like: [String], comments: [[String]], date: String) {
        self._username = username
        self._img = img
        self._like = like
        self._comments = comments
        self._date = date
    }
}