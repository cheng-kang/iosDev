//
//  WDGServerValue.h
//  WilddogSync
//
//  Created by junpengwang on 16/9/8.
//  Copyright © 2016年 wilddog. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * Placeholder values you may write into Firebase Database as a value or priority
 * that will automatically be populated by the Firebase Database server.
 */
@interface WDGServerValue : NSObject
/**
 * Placeholder value for the number of milliseconds since the Unix epoch
 */
+ (NSDictionary *)timestamp;

@end


NS_ASSUME_NONNULL_END