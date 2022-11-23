//
//  YIMPopMenuView.h
//  YCIMModule
//
//  Created by Sauron on 2022/11/22.
//  Copyright © 2022 sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YIMPopMenuView;
@protocol TIMPopViewDelegate <NSObject>
- (void)popView:(YIMPopMenuView *)popView didSelectRowAtIndex:(NSInteger)index;
@end

@interface YIMPopMenuView : UIView
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) CGPoint arrowPoint;
@property (nonatomic, weak) id<TIMPopViewDelegate> delegate;
- (void)setData:(NSMutableArray *)data;
- (void)showInWindow:(UIWindow *)window;
@end
