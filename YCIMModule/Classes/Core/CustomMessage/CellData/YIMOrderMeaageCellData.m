//
//  YIMOrderMeaageCellData.m
//  YCIMModule_Example
//
//  Created by Sauron on 2022/11/30.
//  Copyright © 2022 YRYC. All rights reserved.
//

#import "YIMOrderMeaageCellData.h"

@implementation YIMOrderMeaageCellData

+ (TUIMessageCellData *)getCellData:(V2TIMMessage *)message{
    NSDictionary *param = [NSJSONSerialization JSONObjectWithData:message.customElem.data options:NSJSONReadingAllowFragments error:nil];
    YIMOrderMeaageCellData *cellData = [[YIMOrderMeaageCellData alloc] initWithDirection:message.isSelf ? MsgDirectionOutgoing : MsgDirectionIncoming];
    cellData.msgID = message.msgID;
    cellData.productImageURLString = param[@"productImageURLString"];
    cellData.productName = param[@"productName"];
    cellData.avatarUrl = [NSURL URLWithString:message.faceURL];
    return cellData;
}

+ (NSString *)getDisplayString:(V2TIMMessage *)message {
    NSDictionary *param = [NSJSONSerialization JSONObjectWithData:message.customElem.data options:NSJSONReadingAllowFragments error:nil];
    return param[@"productName"];
}

- (CGSize)contentSize {
    CGFloat spacing = 10.0f;
    CGFloat imageHeight = 50.0f;

    CGFloat textMaxWidth = 265.f;
    CGRect rect = [self.productName boundingRectWithSize:CGSizeMake(textMaxWidth, MAXFLOAT)
                                          options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                       attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:15] }
                                          context:nil];
    CGSize size = CGSizeMake(textMaxWidth + 15, ceil(rect.size.height) + spacing + imageHeight);
    return size;
}

@end
