//
//  WDGQQAuthProvider.m
//  WilddogAuth
//
//  Created by junpengwang on 16/8/5.
//  Copyright © 2016年 Wilddog. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WDGAuthCredential;

NS_ASSUME_NONNULL_BEGIN

/** @var WDGQQAuthProviderID
  qq 登录方式的 providerID。具体值为 “qq”。
 */
extern NSString *const WDGQQAuthProviderID;

/** @class WDGQQAuthProvider
 @brief qq 登录方式的工厂类，用于生成 qq WDGAuthCredential 凭证。
 */
@interface WDGQQAuthProvider : NSObject

/** @fn credentialWithToken:
 @brief 创建一个 qq 登录方式的 WDGAuthCredential 凭证。
 @param accessToken QQ OAuth access token.
 @return WDGAuthCredential 对象，里面包含 qq 登录凭证.
 */
+ (WDGAuthCredential *)credentialWithAccessToken:(NSString *)accessToken;

/** @fn init
 @brief 这个类不需要初始化.
 */
- (nullable instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
