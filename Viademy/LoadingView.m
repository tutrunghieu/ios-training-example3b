//
//  LoadingView.m
//  Viademy
//
//  Created by Pham Dinh Thang on 6/3/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import "LoadingView.h"
#import "AppConfig.h"
@interface LoadingView()
@property (nonatomic, strong) UIView* loadingView;
@property (nonatomic, strong) UIActivityIndicatorView* spinning;
@property (nonatomic, strong) NSDictionary* viewDic;
@end
@implementation LoadingView
+ (instancetype)sharedLoadingView {
    static LoadingView *sharedLoadingView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedLoadingView = [self new];
    });
    return sharedLoadingView;
}
- (id)init {
    if (self = [super init]) {
        self.loadingView = [[UIView alloc]init];
        self.spinning = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        self.viewDic = @{@"loadingView":self.loadingView,@"spinning":self.spinning};
        self.loadingViewIsCurrentlyShowed = NO;
        
        //Config the loadingView
        self.loadingView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.loadingView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[loadingView(80)]" options:0 metrics:nil views:self.viewDic]];
        [self.loadingView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[loadingView(80)]" options:0 metrics:nil views:self.viewDic]];
        [self.loadingView setBackgroundColor:LOADINGVIEW_COLOR];
        self.loadingView.layer.cornerRadius = 10;
        self.loadingView.layer.masksToBounds = YES;
        
        [self.loadingView addSubview:self.spinning];
        self.spinning.translatesAutoresizingMaskIntoConstraints = NO;
        [self.spinning addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[spinning(40)]" options:0 metrics:nil views:self.viewDic]];
        [self.spinning addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[spinning(40)]" options:0 metrics:nil views:self.viewDic]];
        [self.loadingView addConstraint:[NSLayoutConstraint constraintWithItem:self.spinning attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.spinning.superview attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
        [self.loadingView addConstraint:[NSLayoutConstraint constraintWithItem:self.spinning attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.spinning.superview attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f]];
        
        [self.spinning startAnimating];
        
        //Adding the loadingLabel if needed
        //        UILabel* loadingLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, 120, 50)];
        //        loadingLabel.textAlignment = NSTextAlignmentCenter;
        //        loadingLabel.text = @"...loading";
        //        [loadingLabel setFont:[UIFont fontWithName:@"Helvetica-Light" size:20.0f]];;
        //        [loadingLabel setTextColor:[UIColor blackColor]];
    }
    return self;
}
- (void)addLoadingViewToView:(UIView*)view {
    [view addSubview:self.loadingView];
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self.loadingView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.loadingView.superview attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self.loadingView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.loadingView.superview attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f]];
    self.loadingViewIsCurrentlyShowed = YES;
}
- (void)removeLoadingView {
    if (self.loadingViewIsCurrentlyShowed == YES) {
        [self.loadingView removeFromSuperview];
        self.loadingViewIsCurrentlyShowed = NO;
    } else {
        //
    }
}
- (void)checkCurrentLoadingViewState {
    if (self.loadingViewIsCurrentlyShowed == YES) {
        NSLog(@"CME Loading view is currently showed");
    } else {
        NSLog(@"CME Loading view is not showed");
    }
}@end
