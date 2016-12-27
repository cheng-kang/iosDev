//
//  WDGAuth.m
//  WilddogAuth
//
//  Created by junpengwang on 16/8/5.
//  Copyright © 2016年 Wilddog. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WDGAuthErrors.h"

@class WDGAuth;
@class WDGAuthCredential;
@class WDGUser;
@class WDGApp;
@protocol WDGAuthStateListener;

NS_ASSUME_NONNULL_BEGIN

/** @typedef WDGAuthStateDidChangeListenerHandle
 @brief 返回 WDGAuth.addAuthStateDidChangeListener: 的 handle，用它可以移除 auth 状态的监听。
 */
typedef id<NSObject> WDGAuthStateDidChangeListenerHandle;

/** @typedef WDGAuthStateDidChangeListenerBlock
 @brief 当 auth 的状态发生变化时，会调用这个 block。
 @param auth 状态发生变化的 WDGAuth 对象。
 @param user 可以为空；当前登录的用户。
 */
typedef void(^WDGAuthStateDidChangeListenerBlock)(WDGAuth *auth, WDGUser *_Nullable user);

/** @var WDGAuthStateDidChangeNotification
 @brief 当 auth 状态发生变化时，会以这个消息名发送 NSNotificationCenter notification（比如：生成了一个新的 token，一个用户登录或者退出登录）。消息的 object 参数为 WDGAuth 对象。
 */
extern NSString *const WDGAuthStateDidChangeNotification;

/** @typedef WDGAuthResultCallback
 @brief 当登录相关的事件触发时，这个 block 会被调用。
 @param user 可以为空；成功登录的用户。
 @param error 可以为空；如果 error 为 nil 表示登录成功，如果登录失败会返回相应的错误信息。
 */
typedef void (^WDGAuthResultCallback)(WDGUser *_Nullable user, NSError *_Nullable error);

/** @typedef WDGProviderQueryCallback
 @brief 当通过邮箱获取用户的所有登录方式时会调用这个 block。
 @param user 可以为空； 登录方式列表。有可能有 password，qq，weixin，weibo，custom，anonymous。
 @param error 可以为空；如果 error 为 nil 表示获取登录方式成功。否则表示失败。
 */
typedef void (^WDGProviderQueryCallback)(NSArray<NSString *> *_Nullable providers,
                                         NSError *_Nullable error);

/** @typedef WDGSendPasswordResetCallback
 @brief 当调用重置密码接口会调用这个 block。
 @param error 可以为空；如果发生错误，会以 NSError 的方式返回错误描述。nil 表示成功。
 */
typedef void (^WDGSendPasswordResetCallback)(NSError *_Nullable error);

/** @class WDGAuth
 为 Wilddog 应用管理用户认证。
 @discussion 这个类能确保线程安全。
 */
@interface WDGAuth : NSObject

/** @fn auth
 @brief 获取 auth 对象。如果之前没有创建过 auth 对象，会自动创建一个。
 @discussion 能确保线程安全。
 */
+ (nullable WDGAuth *)auth NS_SWIFT_NAME(auth());

/** @fn authWithApp:
 @brief 通过 WDGApp 来创建 WDGAuth 对象。
 @param app 用来创建 WDGAuth 对象的 WDGApp.
 */
+ (nullable WDGAuth *)authWithApp:(WDGApp *)app;

/** @property app
 @brief 这个 WDGAuth 对象所属的 App.
 */
@property(nonatomic, weak, readonly, nullable) WDGApp *app;

/** @property currentUser
 @brief 同步的获取当前缓存的用户，如果没有登录用户则为 null。
 */
@property(nonatomic, strong, readonly, nullable) WDGUser *currentUser;

/** @fn init
 @brief 使用 WDGAuth.authWithAppID: 来获取 auth 对象。
 */
- (nullable instancetype)init NS_UNAVAILABLE;

/** @fn fetchProvidersForEmail:completion:
 @brief 通过邮箱来获取用户的所有登录方式。登录方式可能有（password，qq，weixin，weibo，custom，anonymous）。
 @param email 用户的邮箱。
 @param completion 可以为空；返回用户的登录方式列表或者错误信息。异步等待，会在主线程中回调。
 @discussion 可能发生的错误：
 
 - WDGAuthErrorCodeInvalidEmail - 表示邮箱格式错误。
 - See WDGAuthErrors API 调用可能发生的所有错误。
 
 */
- (void)fetchProvidersForEmail:(NSString *)email
                    completion:(nullable WDGProviderQueryCallback)completion;

/** @fn signInWithEmail:password:completion:
 @brief 以邮箱和密码的方式登录。
 @param email 用户的邮箱地址。
 @param password 用户的登录密码。
 @param completion 可以为空；当用户登录成功或者发生错误时触发。异步等待，会在主线程中回调。
 
 @discussion **可能错误：**
 
 - WDGAuthErrorCodeOperationNotAllowed 表示密码登录的方式没有打开，可以在野狗控制面板中打开这个选项。
 - WDGAuthErrorCodeUserDisabled 表示这个用户被禁止登录。
 - WDGAuthErrorCodeWrongPassword 表示邮箱或者密码错误。
 - See WDGAuthErrors API 调用可能发生的所有错误。
 
 */
