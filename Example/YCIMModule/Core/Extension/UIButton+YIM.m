//
//  UIButton+YIM.m
//  YCIMModule
//
//  Created by Sauron on 2022/11/21.
//  Copyright © 2022 sauronpi. All rights reserved.
//

#import "UIButton+YIM.h"

@implementation UIButton (YIM)

- (void)yim_alignVerticalImageTextWithSpacing:(CGFloat)spacing {
    if (!self.imageView) {
        return;
    }
    if (!self.titleLabel) {
        return;
    }
    if (!self.titleLabel.text) {
        return;
    }
    CGSize titleSize;
    NSDictionary *attr = @{
        NSFontAttributeName: self.titleLabel.font,
    };
    titleSize = [self.titleLabel.text sizeWithAttributes:attr];
    self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + spacing), 0, 0, -titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(spacing, -self.imageView.frame.size.width, -self.imageView.frame.size.height, 0);
}

- (void)yim_alignVerticalImageText {
    [self yim_alignVerticalImageTextWithSpacing:6];
}

@end
