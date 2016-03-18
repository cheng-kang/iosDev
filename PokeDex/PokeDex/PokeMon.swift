//
//  PokeMon.swift
//  PokeDex
//
//  Created by Ant on 3/17/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class PokeMon {
    private var _id: String!
    private var _name: String!
    private var _img: UIImage!
    private var _type: String!
    private var _weight: String!
    private var _height: String!
    private var _hp: String!
    private var _attack: String!
    private var _defense: String!
    private var _desc: String!
    private var _evoID: String!
    private var _evoName: String!
    
    private var _pokemonURL: String!
    
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
    
    var typeName: String {
        return POKEMON_TYPES[_type]![0] as! String
    }
    
    var typeColor: UIColor {
        return POKEMON_TYPES[_type]![1] as! UIColor
    }
    
    var idLbl: String {
        return "No. "+_id
    }
    
    var weight: String {
        if _weight == nil {
            _weight = "?"
        }
        return _weight
    }
    
    var height: String {
        if _height == nil {
            _height = "?"
        }
        return _height
    }
    
    var hp: String {
        if _hp == nil {
            _hp = "?"
        }
        return _hp
    }
    
    var attack: String {
        if _attack == nil {
            _attack = "?"
        }
        return _attack
    }
    
    var defense: String {
        if _defense == nil {
            _defense = "?"
        }
        return _defense
    }
    
    var desc: String {
        if _desc == nil {
            _desc = "?"
        }
        return _desc
    }
    
    var evoID: String {
        if _evoID == nil {
            _evoID = "0"
        }
        return _evoID
    }
    
    var evoName: String {
        if _evoName == nil {
            _evoName = "?"
        }
        return _evoName
    }
    
    
    
    init(id: String, name: String, type: String) {
        self._id = id
        self._name = name
        self._img = UIImage(named: id)
        self._type = type
        
        self._pokemonURL = URL_BASE+URL_POKEMON+self._id
    }
    
    func downloadPokeMonDetails(completed: DownloadComplete) {
        
        let url = NSURL(string: _pokemonURL)!
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let hp = dict["hp"] as? Int {
                    self._hp = "\(hp)"
                }
                
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String, AnyObject>] where evolutions.count > 0 {
                    if let evolution = evolutions[0] as? Dictionary<String, AnyObject> {
                        self._evoName = evolution["to"] as! String
                        
                        let resourceUriArr = evolution["resource_uri"]!.componentsSeparatedByString(URL_POKEMON)
                        let restArr = resourceUriArr[1].componentsSeparatedByString("/")
                        let evoID = restArr[0]
                        self._evoID = evoID
                        
                    }
                    
                }
                
                if let descs = dict["descriptions"] as? [Dictionary<String, AnyObject>] where descs.count > 0 {
                    if let desc = descs[0] as? Dictionary<String, AnyObject> {
                        let uri = desc["resource_uri"] as! String
                        let resourceUrl = NSURL(string: URL_BASE+uri)
                        Alamofire.request(.GET, resourceUrl!).responseJSON { response in
                            let result = response.result
                            
                            if let dict = result.value as? Dictionary<String, AnyObject> {
                                if let desc = dict["description"] as? String {
                                    self._desc = desc
                                }
                            }
                            
                            completed()
                        }
                        
                    }
                }
            }
        }
        
    }
}