- (void)signInWithEmail:(NSString *)email
               password:(NSString *)password
             completion:(nullable WDGAuthResultCallback)completion;

/** @fn signInWithCredential:completion:
 @brief 使用第三方认证方式登录（e.g. 新浪微博，qq，weixin 授权后使用它们的 Access Token 和 openId 在野狗服务器上生成用户）
 @param credential 第三方提供的凭证。
 @param completion 可以为空；当用户登录成功或者发生错误时触发。异步等待，会在主线程中回调。
 @discussion 可能错误：
 
 - WDGAuthErrorCodeInvalidCredential 表示无效的登录方式。
 - WDGAuthErrorCodeOperationNotAllowed 表示这种登录方式没有打开，可以在野狗控制面板中打开这个选项。
 - WDGAuthErrorCodeUserDisabled 表示账号被禁用。
 - WDGAuthErrorCodeWrongPassword 表示邮箱或着密码错误。
 - See WDGAuthErrors API 调用可能发生的所有错误。
 
 */

- (void)signInWithCredential:(WDGAuthCredential *)credential
                  completion:(nullable WDGAuthResultCallback)completion;

/** @fn signInAnonymouslyWithCompletion:
 @brief 匿名登录方式。
 @param completion 可以为空；请求成功会触发的 block。异步等待，会在主线程中回调。
 @discussion 如果已经有一个匿名用户登录，那么会替换这个用户。如果已经有其他用户登录，那么会先把他退出登录。
 @discussion 可能错误：
 
 -  WDGAuthErrorCodeOperationNotAllowed 表示匿名登录方式没有打开，可以在野狗的控制面板中打开这个选项。
 - See WDGAuthErrors API 调用可能发生的所有错误。
 
 */
- (void)signInAnonymouslyWithCompletion:(nullable WDGAuthResultCallback)completion;

/** @fn signInWithCustomToken:completion:
 @brief 以自定义 token 的方式登录。
 @param token 自定义的 token。
 @param completion 可以为空；请求成功会触发的 block。异步等待，会在主线程中回调。
 @discussion 可能错误：
 
 - WDGAuthErrorCodeInvalidCustomToken 无效的 custom token。
 - WDGAuthErrorCodeCustomTokenMismatch Indicates the service account and the API key
 belong to different projects.
 - See WDGAuthErrors API 调用可能发生的所有错误。
 
 */
- (void)signInWithCustomToken:(NSString *)token
                   completion:(nullable WDGAuthResultCallback)completion;

/** @fn createUserWithEmail:password:completion:
 @brief 创建一个新用户，创建成功后会自动登录。
 @param email 用户的邮箱地址。
 @param password 用户指定的密码。
 @param completion 可以为空；请求成功会触发的 block。异步等待，会在主线程中回调。
 
 @discussion 可能错误：
 
 - WDGAuthErrorCodeInvalidEmail 表示邮箱格式错误。
 - WDGAuthErrorCodeEmailAlreadyInUse 表示邮箱已经被注册。
 - WDGAuthErrorCodeOperationNotAllowed 表示匿名登录方式没有打开，可以在野狗的控制面板中打开这个选项。
 - WDGAuthErrorCodeWeakPassword 密码不符合规定。
 - See WDGAuthErrors API 调用可能发生的所有错误。
 
 */
- (void)createUserWithEmail:(NSString *)email
                   password:(NSString *)password
                 completion:(nullable WDGAuthResultCallback)completion;

/** @fn sendPasswordResetWithEmail:completion:
 @brief 通过邮箱找回密码。
 @param email 用户的邮箱地址。
 @param completion 可以为空；请求成功会触发的 block。异步等待，会在主线程中回调。
 @discussion 可能错误：
 
- See WDGAuthErrors API 调用可能发生的所有错误。
 
 */
- (void)sendPasswordResetWithEmail:(NSString *)email
                        completion:(nullable WDGSendPasswordResetCallback)completion;

/** @fn signOut:
 @brief 退出登录。
 @param error 可以为空；如果发生错误，会以 NSError 的方式返回错误描述。nil 表示成功。
 @return @YES 表示退出登录成功。@NO 表示失败。
 */
- (BOOL)signOut:(NSError *_Nullable *_Nullable)error;

/** @fn addAuthStateDidChangeListener:
 @brief 监听用户 auth 状态。发生以下条件时会被调用：
 
 - 第一次调用时，
 - 当前用户切换时，
 - 或者当前用户的 idToken 变化时。
 
 @param listener 状态变化时调用的 block。异步等待，会在主线程中回调。
 
 @discussion 这个方法被调用时就会触发 block 的回调。之后会一直处于监听状态，并且 block 会被 WDGAuth 持有，直到移除这个监听。需要防止引用循环。
 
 @return 返回这个 block 的唯一标示，用于移除这个 block。
 
 */
- (WDGAuthStateDidChangeListenerHandle)addAuthStateDidChangeListener:(WDGAuthStateDidChangeListenerBlock)listener;

/** @fn removeAuthStateDidChangeListener:
 @brief 移除 auth 状态变更监听。
 @param listenerHandle WDGAuth.addAuthStateDidChangeListener: 返回的句柄。
 */
- (void)removeAuthStateDidChangeListener:(WDGAuthStateDidChangeListenerHandle)listenerHandle;

@end

NS_ASSUME_NONNULL_END
