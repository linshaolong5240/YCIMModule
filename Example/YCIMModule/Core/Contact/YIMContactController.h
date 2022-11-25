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

@protocol YIMContactFirstGroupDelegate <NSObject>

@required

- (NSInteger)numberOfRowsInFirstGroup;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForFirstGroupAtIndexPath:(NSIndexPath *)indexPath;

@optional




@end

@protocol YIMContactControllerListener <NSObject>
@optional
- (void)onSelectFriend:(TUICommonContactCell *)cell;
- (void)onAddNewFriend:(TUICommonTableViewCell *)cell;
- (void)onGroupConversation:(TUICommonTableViewCell *)cell;
@end


@interface YIMContactController : UIViewController

@property (nonatomic, strong) TUIContactViewDataProvider *viewModel;
@property (nonatomic, weak) id<YIMContactControllerListener> delegate;
@property UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
