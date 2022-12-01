//
//  TUIChatDataProvider+YIM.m
//  YCIMModule_Example
//
//  Created by Sauron on 2022/11/29.
//  Copyright © 2022 YRYC. All rights reserved.
//

#import "TUIChatDataProvider+YIM.h"
#import "YIMCustomMessage.h"

#define Input_SendBtn_Key @"Input_SendBtn_Key"
#define Input_SendBtn_Title @"Input_SendBtn_Title"
#define Input_SendBtn_ImageName @"Input_SendBtn_ImageName"


static NSArray *customInputBtnInfo = nil;

@implementation TUIChatDataProvider (YIM)

+ (NSArray *)customInputBtnInfo
{
//    if (customInputBtnInfo == nil) {
//        customInputBtnInfo = @[@{Input_SendBtn_Key : TUIInputMoreCellKey_Link,
//                                 Input_SendBtn_Title :  TUIKitLocalizableString(TUIKitMoreLink),
//                                 Input_SendBtn_ImageName : @"chat_more_link_img"
//                                }
//        ];
//    }
//    return customInputBtnInfo;
    if (customInputBtnInfo == nil) {
        customInputBtnInfo = @[
            @{Input_SendBtn_Key : TUIInputMoreCellKey_Link,
              Input_SendBtn_Title :  TUIKitLocalizableString(TUIKitMoreLink),
              Input_SendBtn_ImageName : @"chat_more_link_img"
            },
            @{Input_SendBtn_Key: YIMInputMoreCellKeyOrder,
              Input_SendBtn_Title: @"订单",
              Input_SendBtn_ImageName: @"chat_more_order_img"
            }
        ];
    }
    return customInputBtnInfo;
}

@end
