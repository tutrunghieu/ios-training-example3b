//
//  LessonCell.m
//  Viademy
//
//  Created by VinhHV on 6/6/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import "LessonCell.h"

@implementation LessonCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)configCellUI:(LessonCellData*)cellData  {
    
    [self.lessonTitle setText:cellData.lessonTitle];
    [self.lessonSubTitle setText:cellData.lessonSubTitle];
    [self.lessonImageUrl setImageUrl:cellData.lessonImageUrl withImageID:nil withDefaultImage:nil];
    [self.lessonTotalLength setText:cellData.lessonTotalLength];
}
@end
