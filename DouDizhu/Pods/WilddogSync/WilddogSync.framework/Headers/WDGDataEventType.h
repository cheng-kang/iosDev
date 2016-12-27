//
//  WDGDataEventType.h
//  Wilddog
//
//  Created by Garin on 15/7/7.
//  Copyright (c) 2015年 Wilddog. All rights reserved.
//

#ifndef Wilddog_WDGDataEventType_h
#define Wilddog_WDGDataEventType_h

/**
 *  枚举类型，主要用于监听数据变化。
 */
typedef NS_ENUM(NSInteger, WDGDataEventType){
    /**
     *  0, 当有新增子节点时触发
     */
    WDGDataEventTypeChildAdded,
    /**
     *  1, 当有子节点被删除时触发
     */
    WDGDataEventTypeChildRemoved,
    /**
     *  2, 当某个子节点发生变化时触发
     */
    WDGDataEventTypeChildChanged,
    /**
     *  3, 当有子节排序发生变化时触发
     */
    WDGDataEventTypeChildMoved,
    /**
     *  4, 当有数据请求或有任何数据发生变化时触发
     */
    WDGDataEventTypeValue
};

#endif
