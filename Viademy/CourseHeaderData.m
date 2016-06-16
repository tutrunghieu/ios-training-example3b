//
//  CourseHeaderData.m
//  Viademy
//
//  Created by VinhHV on 6/6/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import "CourseHeaderData.h"

@implementation CourseHeaderData
-(id)initFromCourseHeaderDic:(NSDictionary*)dic {
    self = [super init];
    if (self) {
        self.courseTitle = [dic objectForKey:@"courseTitle"];
    }
    return self;
}
@end
