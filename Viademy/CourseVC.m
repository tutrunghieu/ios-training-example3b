//
//  CourseVC.m
//  Viademy
//
//  Created by hilbert tu on 6/2/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import "CourseVC.h"
#import "CourseHeaderCell.h"
#include "LessonCell.h"
#include "CourseVCData.h"
#import "LessonVC.h"
@interface CourseVC () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *btnBack;
@property (strong,nonatomic) NSArray* tableViewData;
@property (strong,nonatomic) CourseVCData* dataSource;

@end

@implementation CourseVC
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
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)onClose:(UIButton *)sender {
    self.btnBack.selected = NO;
    sender.selected = YES;
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)configTableView {
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.tableView registerNib:[UINib nibWithNibName:@"CourseHeaderCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CourseHeaderCellID"];
    [self.tableView registerNib:[UINib nibWithNibName:@"LessonCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"LessonCellID"];
}
- (void)configData {
    [NetworkAccess getJSONDataFromURL:self.sourceUrl completion:^(NSDictionary *dictionaryData) {
        self.dataSource = [DataAccessVinh getDataCourse:dictionaryData];
        [self configTableView];
        [self.tableView reloadData];
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
    if (indexPath.row == 0) {
        cellID = @"CourseHeaderCellID";
        CourseHeaderCell* cell = (CourseHeaderCell*)[tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[CourseHeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        CourseHeaderData *dataSourceH = [self.dataSource.tableViewData objectAtIndex:indexPath.row];
        [cell configCellUI:dataSourceH];
        return cell;
    } else {
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
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 80.0f;
    }
    return 100.0f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LessonCellData *cellData = [self.dataSource.tableViewData objectAtIndex:indexPath.row];
    LessonVC* lessonVC = [[LessonVC alloc] initWithSourceUrl:cellData.lessonActionUrl];
    lessonVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:lessonVC animated:YES completion:^{}];
}

@end
