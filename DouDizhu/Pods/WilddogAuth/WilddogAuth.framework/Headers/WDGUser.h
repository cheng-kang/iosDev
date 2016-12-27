//
//  WDGUser.m
//  WilddogAuth
//
//  Created by junpengwang on 16/8/5.
//  Copyright © 2016年 Wilddog. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WDGAuth.h"
#import "WDGUserInfo.h"

@class WDGUserProfileChangeRequest;

NS_ASSUME_NONNULL_BEGIN

/** @typedef WDGAuthTokenCallback
 @brief 返回用户的 token.
 @see WDGUser.getTokenWithCompletion:
 @see WDGUser.getTokenForcingRefresh:withCompletion:
 @param token 可以为空; 如果请求成功返回用户 idToken。
 @param error 可以为空; error 为 nil 表示请求成功，否则为失败。
 @discussion idToken 和 error 总有一个不为空。
 */
typedef void (^WDGAuthTokenCallback)(NSString *_Nullable idToken, NSError *_Nullable error);

/** @typedef WDGUserProfileChangeCallback
 @brief 用户信息更新时的回调。
 @param error 可以为空; error 为 nil 表示请求成功，否则为失败。
 */
typedef void (^WDGUserProfileChangeCallback)(NSError *_Nullable error);

/** @typedef WDGSendEmailVerificationCallback
 @brief 邮箱验证成功的回调。
 @param 可以为空; error 为 nil 表示请求成功，否则为失败。
 */
typedef void (^WDGSendEmailVerificationCallback)(NSError *_Nullable error);

/** @class WDGUser
 用户对象
 @discussion 这个类能确保线程安全。
 */
@interface WDGUser : NSObject <WDGUserInfo>

/** @property anonymous
 @brief 如果为 YES 则表明为匿名用户。
 */
@property(nonatomic, readonly, getter=isAnonymous) BOOL anonymous;

/** @property emailVerified
 @brief 如果为 YES 则表示和这个帐号关联的邮箱已经验证过。
 */
@property(nonatomic, readonly, getter=isEmailVerified) BOOL emailVerified;

/** @property providerData
 @brief 所有登录方式的用户信息。
 @discussion 不同登录方式之间可以相互绑定，绑定之后可以以任意一种登录方式登录主帐号
 */
@property(nonatomic, readonly, nonnull) NSArray<id<WDGUserInfo>> *providerData;

/** @fn init
 @brief 不要初始化这个对象。
 @discussion 使用 WDGAuth.currentUser 来获取用户对象。
 */
- (nullable instancetype)init NS_UNAVAILABLE;

/** @fn updateEmail:completion:
 @brief 更新帐号邮箱。如果更新成功，本地缓存也会刷新。
 @discussion 如果这个邮箱已经创建过用户，则会更新失败。
 @param email 用户的邮箱地址。
 @param completion 可以为空；如果邮箱更新成功，这个 block 将会被调用。block 为异步等待，会在主线程中回调。
 @discussion 可能错误：
 
 - WDGAuthErrorCodeEmailAlreadyInUse 邮箱已被另一个用户使用。
 - WDGAuthErrorCodeInvalidEmail 邮箱格式错误。
 - WDGAuthErrorCodeRequiresRecentLogin 发生这个错误表明用户在短期内没有登录过，而修改邮箱为敏感操作，必须重新登录才能继续操作。可以调用 WDGUser.reauthenticateWithCredential:completion: 方法。
 - See WDGAuthErrors API 调用可能发生的所有错误。

 */
- (void)updateEmail:(NSString *)email completion:(nullable WDGUserProfileChangeCallback)completion;

/** @fn updatePassword:completion:
 @brief 修改用户密码。如果成功，本地缓存也会被刷新。
 @param password 用户设置的新密码。
 @param completion 可以为空；若果密码修改成功会调用这个 block。block 为异步等待，会在主线程中回调。
 @discussion 可能错误:
 
 - WDGAuthErrorCodeOperationNotAllowed 表明管理员关闭了这种登录方式。
 - WDGAuthErrorCodeRequiresRecentLogin 发生这个错误表明用户在短期内没有登录过，而修改密码为敏感操作，必须重新登录才能继续操作。可以调用 WDGUser.reauthenticateWithCredential:completion: 方法。
 - WDGAuthErrorCodeWeakPassword 密码设置不符合规定。
 - See WDGAuthErrors API 调用可能发生的所有错误。

 */
- (void)updatePassword:(NSString *)password
            completion:(nullable WDGUserProfileChangeCallback)completion;

/** @fn profileChangeRequest
 @brief 创建一个可以改变用户信息的对象。
 @discussion 修改完这个返回对象的属性，然后调用 WDGUserProfileChangeRequest.commitChangesWithCallback: 来完成用户信息的修改。
 @return 返回一个可以用来原子性的修改用户信息的对象。也就是说不会单独某个属性修改成功，而其它的修改失败。
 
 */
- (WDGUserProfileChangeRequest *)profileChangeRequest;

/** @fn reloadWithCompletion:
 @brief 从服务器上获取最新的用户信息。
 @param completion 可以为空；获取信息成功会调用这个 block。block 为异步等待，会在主线程中回调。
 @discussion 可能返回 WDGAuthErrorCodeCredentialTooOld 错误。这种情况下，需要调用 WDGUser.reauthenticateWithCredential:completion: 重新登录。
 @discussion 可能错误：
 
 - See WDGAuthErrors API 调用可能发生的所有错误。
 
 */
- (void)reloadWithCompletion:(nullable WDGUserProfileChangeCallback)completion;

