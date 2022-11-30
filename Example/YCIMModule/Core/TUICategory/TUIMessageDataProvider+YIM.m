//
//  TUIMessageDataProvider+YIM.m
//  YCIMModule_Example
//
//  Created by Sauron on 2022/11/30.
//  Copyright © 2022 YRYC. All rights reserved.
//

#import "TUIMessageDataProvider+YIM.h"
#import "YIMCustomMessage.h"

static NSArray *customMessageInfo = nil;

@implementation TUIMessageDataProvider (YIM)

+ (void)load {
    customMessageInfo = @[
        @{BussinessID : BussinessID_TextLink,
          TMessageCell_Name : @"TUILinkCell",
          TMessageCell_Data_Name : @"TUILinkCellData"
        },
        @{BussinessID : BussinessID_GroupCreate,
          TMessageCell_Name : @"TUIGroupCreatedCell",
          TMessageCell_Data_Name : @"TUIGroupCreatedCellData"
        },
        @{BussinessID : BussinessID_Evaluation,
          TMessageCell_Name : @"TUIEvaluationCell",
          TMessageCell_Data_Name : @"TUIEvaluationCellData"
        },
        @{BussinessID : BussinessID_Order,
          TMessageCell_Name : @"TUIOrderCell",
          TMessageCell_Data_Name : @"TUIOrderCellData"
        },
        @{BussinessID : BussinessID_Typing,
          TMessageCell_Name : @"TUIMessageCell",
          TMessageCell_Data_Name : @"TUITypingStatusCellData"
        },
        //Custom Message
        @{BussinessID : YIMMessageBussinessIDOrder,
          TMessageCell_Name : @"YIMOrderMessageCell",
          TMessageCell_Data_Name : @"YIMOrderMeaageCellData"
        },
    ];
}

+ (NSArray *)getCustomMessageInfo {
    return customMessageInfo;
}

+ (TUIMessageCellData *)getNativeCustomCellData:(V2TIMMessage *)message {
    NSError *error;
    NSDictionary *param = [NSJSONSerialization JSONObjectWithData:message.customElem.data options:NSJSONReadingAllowFragments error:&error];
    if (error) {
        NSLog(@"parse customElem data error: %@", error);
        return nil;
    }
    if (!param || ![param isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    NSString *businessID = param[BussinessID];
    if (!businessID || ![businessID isKindOfClass:[NSString class]]) {
        return nil;
    }
    for (NSDictionary *messageInfo in customMessageInfo) {
        if ([businessID isEqualToString:messageInfo[BussinessID]]) {
            NSString *cellDataName = messageInfo[TMessageCell_Data_Name];
            Class cls = NSClassFromString(cellDataName);
            if (cls && [cls respondsToSelector:@selector(getCellData:)]) {
                TUIMessageCellData *data = [cls getCellData:message];
                data.reuseId = businessID;
                return data;
            }
        }
    }
    return nil;
}

@end
