//
//  HomeVC.m
//  Viademy
//
//  Created by hilbert tu on 6/2/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import "HomeVC.h"
#import "HomeTableCell.h"
#import "CourseVC.h"
#import "HomeVCData.h"
@interface HomeVC () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) HomeVCData* dataSource;
@property (strong, nonatomic) NSMutableArray* tableViewData;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //  [self configInitialUI];
    [self configData];
}

- (void)configTableView {
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeTableCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"HomeTableCellID"];
}
- (void)configData {
    [NetworkAccess getJSONDataFromURL:@"http://103.200.20.192:8080/viademy103/start/home?token=a996899dab72123d319bee80f0e303686f6a51f83d6b6e097cce96f47acde7c2" completion:^(NSDictionary *dictionaryData) {
        self.dataSource = [DataAccessVinh getDataHome:dictionaryData];
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
    return [self.dataSource.tableViewData count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CourseCatalog* courseData = [self.dataSource.tableViewData objectAtIndex:section];
    return [courseData.catalogCourses count];
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellID = @"HomeTableCellID";
    HomeTableCell* cell = (HomeTableCell*)[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[HomeTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    CourseCatalog* catalogData = [self.dataSource.tableViewData objectAtIndex:indexPath.section];
    HomeTableCellData *dataSource = [catalogData.catalogCourses objectAtIndex:indexPath.row];
    [cell configCellUI:dataSource];
    return cell;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    CourseCatalog* catalogData = [self.dataSource.tableViewData objectAtIndex:section];
    NSString* title = [NSString stringWithFormat:@"%@: ( %lu )",catalogData.catalogName,(unsigned long)[catalogData.catalogCourses count]];
    
    return title;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CourseCatalog* catalogData = [self.dataSource.tableViewData objectAtIndex:indexPath.section];
    HomeTableCellData *cellData = [catalogData.catalogCourses objectAtIndex:indexPath.row];
    CourseVC* courseVC = [[CourseVC alloc] initWithSourceUrl:cellData.courseActionUrl];
    courseVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:courseVC animated:YES completion:^{}];
}


@end
