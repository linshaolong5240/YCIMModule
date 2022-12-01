//
//  YIMContactController.h
//  YCIMModule_Example
//
//  Created by Sauron on 2022/11/24.
//  Copyright © 2022 YRYC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TUIContactViewDataProvider.h"

NS_ASSUME_NONNULL_BEGIN

@protocol YIMContactControllerListener <NSObject>
@optional
- (void)onSelectFriend:(TUICommonContactCell *)cell;
- (void)onAddNewFriend:(TUICommonTableViewCell *)cell;
- (void)onGroupConversation:(TUICommonTableViewCell *)cell;
- (void)onShareLocation:(TUICommonTableViewCell *)cell;
- (void)onTemporaryConversation:(TUICommonTableViewCell *)cell;
@end


@interface YIMContactController : UIViewController

@property (nonatomic, strong) TUIContactViewDataProvider *viewModel;
@property (nonatomic, weak) id<YIMContactControllerListener> delegate;
@property UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
