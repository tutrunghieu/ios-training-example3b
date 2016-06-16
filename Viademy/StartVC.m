//
//  StartVC.m
//  Viademy
//
//  Created by hilbert tu on 6/2/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import "StartVC.h"
#import "MainTabVC.h"
#import "LoadingView.h"
@interface StartVC ()

@end

@implementation StartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[LoadingView sharedLoadingView] addLoadingViewToView:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[LoadingView sharedLoadingView] removeLoadingView];
        [self startViademy];
    });
}
- (void)startViademy {
    MainTabVC* mainTabVC = [[MainTabVC alloc] init];
    mainTabVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:mainTabVC animated:YES completion:^{}];
}

@end
