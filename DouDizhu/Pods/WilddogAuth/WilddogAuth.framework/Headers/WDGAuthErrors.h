//
//  WilddogAuth.m
//  WilddogAuth
//
//  Created by junpengwang on 16/8/5.
//  Copyright © 2016年 Wilddog. All rights reserved.
//

#import <Foundation/Foundation.h>

/** @class WDGAuthErrors
 如果在 WilddogAuth 的回调方法中收到一个非空 NSError 参数，则表示出现了错误。 要想实现正确的错误逻辑处理，请对照常见错误和下面所列的方法特定错误检查错误代码。
 有些错误可通过特定用户操作解决。例如，WDGAuthErrorCodeUserTokenExpired 可通过重新登录该用户解决，WDGAuthErrorCodeWrongPassword 可通过让用户提供正确密码解决。
 除 WDGAuthErrorCodeNetworkError 或 WDGAuthErrorCodeTooManyRequests 之外，用相同参数重试一个失败的操作决不会成功。切勿对操作在服务器端是否生效进行任何假设。+
 
 调试或打印错误时，请查阅 userInfo 字典。WDGAuthErrorNameKey 包含可用于识别错误的跨平台错误名字符串。NSLocalizedDescriptionKey 包含错误说明。此说明只适合开发者使用，不适合用户使用。NSUnderlyingErrorKey 包含引起所述错误的基础错误（如果存在基础错误）。
 除了上面所列的主要字段外，userInfo 字典中可能还提供了一些您在诊断错误时可能觉得有用的其他字段。

 */
@interface WDGAuthErrors : NSObject

/** @var WDGAuthErrorDomain
 @brief The Wilddog Auth error domain.
 */
extern NSString *const WDGAuthErrorDomain;

/** @var WDGAuthErrorNameKey
 @brief The name of the key for the "error_name" string in the NSError userinfo dictionary.
 */
extern NSString *const WDGAuthErrorNameKey;

/** @enum WDGAuthErrorCode
 @brief Error codes used by Wilddog Auth.
 */
typedef NS_ENUM(NSInteger, WDGAuthErrorCode) {
    /** 表示自定义令牌验证错误。
     */
    WDGAuthErrorCodeInvalidCustomToken = 17000,
    
    /** 如果凭据到期或格式不正确，则可能发生此错误。
     */
    WDGAuthErrorCodeInvalidCredential = 17004,
    
    /** 表示该用户的帐户已停用。
     */
    WDGAuthErrorCodeUserDisabled = 17005,
    
    /** 表示用凭据表示用户身份提供程序的帐户尚未启用。请在 Wilddog 控制面板的“用户认证”部分启用该帐户。
     */
    WDGAuthErrorCodeOperationNotAllowed = 17006,
    
    /** 表示用该凭据声明的电子邮件已被一个现有帐户使用，无法用此登录方法进行身份验证。 请为此用户电子邮件调用 fetchProvidersForEmail，然后提示其用返回的任何登录提供程序登录。
     */
    WDGAuthErrorCodeEmailAlreadyInUse = 17007,
    
    /** 表示该电子邮件地址格式不正确。
     */
    WDGAuthErrorCodeInvalidEmail = 17008,
    
    /** 表示用户尝试用错误密码登录。
     */
    WDGAuthErrorCodeWrongPassword = 17009,
    
    /** 表示从调用方设备向 Wilddog Authentication 服务器的异常请求达到一定数量后，该请求被阻止。 请在稍后重试。
     */
    WDGAuthErrorCodeTooManyRequests = 17010,
    
    /** 表示未找到该用户帐户。
     */
    WDGAuthErrorCodeUserNotFound = 17011,
    
    /**
     */
    WDGAuthErrorCodeAccountExistsWithDifferentCredential = 17012,
    
    /**
     */
    WDGAuthErrrorCodeAccountExistsWithDifferentCredential = 17012,
    
    /** 更新用户密码是一项安全相关操作，需要该用户的最近一次登录。此错误表示该用户近期长时间没有登录过。要解决此错误，请在 WDGUser 上调用 reauthenticateWithCredential:completion:，对该用户重新进行身份验证。
     */
    WDGAuthErrorCodeRequiresRecentLogin = 17014,
    
    /** 表示尝试关联的登录方式的类型已经关联到此帐户。
     */
    WDGAuthErrorCodeProviderAlreadyLinked = 17015,
    
    /** 表示尝试取消关联的提供程序没有关联到该帐户。
     */
    WDGAuthErrorCodeNoSuchProvider = 17016,
    
    /** token 失效，您必须提示该用户在此设备重新登录。
     */
    WDGAuthErrorCodeInvalidUserToken = 17017,
    
    /**表示在操作过程中出现网络错误。
     */
    WDGAuthErrorCodeNetworkError = 17020,
    
    /** 表示当前用户的令牌已到期。例如，该用户可能在另一台设备上更改了帐户密码。 您必须提示该用户在此设备上重新登录。
     */
    WDGAuthErrorCodeUserTokenExpired = 17021,
    
    /**
     */
    WDGAuthErrorCodeUserMismatch = 17024,
    
    /** 表示尝试关联的凭据已与另一个不同 Wilddog 帐户关联。
     */
    WDGAuthErrorCodeCredentialAlreadyInUse = 17025,
    
    /** 表示尝试设置的密码被认为太弱。
     */
    WDGAuthErrorCodeWeakPassword = 17026,
    
    /**
     */
    WDGAuthErrorCodeAppNotAuthorized = 17028,
    
    /**
     */
    WDGAuthErrorCodeKeychainError = 17995,
    
    /** 表示出现内部错误。 请用整个 NSError 对象报告错误。    
     */
    WDGAuthErrorCodeInternalError = 17999,
};

@end
