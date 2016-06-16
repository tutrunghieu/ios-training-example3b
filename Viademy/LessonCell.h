//
//  LessonCell.h
//  Viademy
//
//  Created by VinhHV on 6/6/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LessonCell : UITableViewCell
@property (weak, nonatomic) IBOutlet CustomImageView *lessonImageUrl;
@property (weak, nonatomic) IBOutlet UILabel *lessonTitle;
@property (weak, nonatomic) IBOutlet UILabel *lessonTotalLength;
@property (weak, nonatomic) IBOutlet UILabel *lessonSubTitle;
- (void)configCellUI:(LessonCellData*)cellData;
@end