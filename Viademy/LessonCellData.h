//
//  LessonCellData.h
//  Viademy
//
//  Created by VinhHV on 6/6/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LessonCellData : NSObject
-(id)initFromLessonListDic:(NSDictionary*)dic;
@property (nonatomic, strong) NSString* lessonTitle;
@property (nonatomic, strong) NSString* lessonSubTitle;
@property (nonatomic, strong) NSString* lessonImageUrl;
@property (nonatomic, strong) NSString* lessonTotalLength;
@property (nonatomic, strong) NSString* lessonVideoUrl;
@property (nonatomic, strong) NSString* lessonActionUrl;
@property (nonatomic, strong) NSString* lessonYoutubeKey;
@end
