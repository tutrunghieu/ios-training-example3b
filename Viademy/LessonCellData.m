//
//  LessonCellData.m
//  Viademy
//
//  Created by VinhHV on 6/6/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import "LessonCellData.h"

@implementation LessonCellData

-(id)initFromLessonListDic:(NSDictionary*)dic {
    self = [super init];
    if (self) {
        self.lessonTitle = [dic objectForKey:@"lessonTitle"];
        self.lessonSubTitle = [dic objectForKey:@"lessonSubTitle"];
        self.lessonImageUrl = [dic objectForKey:@"lessonImageUrl"];
        self.lessonTotalLength = [dic objectForKey:@"lessonTotalLength"];
        self.lessonVideoUrl = [dic objectForKey:@"lessonVideoUrl"];
         self.lessonActionUrl = [dic objectForKey:@"lessonActionUrl"];
        self.lessonYoutubeKey = [dic objectForKey:@"lessonYoutubeKey"];
    }
    return self;
}
@end
