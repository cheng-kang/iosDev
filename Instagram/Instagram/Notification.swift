//
//  Notification.swift
//  Instagram
//
//  Created by Ant on 4/4/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import Foundation
import UIKit

class Notification {
    
    private var _from: String!
    private var _fromAvatar: UIImage!
    private var _to: String!
    private var _toAvatar: UIImage!
    private var _type: String!
    private var _msg: String!
    private var _images: [UIImage]!
    private var _date: String!
    
    var from: String {
        return _from
    }
    
    var fromAvatar: UIImage {
        return _fromAvatar
    }
    
    var to: String {
        return _to
    }
    
    var toAvatar: UIImage {
        return _toAvatar
    }
    
    var type: String {
        return _type
    }
    
    var msg: String {
        return _msg
    }
    
    var images: [UIImage] {
        return _images
    }
    
    var date: String {
        return _date
    }
    
    init(from: String, fromAvatar: UIImage, to: String, toAvatar: UIImage, type: String, images: [UIImage], date: String) {
        self._from = from
        self._fromAvatar = fromAvatar
        self._to = to
        self._toAvatar = toAvatar
        self._type = type
        self._images = images
        self._date = date
    }
}
