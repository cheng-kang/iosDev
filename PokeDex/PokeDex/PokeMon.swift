//
//  PokeMon.swift
//  PokeDex
//
//  Created by Ant on 3/17/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import Foundation
import UIKit

class PokeMon {
    private var _id: String!
    private var _name: String!
    private var _img: UIImage!
    private var _type: String!
    
    var id: String {
        return _id
    }
    
    var name: String {
        return _name.capitalizedString
    }
    
    var img: UIImage {
        return _img
    }
    
    var type: String {
        return _type
    }
    
    var idLbl: String {
        return "No. "+_id
    }
    
    init(id: String, name: String, type: String) {
        self._id = id
        self._name = name
        self._img = UIImage(named: id)
        self._type = type
    }
}
