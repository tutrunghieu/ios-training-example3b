//
//  AppConfig.h
//  Viademy
//
//  Created by Pham Dinh Thang on 6/3/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define LOADINGVIEW_COLOR [UIColor colorWithRed:200.0f/255.0f green:136.0f/255.0f blue:0.0f/255.0f alpha:0.5f]
#define MAIN_COLOR [UIColor colorWithRed:220.0f/255.0f green:173.0f/255.0f blue:80.0f/255.0f alpha:1.0f]
#define BACKGROUND_COLOR [UIColor colorWithWhite:219.0f/255.0f alpha:1.0f]

@interface AppConfig : NSObject
@property (nonatomic, strong) NSString* deviceWidth;
@property (nonatomic, strong) NSString* deviceHeight;
@property (nonatomic, strong) NSString* deviceId;
@property (nonatomic, strong) NSString* cachePath;
@property (nonatomic, strong) NSString* token;
@property BOOL isOfflineMode;
+(instancetype)sharedAppConfig;
- (void)saveLogInSessionWithToken:(NSString*)token;
- (void)loadLogInSession;
- (void)deleteCurrentLogInSession;
- (BOOL)checkLogInSession;
- (void)configCacheDirectory;
@end
