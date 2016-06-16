//
//  SearchVC.m
//  Viademy
//
//  Created by hilbert tu on 6/2/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import "SearchVC.h"
#import "SearchVCData.h"
#import "HomeTableCell.h"
#import "CourseVC.h"
@interface SearchVC () <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btnBack;
@property (weak, nonatomic) IBOutlet UIImageView *txtImagesSearch;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *txtSearch;
@property (strong,nonatomic) SearchVCData* dataSource;

@end

@implementation SearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configInititalUI];
//    [self configTableView];
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 0)];
    self.txtSearch.rightView = paddingView;
    self.txtSearch.rightViewMode = UITextFieldViewModeAlways;
    
    self.txtSearch.delegate = self;
    self.txtSearch.returnKeyType = UIReturnKeySearch;
    
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
}
- (void)configInititalUI {
    [self.tableView setHidden:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.txtSearch resignFirstResponder];
    self.txtSearch.layer.masksToBounds=YES;
    self.txtSearch.layer.borderColor=[UIColor blackColor].CGColor;
    self.txtSearch.layer.borderWidth= 1.0f;
    [self.txtImagesSearch setImage:[UIImage imageNamed:@"btn_search_normal.png"]];
    [self configData];
    
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    self.txtSearch.layer.masksToBounds=YES;
//    self.txtSearch.layer.borderColor=[UIColor colorWithRed:201 green:165 blue:35 alpha:1.0].CGColor;
    self.txtSearch.layer.borderWidth= 1.0f;
    [self.txtImagesSearch setImage:[UIImage imageNamed:@"btn_search_selected.png"]];
    return YES;
}


- (IBAction)txtSearch:(id)sender {

}

- (void)configTableView {
    [self.tableView setHidden:NO];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeTableCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"HomeTableCellID"];
}

//============================

- (void)configData {
    NSMutableString* url = [[NSMutableString alloc] initWithString:@"http://103.200.20.192:8080/viademy103/start/search?token="];
    [url appendString:self.txtSearch.text];
//    url = [url stringByReplacingOccurrencesOfString:@" " withString:@""];
//    if(self.txtSearch.text != nil && ![self.txtSearch.text isEqualToString:@""] )
//    
//    {
        [NetworkAccess getJSONDataFromURL:url completion:^(NSDictionary *dictionaryData) {
            self.dataSource = [DataAccessVinh getDataSearch:dictionaryData];
            if (self.dataSource != nil) {
                [self configTableView];
                [self.tableView reloadData];
            } else {
                //Error handling
            }
            
        } error:^(NSError *error) {
            NSLog(@"Error log = %@",error.description);
        }];
//    }
}

#pragma mark - UITableView delegate and datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource.tableViewData count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellID = @"HomeTableCellID";
    HomeTableCell* cell = (HomeTableCell*)[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[HomeTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    HomeTableCellData *dataSource = [self.dataSource.tableViewData objectAtIndex:indexPath.row];
    
    [cell configCellUI:dataSource];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return [NSString stringWithFormat:@"%lu Course",(unsigned long)[self.dataSource.tableViewData count]];
            break;
        default:
            return @"xxx";
            break;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}
- (IBAction)onBack:(UIButton *)sender {
    self.btnBack.selected = NO;
    sender.selected = YES;
    [self dismissViewControllerAnimated:YES completion:^{}];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableCellData *cellData = [self.dataSource.tableViewData objectAtIndex:indexPath.row];    
    CourseVC* courseVC = [[CourseVC alloc] initWithSourceUrl:cellData.courseActionUrl];
    courseVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:courseVC animated:YES completion:^{}];

}

@end
