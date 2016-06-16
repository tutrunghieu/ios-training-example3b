//
//  HomeTableCellData.m
//  Viademy
//
//  Created by VinhHV on 6/6/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import "HomeTableCellData.h"

@implementation HomeTableCellData
-(id)initFromCourseListDic:(NSDictionary*)dic {
    self = [super init];
    if (self) {
        self.courseTitle = [dic objectForKey:@"courseTitle"];
        self.courseSubTitle = [dic objectForKey:@"courseSubTitle"];
        self.courseImageUrl = [dic objectForKey:@"courseImageUrl"];
        self.courseActionUrl = [dic objectForKey:@"courseActionUrl"];
    }
    return self;
}

@end
