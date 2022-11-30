//
//  YIMOrderMessageCell.h
//  YCIMModule_Example
//
//  Created by Sauron on 2022/11/30.
//  Copyright © 2022 YRYC. All rights reserved.
//

#import <TUIBubbleMessageCell.h>
#import "YIMOrderMeaageCellData.h"

NS_ASSUME_NONNULL_BEGIN

@interface YIMOrderMessageCell : TUIBubbleMessageCell

@property (nonatomic, strong) YIMOrderMeaageCellData *customData;
@property(nonatomic, strong) UIImageView *productImageView;
@property(nonatomic, strong) UILabel *productNameLabel;

- (void)fillWithData:(YIMOrderMeaageCellData *)data;

@end

NS_ASSUME_NONNULL_END
