//
//  CategoryVCData.m
//  Viademy
//
//  Created by hilbert tu on 6/3/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import "CategoryVCData.h"

@implementation CourseCatalog
- (id)initFromJson:(NSDictionary *)json {
    self = [super init];
    if (self) {
        self.catalogId = [json objectForKey:@"catalogId"];
        self.catalogName = [json objectForKey:@"catalogName"];
        NSMutableArray* courseList = [[NSMutableArray alloc] init];
        for (NSDictionary* aCourse in [json objectForKey:@"courses"]) {
            HomeTableCellData* aCourseData = [[HomeTableCellData alloc] initFromCourseListDic:aCourse];
            [courseList addObject:aCourseData];
        }
        self.catalogCourses = courseList;
    }
    return self;
}

@end


@implementation CategoryVCData

@end
