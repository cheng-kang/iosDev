//
//  WDGWeiXinAuthProvider.m
//  WilddogAuth
//
//  Created by junpengwang on 16/8/5.
//  Copyright © 2016年 Wilddog. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WDGAuthCredential;

NS_ASSUME_NONNULL_BEGIN

/** @var WDGWeiXinAuthProviderID
  Weixin 登录方式的 providerID。具体值为 “weixin”。
 */
extern NSString *const WDGWeiXinAuthProviderID;

/** @class WDGWeixinAuthProvider
 @brief Weixin 登录方式的工厂类，用于生成 Weixin WDGAuthCredential 凭证。
 */
@interface WDGWeiXinAuthProvider : NSObject

/** @fn credentialWithToken:openID:
 @brief 创建一个 Weixin 登录方式的 WDGAuthCredential 凭证。
 @param code Weixin OAuth code.
 @return WDGAuthCredential 对象，里面包含 WeiXin 登录凭证。
 */
+ (WDGAuthCredential *)credentialWithCode:(NSString *)code;

/** @fn init
 @brief 这个类不需要初始化。
 */
- (nullable instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END


