//
//  CategoryVCData.h
//  Viademy
//
//  Created by hilbert tu on 6/3/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeTableCellData.h"

@interface CourseCatalog : NSObject
@property (nonatomic, strong) NSString* catalogId;
@property (nonatomic, strong) NSString* catalogName;
@property (nonatomic, strong) NSArray* catalogCourses;
-(id)initFromJson:(NSDictionary*)json;
@end


@interface CategoryVCData : NSObject
@property (nonatomic, strong) NSString* userName;
@property (nonatomic, strong) NSArray* tableViewData;
@end
