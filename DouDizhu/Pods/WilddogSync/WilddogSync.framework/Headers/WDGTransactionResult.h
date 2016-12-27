//
//  WDGTransactionResult.h
//  Wilddog
//
//  Created by Garin on 15/7/10.
//  Copyright (c) 2015年 Wilddog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDGMutableData.h"

NS_ASSUME_NONNULL_BEGIN

/**
 *  用于 runTransactionBlock: 方法中，WDGTransactionResult 实例是事务处理结果的载体
 */
@interface WDGTransactionResult : NSObject

/**
 * 用于 runTransactionBlock: 方法中。 表明传入参数 value 应保存在这个节点处
 *
 * @param value 一个包含新 value 的 WDGMutableData 实例
 * @return 返回一个 WDGTransactionResult 实例，它可以作为给 runTransactionBlock: 方法中 block 的一个返回值
 */
+ (WDGTransactionResult *)successWithValue:(WDGMutableData *)value;


/**
 * 用于 runTransactionBlock: 方法中。 使用该方法可以主动终止当前事务
 *
 * @return 返回一个 WDGTransactionResult 实例，它可以作为给 runTransactionBlock: 方法中 block 的一个返回值
 */
+ (WDGTransactionResult *)abort;
@end

NS_ASSUME_NONNULL_END