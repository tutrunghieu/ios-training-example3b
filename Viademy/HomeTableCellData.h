//
//  HomeTableCellData.h
//  Viademy
//
//  Created by VinhHV on 6/6/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HomeTableCellData : NSObject
-(id)initFromCourseListDic:(NSDictionary*)dic;
@property (nonatomic, strong) NSString* courseId;
@property (nonatomic, strong) NSString* courseTitle;
@property (nonatomic, strong) NSString* courseSubTitle;
@property (nonatomic, strong) NSString* courseImageUrl;
@property (nonatomic, strong) NSString* courseActionUrl;


@end
