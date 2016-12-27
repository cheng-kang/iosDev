//
//  WDGApp.h
//  WilddogSync
//
//  Created by junpengwang on 16/9/8.
//  Copyright © 2016年 wilddog. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WDGOptions;

NS_ASSUME_NONNULL_BEGIN

typedef void (^WDGAppVoidBoolCallback)(BOOL success);

/**
 * Wilddog SDKs 的入口点。
 *
 * 请用以下方法初始化和配置 WDGApp
 */
@interface WDGApp : NSObject


/**
 * 用有效的 options 配置默认的 Wilddog app。默认的 app 名字是 '__WDGAPP_DEFAULT'
 * 如果配置失败，会抛出异常。这个方法能确保线程安全。
 *
 * @param options 配置 Wilddog 应用所需的 WDGOptions 实例。
 */
+ (void)configureWithOptions:(WDGOptions *)options;

/**
 * 用 options 和 name 配置一个 Wilddog app. 如果配置失败，会抛出异常。
 * 这个方法是线程安全的。
 *
 * @param name 开发者自己起名的应用名称。这个名字只能包含字母、数组和下划线。
 * @param options 配置 Wilddog 应用所需的 WDGOptions 实例。
 */
+ (void)configureWithName:(NSString *)name options:(WDGOptions *)options;

/**
 * 返回一个默认的 app。如果默认 app 不存在，则返回 nil。
 */
+ (nullable WDGApp *)defaultApp NS_SWIFT_NAME(defaultApp());

/**
 * 返回一个之前用 name 创建好的 WDGApp. 如果没有这个 app, 则返回 nil.
 * 这个方法能确保线程安全。
 */
+ (nullable WDGApp *)appNamed:(NSString *)name;

/**
 * 返回所有现存的 WDGApp 实例。如果没有 WDGApp 实例，则返回 nil.
 * 这个方法能确保线程安全。
 */
+ (nullable NSDictionary *)allApps;

/**
 * 清除当前的 WDGApp, 释放相关的数据，并回收它的名字以便将来使用。
 * 这个方法能确保线程安全。
 */
- (void)deleteApp:(WDGAppVoidBoolCallback)completion;

/**
 * WDGWilddogApp 实例不能直接初始化。 请用 |WDGApp configure|, 或者
 * |WDGApp configureWithOptions:|, 或者 |WDGApp configureWithNames:options| 初始化。
 */
- (nullable instancetype)init NS_UNAVAILABLE;

/**
 * 获取这个 app 的 name。
 */
@property(nonatomic, copy, readonly) NSString *name;

/**
 * 获取这个 app 的 options。
 */
@property(nonatomic, readonly) WDGOptions *options;

@end

NS_ASSUME_NONNULL_END

