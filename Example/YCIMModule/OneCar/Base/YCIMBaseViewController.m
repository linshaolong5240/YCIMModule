//
//  YCIMBaseViewController.m
//  YCIMModule
//
//  Created by Sauron on 2022/11/18.
//  Copyright © 2022 sauronpi. All rights reserved.
//

#import "YCIMBaseViewController.h"

@interface YCIMBaseViewController ()

@end

@implementation YCIMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Public

- (void)showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *cancellAction = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertController addAction:cancellAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - JXCategoryListContentViewDelegate

- (UIView *)listView {
    return self.view;
}

@end
