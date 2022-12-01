//
//  YIMManager+Theme.m
//  YCIMModule
//
//  Created by Sauron on 2022/12/1.
//

#import "YIMManager+Theme.h"
#import "TUIThemeManager.h"

@implementation YIMManager (Theme)

- (void)applyTheme {
    NSString *bundlePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"YCIMModule" ofType:@"bundle"];
    NSBundle *resourceBundle = [NSBundle bundleWithPath:bundlePath];
    NSString *themeID = @"onecar";
    
    TUIRegisterThemeResourcePath([resourceBundle pathForResource:@"TUICoreCustomTheme" ofType:@"bundle"], TUIThemeModuleCore);
    [TUIThemeManager.shareManager applyTheme:themeID forModule:TUIThemeModuleCore];
    
    TUIRegisterThemeResourcePath([resourceBundle pathForResource:@"TUIConversationCustomTheme" ofType:@"bundle"], TUIThemeModuleConversation);
    [TUIThemeManager.shareManager applyTheme:themeID forModule:TUIThemeModuleConversation];

    TUIRegisterThemeResourcePath([resourceBundle pathForResource:@"TUIChatCustomTheme" ofType:@"bundle"], TUIThemeModuleChat);
    [TUIThemeManager.shareManager applyTheme:themeID forModule:TUIThemeModuleChat];
    
    TUIRegisterThemeResourcePath([resourceBundle pathForResource:@"TUIContactCustomTheme" ofType:@"bundle"], TUIThemeModuleContact);
    [TUIThemeManager.shareManager applyTheme:themeID forModule:TUIThemeModuleContact];
}

@end
