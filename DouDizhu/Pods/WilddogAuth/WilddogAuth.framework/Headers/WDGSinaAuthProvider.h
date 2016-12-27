//
//  WDGSinaAuthProvider.m
//  WilddogAuth
//
//  Created by junpengwang on 16/8/5.
//  Copyright © 2016年 Wilddog. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WDGAuthCredential;

NS_ASSUME_NONNULL_BEGIN

/** @var WDGSinaAuthProviderID
  Sina 登录方式的 providerID。具体值为 “weibo”。
 */
extern NSString *const WDGSinaAuthProviderID;

/** @class WDGSinaAuthProvider
 @brief Sina 登录方式的工厂类，用于生成 Sina WDGAuthCredential 凭证。
 */
@interface WDGSinaAuthProvider : NSObject

/** @fn credentialWithToken:openID:
 @brief 创建一个 Sina 登录方式的 WDGAuthCredential 凭证。
 @param accessToken Sina OAuth access token.
 @param userID Sina OAuth 的 userID。
 @return WDGAuthCredential 对象，里面包含 Sina 登录凭证.
 */
+ (WDGAuthCredential *)credentialWithAccessToken:(NSString *)accessToken userID:(NSString *)userID;

/** @fn init
 @brief 这个类不需要初始化。
 */
- (nullable instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END

