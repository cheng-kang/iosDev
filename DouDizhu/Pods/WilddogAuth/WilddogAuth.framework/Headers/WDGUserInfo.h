//
//  WDGUserInfo.h
//  WilddogAuth
//
//  Created by junpengwang on 16/8/5.
//  Copyright © 2016年 Wilddog. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/** @protocol WDGUserInfo
    用户信息
 */
@protocol WDGUserInfo <NSObject>

/** @property providerID
    @brief 用户登录方式。
 */
@property(nonatomic, copy, readonly) NSString *providerID;

/** @property uid
    @brief 用户 id。
 */
@property(nonatomic, copy, readonly) NSString *uid;

/** @property displayName
    @brief 用户名。
 */
@property(nonatomic, copy, readonly, nullable) NSString *displayName;

/** @property photoURL
    @brief 用户头像。
 */
@property(nonatomic, copy, readonly, nullable) NSURL *photoURL;

/** @property email
    @brief 用户邮箱地址。
 */
@property(nonatomic, copy, readonly, nullable) NSString *email;

@end

NS_ASSUME_NONNULL_END
