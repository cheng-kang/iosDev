//
//  TabDataService.swift
//  FenghuangXinwen
//
//  Created by Ant on 4/13/16.
//  Copyright © 2016 Ant. All rights reserved.
//

import Foundation

class TabDataService {
    static var instance = TabDataService()
    
    fileprivate var _tabData = [
        [
            "头条",
            "推荐",
            "娱乐",
            "财经",
            "暖新闻",
            "时政",
            "自媒体",
            "凤凰卫视",
            "科技",
            "良品",
            "美女",
            "军事",
            "体育",
            "历史",
            "汽车",
            "时尚",
            "房产",
            "FUN来了",
            "段子",
            "萌物",
        ],
        [
            "直播",
            "数码",
            "图片",
            "游戏",
            "未来",
            "港澳",
            "文化",
            "健康",
            "读书",
            "星座",
            "评论",
            "佛教",
            "旅游",
            "图片",
            "游戏",
            "未来",
            "港澳",
            "文化",
            "健康",
            "读书",
            "星座",
            "评论",
            "佛教",
            "旅游"
        ]
    ]
    
    var tabData: [[String]] {
        return self._tabData
    }
    
    func appendToTabData(_ section: Int, newElement: String) {
        self._tabData[section].append(newElement)
    }
    
    func insertIntoTabDataAtIndex(_ section: Int, newElement: String, index: Int) {
        self._tabData[section].insert(newElement, at: index)
    }
    
    func removeFromTabDataAtIndex(_ section: Int, index: Int) {
        self._tabData[section].remove(at: index)
    }
}
