//
//  UIButton+YIM.h
//  YCIMModule
//
//  Created by Sauron on 2022/11/21.
//  Copyright © 2022 sauronpi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (YIM)

- (void)yim_alignVerticalImageTextWithSpacing:(CGFloat)spacing;
- (void)yim_alignVerticalImageText;

@end

NS_ASSUME_NONNULL_END
