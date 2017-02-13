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
    
    fileprivate var _username: String!
    fileprivate var _img: UIImage!
    fileprivate var _like: [String]!
    fileprivate var _comments: [[String]]!
    fileprivate var _date: String!
    
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
    
    func removeLikeAtIndex(_ index: Int) {
        self._like.remove(at: index)
    }
    
    func appendLike(_ username: String) {
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
