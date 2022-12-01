//
//  YCTemporaryConversationViewController.m
//  YCIMModule_Example
//
//  Created by Sauron on 2022/11/28.
//  Copyright © 2022 YRYC. All rights reserved.
//

#import "YCTemporaryConversationViewController.h"
#import "TUICommonModel.h"
#import "TUIThemeManager.h"

@interface YCTemporaryConversationViewController ()

@property (nonatomic, strong) TUINaviBarIndicatorView *titleView;

@end

@implementation YCTemporaryConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = TUICoreDynamicColor(@"controller_bg_color", @"#FFFFFF");
    self.navigationItem.titleView = self.titleView;
    self.navigationItem.title = @"";
}

#pragma mark - Getter / Setter

- (TUINaviBarIndicatorView *)titleView {
    if (!_titleView) {
        _titleView = [[TUINaviBarIndicatorView alloc] init];
        [_titleView setTitle:@"临时会话车友"];
    }
    return _titleView;
}

@end
