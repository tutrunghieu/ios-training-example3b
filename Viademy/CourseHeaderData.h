//
//  CourseHeaderData.h
//  Viademy
//
//  Created by VinhHV on 6/6/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CourseHeaderData : NSObject
-(id)initFromCourseHeaderDic:(NSDictionary*)dic;
@property (nonatomic, strong) NSString* courseTitle;
@end
