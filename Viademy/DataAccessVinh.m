//
//  DataAccessVinh.m
//  Viademy
//
//  Created by hilbert tu on 6/3/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import "DataAccessVinh.h"
#import "HomeTableCellData.h"
#import "CourseHeaderCell.h"
#import "LessonCell.h"
#import "SearchVCData.h"
#import "LessonVCData.h"

@implementation DataAccessVinh
+ (BOOL)jsonIsValid:(NSDictionary*)json {
    NSNumber* errorCode = [json objectForKey:@"error"];
    if (errorCode.intValue != 0) {
        NSLog(@"Invalid json");
        return false;
    } else {
        return true;
    }
}
+ (SearchVCData*)getDataSearch:(NSDictionary*)json {
    if ([DataAccessVinh jsonIsValid:json]) {
        SearchVCData* dataSource = [[SearchVCData alloc] init];
        NSMutableArray* items = [[NSMutableArray alloc] init];
        
        for (NSDictionary* aItems in [[json objectForKey:@"data"] objectForKey:@"items"]) {
            HomeTableCellData* aCell = [[HomeTableCellData alloc] initFromCourseListDic:aItems];
            [items addObject:aCell];
        }
        dataSource.tableViewData = items;
        return dataSource;
    } else {
        return nil;
    }
}


+ (CategoryVCData*)getDataCategory:(NSDictionary*)json {
    
    if ([DataAccessVinh jsonIsValid:json]) {
        CategoryVCData* dataSource = [[CategoryVCData alloc] init];
        dataSource.userName = [[[json objectForKey:@"data"] objectForKey:@"user"] objectForKey:@"userName"];
        
        NSMutableArray* items = [[NSMutableArray alloc] init];
        for (NSDictionary* aItems in [[json objectForKey:@"data"] objectForKey:@"items"]) {
            CourseCatalog* aCourseCatalog = [[CourseCatalog alloc] initFromJson:aItems];
            [items addObject:aCourseCatalog];
        }
        dataSource.tableViewData = items;
        return dataSource;
    } else {
        return nil;
    }
    
    
}



+ (HomeVCData*)getDataHome:(NSDictionary*)json{
    
    if ([DataAccessVinh jsonIsValid:json]) {
        HomeVCData* dataSource = [[HomeVCData alloc] init];
        
        NSMutableArray* items = [[NSMutableArray alloc] init];

        NSDictionary* aItems =[[json objectForKey:@"data"] objectForKey:@"selected"];
        CourseCatalog* aCourseCatalog = [[CourseCatalog alloc] initFromJson:aItems];
        [items addObject:aCourseCatalog];
        
        NSDictionary *likedItems = [[json objectForKey:@"data"] objectForKey:@"liked"];
        CourseCatalog *likedCourseCatalog = [[CourseCatalog alloc] initFromJson:likedItems];
        [items addObject:likedCourseCatalog];
        dataSource.tableViewData = items;
        return dataSource;
    } else {
        return nil;
    }
    
    
}
+ (CourseVCData*)getDataCourse:(NSDictionary*)json {
    if ([DataAccessVinh jsonIsValid:json]) {
        CourseVCData* dataSource = [[CourseVCData alloc] init];
        NSMutableArray* items = [[NSMutableArray alloc] init];
        
        CourseHeaderData* aCell = [[CourseHeaderData alloc] initFromCourseHeaderDic:[[json objectForKey:@"data"] objectForKey:@"courseDetails"]];
        [items addObject:aCell];
        
        for (NSDictionary* aItems in [[json objectForKey:@"data"] objectForKey:@"items"]) {
            LessonCellData* aCell = [[LessonCellData alloc] initFromLessonListDic:aItems];
            [items addObject:aCell];
        }
        dataSource.tableViewData = items;
        return dataSource;
    } else {
        return nil;
    }
    
}

+ (LessonVCData*)getDataLesson:(NSDictionary*)json {
    if ([DataAccessVinh jsonIsValid:json]) {
        LessonVCData* dataSource = [[LessonVCData alloc] init];
        NSMutableArray* items = [[NSMutableArray alloc] init];
        
      
        dataSource.lessonYoutubeKey = [[[json objectForKey:@"data"] objectForKey:@"lessonDetails"] objectForKey:@"lessonYoutubeKey"];

        for (NSDictionary* aItems in [[json objectForKey:@"data"] objectForKey:@"items"]) {
            LessonCellData* aCell = [[LessonCellData alloc] initFromLessonListDic:aItems];
            [items addObject:aCell];
        }
        dataSource.tableViewData = items;
        return dataSource;
    } else {
        return nil;
    }
    
}

@end
