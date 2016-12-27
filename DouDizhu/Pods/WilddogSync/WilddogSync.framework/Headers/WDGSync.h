//
//  WDGSync.h
//  WilddogSync
//
//  Created by junpengwang on 16/9/8.
//  Copyright © 2016年 wilddog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WDGSyncReference.h"

@class WDGApp;

NS_ASSUME_NONNULL_BEGIN

/**
 * 连接 Wilddog Sync 的入口点。
 * 你可以通过调用 [WDGSync sync] 获取一个实例。
 * 在 Sync 中，要在一个节点下读写数据，请用 [[WDGSync sync] reference] 获取一个路径引用。
 */
@interface WDGSync : NSObject
/**
 * 用默认的 WDGApp 获取这个 WDGSync 实例。
 *
 * @return 一个 WDGSync 实例
 */
+ (WDGSync *)sync NS_SWIFT_NAME(sync());

/**
 * 用特定的 WDGApp 获取这个 WDGSync 实例。
 *
 * @param app 用于得到 WDGSync 的 WDGApp
 * @return 一个 WDGSync 实例
 */
+ (WDGSync *)syncForApp:(WDGApp*)app NS_SWIFT_NAME(sync(app:));

/** WDGSync 拥有的 WDGApp 实例。*/
@property (weak, readonly, nonatomic) WDGApp *app;

/**
 * 得到一个 Wilddog Sync 根路径的 WDGSyncReference 引用。
 */
- (WDGSyncReference *)reference;

/**
 * 用有效的路径去获得一个 WDGSyncReference 引用。
 *
 * @param path 指向 Wilddog 数据库节点的一个路径
 * @return 指定路径节点的 WDGSyncReference 引用
 */
- (WDGSyncReference *)referenceWithPath:(NSString *)path;

/**
 * 用这个有效的 URL 获得一个 WDGSyncReference 引用。
 * 这个 URL 必须是指向默认 Wilddog Sync 数据库完整路径（如'https://docs-examples.wilddogio.com/web/saving-data/wildblog/posts'）。
 * 若要创建一个指向不同 Sync 数据库的 WDGSyncReference, 可以先用配置好 URL 的 WDGOptions 对象去创建一个WDGApp
 *
 * @param url 指向 sync 数据库某一数据节点的一个 URL
 * @return 用一个有效的 URL 生成的 WDGSyncReference 引用
 */
- (WDGSyncReference *)referenceFromURL:(NSString *)syncUrl;

/**
 * 断开与 Wilddog Sync 后台服务器的连接，可以用 `goOnline` 恢复连接。
 */
- (void)goOffline;

/**
 * 恢复与 Wilddog Sync 后台服务器的连接，可以用 `goOffline` 断开连接。
 */
- (void)goOnline;

/**
 * 默认情况下，在你的应用程序正在运行时，Wilddog 客户端会将数据保存在内存中，当应用被重新启动时数据就没有了。
 * 把这个值设置为 YES 时，数据将被保存到设备，并且当应用程序重新启动时（即使在重新启动程序时没有网络连接），
 * 这些存储的数据也是可以用的。请注意，此属性必须在创建第一个 Sync 引用之前设置，
 * 并且每次启用应用程序只需要调用一次即可。
 *
 */
@property (nonatomic) BOOL persistenceEnabled;

/**
 * 设置所有被触发事件的队列。默认队列为主队列。
 *
 * 请注意，这个必须在创建第一个 Sync 引用之前设置
 */
@property (nonatomic, strong) dispatch_queue_t callbackQueue;

/**
 * 打印程序相关信息。
 * @param enabled 设为 YES 为打印。默认为 NO，不打印
 */
+ (void)setLoggingEnabled:(BOOL)enabled;

/** 获取 Wilddog Sync SDK 版本号。 */
+ (NSString *)sdkVersion;

@end

NS_ASSUME_NONNULL_END