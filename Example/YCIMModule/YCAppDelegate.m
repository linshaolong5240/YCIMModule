//
//  YCAppDelegate.m
//  YCIMModule
//
//  Created by Sauron on 11/23/2022.
//  Copyright (c) 2022 YRYC. All rights reserved.
//

#import "YCAppDelegate.h"
#import <UserNotifications/UserNotifications.h>
#import "YIMManager.h"
#import "YCLoginViewController.h"
#import <TUIDefine.h>
#import <TUIThemeManager.h>
#import <TUIOfflinePushManager+Advance.h>

#import "YCTabbarController.h"

@interface YCAppDelegate () <YIMManagerListenr>

@end

@implementation YCAppDelegate

#if 0
// 配置开发环境证书
TUIOfflinePushCertificateIDForAPNS(36093)
#else
// 配置生产环境证书
TUIOfflinePushCertificateIDForAPNS(36102)
#endif

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 自定义修改 TUIChat 组件的主题 - 修改主题资源包中的内置主题
    // -- 1. 获取自定义后的资源包路径
    // -- 2. 给 TUIChat 组件注册自定义的主题资源包路径，用于覆盖内置的主题，note: 此时只能覆盖 TUIThemeModuleChat
//    TUIRegisterThemeResourcePath([NSBundle.mainBundle pathForResource:@"TUICoreCustomTheme.bundle" ofType:nil], TUIThemeModuleCore);
//    [TUIThemeManager.shareManager applyTheme:@"onecar" forModule:TUIThemeModuleCore];
//    
//    TUIRegisterThemeResourcePath([NSBundle.mainBundle pathForResource:@"TUIConversationCustomTheme.bundle" ofType:nil], TUIThemeModuleConversation);
//    [TUIThemeManager.shareManager applyTheme:@"onecar" forModule:TUIThemeModuleConversation];
//
//    TUIRegisterThemeResourcePath([NSBundle.mainBundle pathForResource:@"TUIChatCustomTheme.bundle" ofType:nil], TUIThemeModuleChat);
//    [TUIThemeManager.shareManager applyTheme:@"onecar" forModule:TUIThemeModuleChat];
//    
//    TUIRegisterThemeResourcePath([NSBundle.mainBundle pathForResource:@"TUIContactCustomTheme.bundle" ofType:nil], TUIThemeModuleContact);
//    [TUIThemeManager.shareManager applyTheme:@"onecar" forModule:TUIThemeModuleContact];
//
//    TUIRegisterThemeResourcePath([NSBundle.mainBundle pathForResource:@"TUIDemoTheme.bundle" ofType:nil], TUIThemeModuleDemo);
//    [TUIThemeManager.shareManager applyTheme:@"onecar" forModule:TUIThemeModuleDemo];

    [YIMManager.sharedInstance addListener:self];
    [[YIMManager sharedInstance] initSDKWithAppId:1400759961];
    [YIMManager.sharedInstance tryAutoLogin];
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    UIViewController *rootViewController = [YCTabbarController new];
    self.window.rootViewController = rootViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {}
- (void)applicationWillEnterForeground:(UIApplication *)application {}
- (void)applicationWillTerminate:(UIApplication *)application {}

#pragma mark - TIMManagerListenr

- (void)timOnConnecting { }
- (void)timOnConnectSuccess { }
- (void)timOnConnectFailed:(int)code error:(NSString*)error { }
- (void)timOnKickedOffline {
    [TUIOfflinePushManager.shareManager unregisterService];
    UIViewController *rootViewController = [[UINavigationController alloc] initWithRootViewController:[YCLoginViewController new]];
    self.window.rootViewController = rootViewController;
}
- (void)timOnUserSigExpired { }
- (void)timOnSelfInfoUpdated:(V2TIMUserFullInfo *)Info { }

- (void)timManager:(YIMManager *)manager didLoginWithUserId:(NSString *)userId {
    YCTabbarController *tabBarController = (YCTabbarController *)self.window.rootViewController;
    tabBarController.selectedViewController = tabBarController.viewControllers[1];
}

- (void)timManager:(YIMManager *)manager didLogoutWithUserId:(NSString *)userId {
    [TUIOfflinePushManager.shareManager unregisterService];
}

- (void)timManager:(YIMManager *)manager didLoginFailedWithCode:(int)code description:(NSString *)description {
}

@end
