//
//  YIMManager.h
//  YCIMModule
//
//  Created by Saruon on 2022/11/18.
//  Copyright © 2022 sauronpi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ImSDK_Plus/ImSDK_Plus.h>

@class YIMManager;

NS_ASSUME_NONNULL_BEGIN

NSString *NSStringFromV2TIMLoginStatus(V2TIMLoginStatus status);

@protocol YIMManagerListenr <NSObject>

@optional

- (void)timOnConnecting;
- (void)timOnConnectSuccess;
- (void)timOnConnectFailed:(int)code error:(NSString*)error;
- (void)timOnKickedOffline;
- (void)timOnUserSigExpired;
- (void)timOnSelfInfoUpdated:(V2TIMUserFullInfo *)Info;

- (void)timManager:(YIMManager *)manager didLoginWithUserId:(NSString *)userId;
- (void)timManager:(YIMManager *)manager didLoginFailedWithCode:(int)code description:(NSString *)description;
- (void)timManager:(YIMManager *)manager didLogoutWithUserId:(NSString *)userId;
- (void)timManager:(YIMManager *)manager didLogoutFailedWithCode:(int)code description:(NSString *)description;

@end

@interface YIMManager : NSObject

@property(nonatomic, assign) BOOL directlyLoginEnabled;

@property(nullable ,nonatomic, readonly, copy) NSString *loginUserID;

+ (instancetype)sharedInstance;

- (void)initSDKWithAppId:(int)AppId;
- (void)initSDKWithAppId:(int)AppId config:(V2TIMSDKConfig *)config;
- (void)addListener:(id <YIMManagerListenr>)listener;
- (void)removeListener:(id <YIMManagerListenr>)listener;
- (V2TIMLoginStatus)getLoginStatus;
- (void)loginWithUserId:(NSString *)userId userSig:(NSString *)userSig;
- (void)tryAutoLogin;

@end

NS_ASSUME_NONNULL_END
