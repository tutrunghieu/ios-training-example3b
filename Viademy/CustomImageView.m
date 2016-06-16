//
//  CustomImageView.m
//  Viademy
//
//  Created by Pham Dinh Thang on 6/3/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import "CustomImageView.h"
#import "NetworkAccess.h"
@interface CustomImageView() {
    __block CustomImageView *mySelf;
}
@property (nonatomic, strong) UIActivityIndicatorView *loadingView;
@end
@implementation CustomImageView

- (void)setImageUrl:(NSString *)imageUrl withImageID:(NSString*)imageID withDefaultImage:(UIImage*)defaultImage {
    if (defaultImage != nil) {
        self.image = defaultImage;
    } else self.image = [UIImage imageNamed:@"defaultImageLandscape.png"];
    
//    Config the loading view
    self.loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self addSubview:self.loadingView];
    [self.loadingView startAnimating];
    //Auto layout the loading View
    self.loadingView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.loadingView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.loadingView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f]];
    
    if (imageUrl!= nil) {
        if (imageID != nil) {
            //Use File manager to load file from local store if file exist
        } else {
            //Perform the task in the background thread to avoid lag
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                mySelf = self;
                [NetworkAccess downloadImageWithURL:imageUrl andID:nil completion:^(UIImage *image) {
                    //Go back to the main thread to update the UI
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.loadingView removeFromSuperview];
                        mySelf.image = image;
                    });
                }];
            });
        }
    } else {
        [self.loadingView removeFromSuperview];
        NSLog(@"No ImageURL entered. Please input an ImageURL");
    }
}
- (void)cancelPreviousDownloadImageCmd {
    if (self.loadingView.superview != nil) {
        //        [self.loadingView removeFromSuperview];
    }
    mySelf = nil;
}
- (void)addTarget:(id)target onTap:(SEL)action withCMEImageView:(CustomImageView*)sender {
    sender.userInteractionEnabled = YES;
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
    [sender addGestureRecognizer:tap];
}

@end
