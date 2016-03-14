//
//  Post.swift
//  MyHood
//
//  Created by Ant on 3/14/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import Foundation
import UIKit

class Post: NSObject, NSCoding {
    private var _postTitle: String!
    private var _postDesc: String!
    private var _postImgPath: String!
    
    var postTitle: String {
        return _postTitle
    }
    
    var postDesc: String {
        return _postDesc
    }
    
    var postImgPath: String {
        return _postImgPath
    }
    
    init(postImg: String, postTitle: String, postDesc: String) {
        self._postTitle = postTitle
        self._postDesc = postDesc
        self._postImgPath = postImg
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._postImgPath = aDecoder.decodeObjectForKey("image") as? String
        self._postTitle = aDecoder.decodeObjectForKey("title") as? String
        self._postDesc = aDecoder.decodeObjectForKey("description") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._postImgPath, forKey: "image")
        aCoder.encodeObject(self._postTitle, forKey: "title")
        aCoder.encodeObject(self._postDesc, forKey: "description")
    }
}