//
//  YIMPopMenuView.m
//  YCIMModule
//
//  Created by Sauron on 2022/11/22.
//  Copyright © 2022 sauronpi. All rights reserved.
//

#import "YIMPopMenuView.h"
#import "TIMPopCell.h"
#import <TUIThemeManager.h>
#import <UIColor+TUIHexColor.h>

@interface YIMPopMenuView ()<UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation YIMPopMenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setupViews];
    }
    return self;
}

- (void)setData:(NSMutableArray *)data
{
    _data = data;
    [_tableView reloadData];
}

- (void)showInWindow:(UIWindow *)window
{
    [window addSubview:self];
    __weak typeof(self) ws = self;
    self.alpha = 0;
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        ws.alpha = 1;
    } completion:nil];
}

- (void)setupViews
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    [self addGestureRecognizer:pan];
    
    self.backgroundColor = [UIColor clearColor];
    CGSize arrowSize = CGSizeMake(0, 0);//TPopView_Arrow_Size;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + arrowSize.height, self.frame.size.width, self.frame.size.height - arrowSize.height)];
    self.frame = [UIScreen mainScreen].bounds;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = TUIDemoDynamicColor(@"pop_bg_color", @"#333333");
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.scrollEnabled = NO;
    _tableView.layer.cornerRadius = 5.0;
    [self addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [TIMPopCell getHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TIMPopCell *cell = [tableView dequeueReusableCellWithIdentifier:TPopCell_ReuseId];
    if(!cell){
        cell = [[TIMPopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TPopCell_ReuseId];
    }
    [cell setData:_data[indexPath.row]];
    if(indexPath.row == _data.count - 1){
        cell.separatorInset = UIEdgeInsetsMake(0, self.bounds.size.width, 0, 0);
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if(_delegate && [_delegate respondsToSelector:@selector(popView:didSelectRowAtIndex:)]){
        [_delegate popView:self didSelectRowAtIndex:indexPath.row];
    }
    [self hide];
}

- (void)drawRect:(CGRect)rect {
    [[UIColor whiteColor] set];

    CGSize arrowSize = TPopView_Arrow_Size;
    UIBezierPath *arrowPath = [[UIBezierPath alloc] init];
    [arrowPath moveToPoint:_arrowPoint];
    [arrowPath addLineToPoint:CGPointMake(_arrowPoint.x + arrowSize.width * 0.5, _arrowPoint.y + arrowSize.height)];
    [arrowPath addLineToPoint:CGPointMake(_arrowPoint.x - arrowSize.width * 0.5, _arrowPoint.y + arrowSize.height)];
    [arrowPath closePath];
    [arrowPath fill];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]){
        return NO;
     }
    return YES;
}

- (void)onTap:(UIGestureRecognizer *)recognizer
{
    [self hide];
}

- (void)hide
{
    __weak typeof(self) ws = self;
    self.alpha = 1;
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        ws.alpha = 0;
    } completion:^(BOOL finished) {
        if([ws superview]){
            [ws removeFromSuperview];
        }
    }];
}
@end
