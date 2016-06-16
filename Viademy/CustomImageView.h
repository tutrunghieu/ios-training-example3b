//
//  CustomImageView.h
//  Viademy
//
//  Created by Pham Dinh Thang on 6/3/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomImageView : UIImageView
- (void)setImageUrl:(NSString *)imageUrl withImageID:(NSString*)imageID withDefaultImage:(UIImage*)defaultImage;
- (void)addTarget:(id)target onTap:(SEL)action withCMEImageView:(CustomImageView*)sender;
- (void)cancelPreviousDownloadImageCmd;
@end
