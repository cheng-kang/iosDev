//
//  WDGOptions.h
//  WilddogSync
//
//  Created by junpengwang on 16/9/8.
//  Copyright © 2016年 wilddog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDGOptions : NSObject

/**
 * Sync 的根路径 URL, e.g. @"http://your-appid.wilddogio.com".
 */
@property(nonatomic, readonly, copy) NSString *syncURL;

/**
 *  初始化 WDGOptions
 *
 *  @param syncURL Sync 的根路径 URL, e.g. @"http://your-appid.wilddogio.com".
 *
 *  @return 初始化成功的 WDGOptions 实例
 */
- (instancetype)initWithSyncURL:(NSString *)syncURL;

@end
