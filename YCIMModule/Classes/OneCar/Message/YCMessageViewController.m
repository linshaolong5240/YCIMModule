//
//  YCMessageViewController.m
//  YCIMModule
//
//  Created by Sauron on 2022/11/18.
//  Copyright © 2022 sauronpi. All rights reserved.
//

#import "YCMessageViewController.h"
#import "TUIConversation.h"
#import "TUIChat.h"
#import "TUIGroupChatViewController.h"

#import "YIMC2CChatViewController.h"
#import "YIMConversationFoldListViewController.h"
#import "YIMConversationListController.h"
#import "YCServiceNotifacationViewController.h"
#import "YIMImage.h"

@interface YCMessageViewController () <YIMConversationListControllerCustomDelegate , YIMConversationListControllerListener>

@property(nonatomic, strong) NSMutableArray *firstGroupCellDatas;

@end

@implementation YCMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.firstGroupCellDatas = [NSMutableArray array];
    TUIConversationCellData *data1 = [[TUIConversationCellData alloc] init];
    data1.title = @"服务提醒";
    data1.subTitle = [[NSMutableAttributedString alloc] initWithString:@"新版本发布2021-01-05"];
    data1.avatarImage = [YIMImage imageNamed:@"avatar_serviece_notification"];
    data1.unreadCount = 1;
    data1.time = [NSDate date];
    
    TUIConversationCellData *data2 = [[TUIConversationCellData alloc] init];
    data2.title = @"已服务商家";
    data2.subTitle = [[NSMutableAttributedString alloc] initWithString:@"已服务过的商家"];
    data2.avatarImage = [YIMImage imageNamed:@"avatar_service_store"];
    data2.unreadCount = 2;
    data2.time = [NSDate date];

    [self.firstGroupCellDatas addObject: data1];
    [self.firstGroupCellDatas addObject: data2];

    YIMConversationListController *conversationController = [[YIMConversationListController alloc] init];
    conversationController.isEnableSearch = NO;
    conversationController.delegate = self;
    conversationController.customDataSource = self;
    
    [self addChildViewController:conversationController];
    [self.view addSubview:conversationController.view];
}

- (TUIBaseChatViewController *)getChatViewController:(TUIChatConversationModel *)model {
    TUIBaseChatViewController *chat = nil;
    if (model.userID.length > 0) {
        chat = [[YIMC2CChatViewController alloc] init];
    } else if (model.groupID.length > 0) {
        chat = [[TUIGroupChatViewController alloc] init];
    }
    chat.conversationData = model;
    return chat;
}

- (TUIChatConversationModel *)getConversationModel:(TUIConversationCellData *)data {
    TUIChatConversationModel *model = [[TUIChatConversationModel alloc] init];
    model.conversationID = data.conversationID;
    model.userID = data.userID;
    model.groupType = data.groupType;
    model.groupID = data.groupID;
    model.userID = data.userID;
    model.title = data.title;
    model.faceUrl = data.faceUrl;
    model.avatarImage = data.avatarImage;
    model.draftText = data.draftText;
    model.atMsgSeqs = data.atMsgSeqs;
    return model;
}

#pragma mark - YIMConversationListControllerCustomDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInCustomSection:(NSInteger)section {
    return self.firstGroupCellDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForCustomAtIndexPath:(NSIndexPath *)indexPath {
    TUIConversationCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TUIConversationCell class]) forIndexPath:indexPath];
    [cell fillWithData:self.firstGroupCellDatas[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectCustomAtIndexPath:(NSIndexPath *)indexPath {
#if DEBUG
    NSLog(@"%s", __PRETTY_FUNCTION__);
#endif
    TUIBaseChatViewController *vc = [YCServiceNotifacationViewController new];
    vc.conversationData = [self getConversationModel:self.firstGroupCellDatas[indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - TUIConversationListControllerListener

/**
 *  在会话列表中，获取会话展示信息时候回调。
 *  In the conversation list, the callback to get the session display information.
 */
//- (NSString *)getConversationDisplayString:(V2TIMConversation *)conversation {
//    return @"test";
//}

/**
 *  在会话列表中，点击了具体某一会话后的回调。
 *  您可以通过该回调响应用户的点击操作，跳转到该会话对应的聊天界面。
 *
 *  @param conversationController 委托者，当前所在的消息列表。
 *  @param conversation 被选中的会话单元
 *
 *  The callback for clicking the conversation in the conversation list
 *  You can use this callback to respond to the user's click operation and jump to the chat interface corresponding to the session.
 */
- (void)conversationListController:(TUIConversationListController *)conversationController didSelectConversation:(TUIConversationCellData *)conversation {
    if (conversation.isLocalConversationFoldList) {

        [TUIConversationListDataProvider cacheConversationFoldListSettings_FoldItemIsUnread:NO];
        
        YIMConversationFoldListViewController *foldVC = [[YIMConversationFoldListViewController alloc] init];
        [self.navigationController pushViewController:foldVC animated:YES];

        foldVC.dismissCallback = ^(NSMutableAttributedString * _Nonnull foldStr, NSArray * _Nonnull sortArr , NSArray * _Nonnull needRemoveFromCacheMapArray) {
            conversation.foldSubTitle  = foldStr;
            conversation.subTitle = conversation.foldSubTitle;
            conversation.isMarkAsUnread = NO;
        
            if (sortArr.count <= 0 ) {
                conversation.orderKey = 0;
                if ([conversationController.provider.conversationList  containsObject:conversation]) {
                    [conversationController.provider hideConversation:conversation];
                }
            }
            
            for (NSString * removeId in needRemoveFromCacheMapArray) {
                if ([conversationController.provider.markFoldMap objectForKey:removeId] ) {
                    [conversationController.provider.markFoldMap removeObjectForKey:removeId];
                }
            }
            
            [TUIConversationListDataProvider cacheConversationFoldListSettings_FoldItemIsUnread:NO];
            [[(TUIConversationListController *)conversationController tableView] reloadData];
        };
        return;
    }
    TUIBaseChatViewController *chatVc = [self getChatViewController:[self getConversationModel:conversation]];
    [self.navigationController pushViewController:chatVc animated:YES];
}

@end
