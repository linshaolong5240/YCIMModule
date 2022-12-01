//
//  YIMOrderMeaageCellData.h
//  YCIMModule_Example
//
//  Created by Sauron on 2022/11/30.
//  Copyright © 2022 YRYC. All rights reserved.
//

#import "TUIBubbleMessageCellData.h"

NS_ASSUME_NONNULL_BEGIN

@interface YIMOrderMeaageCellData : TUIBubbleMessageCellData

@property(nonatomic, copy) NSString *productImageURLString;
@property(nonatomic, copy) NSString *productName;

@end

NS_ASSUME_NONNULL_END
