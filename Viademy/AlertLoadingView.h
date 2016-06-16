//
//  AlertLoadingView.h
//  Viademy
//
//  Created by Pham Dinh Thang on 6/3/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AlertLoadingView : NSObject
+(instancetype)sharedAlertLoadingView;
- (void)showLoadingWithTitle:(NSString*)title;
- (void)dismissLoadingView;
@end
