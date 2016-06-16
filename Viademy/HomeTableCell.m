//
//  HomeTableCell.m
//  Viademy
//
//  Created by hilbert tu on 6/2/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import "HomeTableCell.h"

@implementation HomeTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCellUI:(HomeTableCellData*)cellData  {
    
    [self.courseTitle setText:cellData.courseTitle];
    [self.courseSubTitle setText:cellData.courseSubTitle];
    [self.courseImageUrl setImageUrl:cellData.courseImageUrl withImageID:nil withDefaultImage:nil];
    self.courseLength.text = @"1:40";
}
@end
