//
//  TIMPopCell.h
//  YCIMModule
//
//  Created by Sauron on 2022/11/22.
//  Copyright © 2022 sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TIMPopMenuCellData : NSObject
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *title;
@end

@interface TIMPopCell : UITableViewCell
@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UILabel *title;
+ (CGFloat)getHeight;
- (void)setData:(TIMPopMenuCellData *)data;
@end