/** @fn reauthenticateWithCredential:completion:
 @brief 重新登录，刷新本地 idToken。
 @param credential 用户提供的登录凭证，服务将会验证他的正确性。这个凭证可以是第三方登录，或者密码登录方式。
 @param param completion 可以为空；重新登录成功时会被调用这个 block，block 为异步等待，会在主线程中回调。
 @discussion 如果用户提供的凭证和之前的不一样或者提供的凭证是错误的。则返回错误信息。当前用户继续保持登录状态。
 @discussion 可能错误：
 
 - WDGAuthErrorCodeInvalidCredential 无效的凭证。
 - WDGAuthErrorCodeOperationNotAllowed 这种登录方式被禁止，可以在野狗应用控制面板打开这个选项。
 - WDGAuthErrorCodeEmailAlreadyInUse 提供的 Email 地址已经被使用。
 - WDGAuthErrorCodeUserDisabled 用户帐号被禁用。
 - WDGAuthErrorCodeWrongPassword 邮箱或者密码错误。
 - WDGAuthErrorCodeUserMismatch 重现登录提供的凭证与当前用户不一致。
 - See WDGAuthErrors API 调用可能发生的所有错误。

 */
- (void)reauthenticateWithCredential:(WDGAuthCredential *)credential
                          completion:(nullable WDGUserProfileChangeCallback)completion;

/** @fn getTokenWithCompletion:
 @brief 获取用户 token。
 @param completion 可以为空；如果 token 可以被获取，则会调用这个 block；
 @discussion 可能错误：
 
 - See WDGAuthErrors API 调用可能发生的所有错误。

 */
- (void)getTokenWithCompletion:(nullable WDGAuthTokenCallback)completion;

/** @fn linkWithCredential:completion:
 @brief 将第三方帐号绑定到当前用户上。以实现通过不同的登录方式登录。
 @param credential 一种登录方式的凭证。
 @param completion 可以为空；当帐号绑定成功或失败会调用这个 block。异步等待，主线程中回调。
 @discussion 可能错误：
 
 - WDGAuthErrorCodeProviderAlreadyLinked 提供的登录方式已经绑定在这个帐号中。
 - WDGAuthErrorCodeCredentialAlreadyInUse 提供的登录方式凭证已经是一个用户。
 - WDGAuthErrorCodeOperationNotAllowed 提供的登录方式被禁用。可以在野狗控制面板中打开。
 - 这个方法也有可能返回 updateEmail:completion: 和 updatePassword:completion: 的错误。
 - See 更多错误请参考 WDGAuthErrors。
 
 */
- (void)linkWithCredential:(WDGAuthCredential *)credential
                completion:(nullable WDGAuthResultCallback)completion;

/** @fn unlinkFromProvider:completion:
 @brief 解绑第三方帐号。
 @param provider 需要解绑的登录方式，可能为 qq、weixin、weibo。
 @param completion 可以为空；请求成功后会被调用的 block，异步等待，主线程中回调。
 @discussion 可能错误：
 
 - WDGAuthErrorCodeNoSuchProvider 此帐号没有绑定需要解绑的登录方式。
 - WDGAuthErrorCodeRequiresRecentLogin 敏感操作，需要重新登录帐号来保证安全性。
 - See 更多错误请参考 WDGAuthErrors。
 
 */
- (void)unlinkFromProvider:(NSString *)provider
                completion:(nullable WDGAuthResultCallback)completion;

/** @fn sendEmailVerificationWithCompletion:
 @brief 发送邮箱验证.
 @param completion 可以为空；当请求成功或失败时会调用这个 block，异步等待，主线程中回调。
 @discussion 可能错误：
 - WDGAuthErrorCodeUserNotFound 没有这个帐号。
 - See 更多错误请参考 WDGAuthErrors。
 */
- (void)sendEmailVerificationWithCompletion:(nullable WDGSendEmailVerificationCallback)completion;

/** @fn deleteWithCompletion:
 @brief 删除这个帐号（如果是当前用户，则退出登录）。
 @param completion 可以为空；删除帐号成功或失败时调用这个 block，异步等待，主线程中回调。
 @discussion 可能错误：
 
 - WDGAuthErrorCodeRequiresRecentLogin 敏感操作，需要重新登录来确保安全性。可以调用 WDGUser.reauthenticateWithCredential:completion:
 - See 更多错误请参考 WDGAuthErrors。

 */
- (void)deleteWithCompletion:(nullable WDGUserProfileChangeCallback)completion;

@end

/** @class WDGUserProfileChangeRequest
 用来更新用户信息。
 @discussion 当属性设置为 nil 时，这个属性会被清空。

 */
@interface WDGUserProfileChangeRequest : NSObject

/** @fn init
 @brief 使用 WDGUser.profileChangeRequest
 */
- (nullable instancetype)init NS_UNAVAILABLE;

/** @property displayName
 @brief 用户名
 @discussion 必须在使用  WDGUserProfileChangeRequest.commitChangesWithCallback: 方法前设置这个参数。

 */
@property(nonatomic, copy, nullable) NSString *displayName;

/** @property photoURL
 @brief 用户头像
 @discussion 必须在使用  WDGUserProfileChangeRequest.commitChangesWithCallback: 方法前设置这个参数。
 */
@property(nonatomic, copy, nullable) NSURL *photoURL;

/** @fn commitChangesWithCompletion:
 @brief 提交更改
 @discussion 修改属性必须在这个方法调用之前。
 @param completion 可以为空；请求成功或失败时调用这个 block。异步等待，主线程中回调。

 */
- (void)commitChangesWithCompletion:(nullable WDGUserProfileChangeCallback)completion;

@end

NS_ASSUME_NONNULL_END
