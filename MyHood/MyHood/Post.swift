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
    fileprivate var _postTitle: String!
    fileprivate var _postDesc: String!
    fileprivate var _postImgPath: String!
    
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
        self._postImgPath = aDecoder.decodeObject(forKey: "image") as? String
        self._postTitle = aDecoder.decodeObject(forKey: "title") as? String
        self._postDesc = aDecoder.decodeObject(forKey: "description") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._postImgPath, forKey: "image")
        aCoder.encode(self._postTitle, forKey: "title")
        aCoder.encode(self._postDesc, forKey: "description")
    }
}
