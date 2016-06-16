//
//  AlertLoadingView.m
//  Viademy
//
//  Created by Pham Dinh Thang on 6/3/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import "AlertLoadingView.h"
@interface AlertLoadingView()
@property (nonatomic,strong) UIAlertController* alert;
@property (nonatomic,strong) UIWindow* alertWindow;
@end
@implementation AlertLoadingView
+ (instancetype)sharedAlertLoadingView {
    static AlertLoadingView *sharedAlertLoadingView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedAlertLoadingView = [self new];
    });
    return sharedAlertLoadingView;
}
- (void)showLoadingWithTitle:(NSString*)title {
    self.alert = [UIAlertController alertControllerWithTitle:nil
                                                     message:title
                                              preferredStyle:UIAlertControllerStyleAlert];
    UIActivityIndicatorView* indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator.color = [UIColor blackColor];
    indicator.translatesAutoresizingMaskIntoConstraints=NO;
    [self.alert.view addSubview:indicator];
    NSDictionary * views = @{@"alert" : self.alert.view, @"indicator" : indicator};
    
    NSArray * constraintsVertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(60)-[indicator]-(20)-|" options:0 metrics:nil views:views];
    NSArray * constraintsHorizontal = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[indicator]|" options:0 metrics:nil views:views];
    NSArray * constraints = [constraintsVertical arrayByAddingObjectsFromArray:constraintsHorizontal];
    [self.alert.view addConstraints:constraints];
    [indicator setUserInteractionEnabled:NO];
    [indicator startAnimating];
    
    self.alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.alertWindow.rootViewController = [[UIViewController alloc] init];
    
    // we inherit the main window's tintColor
    self.alertWindow.tintColor = [UIApplication sharedApplication].delegate.window.tintColor;
    // window level is above the top window (this makes the alert, if it's a sheet, show over the keyboard)
    UIWindow *topWindow = [UIApplication sharedApplication].windows.lastObject;
    self.alertWindow.windowLevel = topWindow.windowLevel + 1;
    
    [self.alertWindow makeKeyAndVisible];
    [self.alertWindow.rootViewController presentViewController:self.alert animated:YES completion:nil];
}
- (void)dismissLoadingView {
    [self.alert dismissViewControllerAnimated:YES completion:^{}];
    self.alert = nil;
    self.alertWindow.hidden = YES;
    self.alertWindow = nil;
}
@end
