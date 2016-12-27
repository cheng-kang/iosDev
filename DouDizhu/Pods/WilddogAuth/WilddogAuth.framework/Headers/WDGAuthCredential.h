//
//  WDGAuthCredential.m
//  WilddogAuth
//
//  Created by junpengwang on 16/8/5.
//  Copyright © 2016年 Wilddog. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** @class WDGAuthCredential
  代表一个凭证。
 */
@interface WDGAuthCredential : NSObject

/** @property provider
 @brief 获取凭证的 id 名。
 */
@property(nonatomic, copy, readonly) NSString *provider;

/** @fn init
 @brief 这是一个抽象类。具体事例化需要用 provider 工厂生成（比如 Sina provider 或者 Weixin provider）。
 */
- (nullable instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
