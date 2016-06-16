//
//  DataAccessVinh.h
//  Viademy
//
//  Created by hilbert tu on 6/3/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CategoryVCData.h"
#import "HomeTableCellData.h"
#import "LessonCellData.h"
#import "HomeVCData.h"
#import "CourseVCData.h"
#import "CourseHeaderData.h"
#import "SearchVCData.h"
#import "LessonVCData.h"
@interface DataAccessVinh : NSObject
+ (CategoryVCData*)getDataCategory:(NSDictionary*)json;
+ (HomeVCData*)getDataHome:(NSDictionary*)json;
+ (CourseVCData*)getDataCourse:(NSDictionary*)json;
+ (SearchVCData*)getDataSearch:(NSDictionary*)json;
+ (LessonVCData*)getDataLesson:(NSDictionary*)json;
@end
