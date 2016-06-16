//
//  MainTabVC.m
//  Viademy
//
//  Created by hilbert tu on 6/2/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import "MainTabVC.h"
#import "HomeVC.h"
#import "CategoryVC.h"
#import "SearchVC.h"
@interface MainTabVC ()
@property (weak, nonatomic) IBOutlet UIView *tabBarContentView;
@property (weak, nonatomic) IBOutlet UIButton *homeBtn;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property (nonatomic, strong) NSArray* arrayContentViews;
@property (weak, nonatomic) IBOutlet UIButton *categoryBtn;
@end

@implementation MainTabVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    HomeVC *homeVC = [[HomeVC alloc] init];
    CategoryVC *categoryVC = [[CategoryVC alloc] init];
     self.arrayContentViews = @[homeVC,categoryVC];
  //  [self tabSelected:self.homeBtn];
    [self showHomeView:self.homeBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showHomeView:(UIButton *)sender {
    self.homeBtn.selected = NO;
    self.searchBtn.selected = NO;
    self.categoryBtn.selected = NO;
    sender.selected = YES;
    [self tabSelected:sender];
    
    
}
- (IBAction)showSearchView:(UIButton *)sender {
    SearchVC* searchVC = [[SearchVC alloc] init];
    searchVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:searchVC animated:YES completion:^{}];
}

- (IBAction)showCategoryView:(UIButton *)sender {
    self.homeBtn.selected = NO;
    self.searchBtn.selected = NO;
    self.categoryBtn.selected = NO;
    sender.selected = YES;
    [self tabSelected:sender];
}
- (IBAction)showYoutube:(UIButton *)sender {
    sender.selected = YES;
    [self tabSelected:sender];
}
- (void) tabSelected:(UIButton*)btnTab {
    UIViewController *vc = [self.arrayContentViews objectAtIndex:btnTab.tag];
    if (vc.isViewLoaded && vc.view.window) {
        //is visible
    }
    else {
        [self addContentVew:vc];
    }
}
- (void) addContentVew:(UIViewController*) viewController {
    //Copy...
    for (UIViewController *subView in self.childViewControllers) {
        [subView willMoveToParentViewController:nil];
        [subView.view removeFromSuperview];
        [subView removeFromParentViewController];
    }
    [self addChildViewController:viewController];
    [viewController didMoveToParentViewController:self];
    viewController.view.frame = self.tabBarContentView.bounds;
    [self.tabBarContentView addSubview:viewController.view];
}
@end
