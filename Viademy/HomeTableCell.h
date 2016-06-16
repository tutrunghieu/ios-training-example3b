//
//  HomeTableCell.h
//  Viademy
//
//  Created by hilbert tu on 6/2/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableCell : UITableViewCell
//@property (weak, nonatomic) IBOutlet CustomImageView *imageView;

@property (weak, nonatomic) IBOutlet CustomImageView *courseImageUrl;
@property (weak, nonatomic) IBOutlet UILabel *courseTitle;
@property (weak, nonatomic) IBOutlet UILabel *courseSubTitle;
@property (weak, nonatomic) IBOutlet UILabel *courseLength;
-(void)configCellUI:(HomeTableCellData*)cellData;
@end
