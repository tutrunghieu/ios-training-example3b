//
//  CourseVC.h
//  Viademy
//
//  Created by hilbert tu on 6/2/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseVC : UIViewController
@property (nonatomic, strong) NSString* sourceUrl;
-(id)initWithSourceUrl:(NSString*)sourceUrl;
@end
