//
//  CourseHeaderCell.h
//  Viademy
//
//  Created by hilbert tu on 6/2/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseHeaderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *courseTitle;
@property (weak, nonatomic) IBOutlet UILabel *coursePublisher;
@property (weak, nonatomic) IBOutlet UILabel *courseShortDesc;
-(void)configCellUI:(CourseHeaderData*)cellData;
@end
