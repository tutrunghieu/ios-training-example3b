//
//  LoadingView.h
//  Viademy
//
//  Created by Pham Dinh Thang on 6/3/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingView : UIView
@property BOOL loadingViewIsCurrentlyShowed;
+(instancetype)sharedLoadingView;
- (void)addLoadingViewToView:(UIView*)view;
- (void)removeLoadingView;
- (void)checkCurrentLoadingViewState;
@end
