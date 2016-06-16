//
//  LessonVC.m
//  Viademy
//
//  Created by VinhHV on 6/7/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import "LessonVC.h"
#import "YTPlayerView.h"

#import "CourseVC.h"
#import "CourseHeaderCell.h"
#include "LessonCell.h"
#include "CourseVCData.h"

@interface LessonVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btnBack;
@property (weak, nonatomic) IBOutlet UIButton *btnShared;
@property (weak, nonatomic) IBOutlet UIButton *btnLiked;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet YTPlayerView *viewLesson;
@property (strong,nonatomic) NSArray* tableViewData;
@property (strong,nonatomic) LessonVCData* dataSource;
@end

@implementation LessonVC

-(id)initWithSourceUrl:(NSString*)sourceUrl {
    self = [super init];
    if (self) {
        self.sourceUrl = sourceUrl;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onBack:(UIButton *)sender {
    self.btnBack.selected = NO;
    sender.selected = YES;
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)configTableView {
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.tableView registerNib:[UINib nibWithNibName:@"LessonCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"LessonCellID"];
}
- (void)configData {
    [NetworkAccess getJSONDataFromURL:self.sourceUrl completion:^(NSDictionary *dictionaryData) {
        self.dataSource = [DataAccessVinh getDataLesson:dictionaryData];
        [self configTableView];
        [self.tableView reloadData];
        [self.viewLesson loadWithVideoId:self.dataSource.lessonYoutubeKey];
    } error:^(NSError *error) {
        NSLog(@"Error log = %@",error.description);
    }];
}

- (void)configUI {
    [self configTableView];
}

#pragma mark - UITableView delegate and datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource.tableViewData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellID;
    
    cellID  = @"LessonCellID";
    LessonCell* cell = (LessonCell*)[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[LessonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    LessonCellData *dataSource = [self.dataSource.tableViewData objectAtIndex:indexPath.row];
    [cell configCellUI:dataSource];
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    LessonCellData *cellData = [self.dataSource.tableViewData objectAtIndex:indexPath.row];
    //    LessonVC* lessonVC = [[LessonVC alloc] initWithSourceUrl:cellData.lessonTitle];
    //    lessonVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    //    [self presentViewController:lessonVC animated:YES completion:^{}];
    
}
@end
