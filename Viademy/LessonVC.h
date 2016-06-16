//
//  LessonVC.h
//  Viademy
//
//  Created by VinhHV on 6/7/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LessonVC : UIViewController
@property (nonatomic, strong) NSString* sourceUrl;
-(id)initWithSourceUrl:(NSString*)sourceUrl;
@end
