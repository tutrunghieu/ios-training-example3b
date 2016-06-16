//
//  AppConfig.m
//  Viademy
//
//  Created by Pham Dinh Thang on 6/3/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import "AppConfig.h"

@implementation AppConfig
+ (instancetype)sharedAppConfig {
    static AppConfig *sharedAppConfig = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedAppConfig = [self new];
    });
    return sharedAppConfig;
}
- (id)init {
    if (self = [super init]) {
        self.deviceWidth = [NSString stringWithFormat:@"%.0f",[UIScreen mainScreen].bounds.size.width];
        self.deviceHeight = [NSString stringWithFormat:@"%.0f",[UIScreen mainScreen].bounds.size.height];
        UIDevice *device = [UIDevice currentDevice];
        NSString  *currentDeviceId = [[device identifierForVendor]UUIDString];
        self.deviceId = currentDeviceId;
        self.token = nil;
        self.isOfflineMode = NO;
    }
    return self;
}
- (void)saveLogInSessionWithToken:(NSString*)token; {
    NSString* logInSessionPlistPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"logInSession"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:logInSessionPlistPath]) {
        [[NSFileManager defaultManager] removeItemAtPath:logInSessionPlistPath error:nil];
    }
    
    NSDictionary* logInSession = @{@"token":token};
    //Write logInSession to file
    if ([logInSession writeToFile:logInSessionPlistPath atomically:YES]) {
        NSLog(@"Save logInSession successfully.");
    } else {
        NSLog(@"Fail to generate and save ClientID");
    }
}
- (void)loadLogInSession {
    NSString* logInSessionPlistPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"logInSession"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:logInSessionPlistPath]) {
        //Found logInSession in plist file
        NSDictionary* logInSession = [NSDictionary dictionaryWithContentsOfFile:logInSessionPlistPath];
        self.token = [logInSession objectForKey:@"token"];
    } else {
        NSLog(@"User not logged In. Please Log in");
    }
}
- (void)deleteCurrentLogInSession {
    NSString* logInSessionPlistPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"logInSession"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:logInSessionPlistPath]) {
        if ([[NSFileManager defaultManager] removeItemAtPath:logInSessionPlistPath error:nil]) {
            NSLog(@"Delete log in session successfully");
        } else NSLog(@"Fail to delete log in session");
    }
}
- (BOOL)checkLogInSession {
    NSString* logInSessionPlistPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"logInSession"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:logInSessionPlistPath]) {
        return YES;
    } else return NO;
}
- (void)configCacheDirectory {
    NSString* tdCachePath = [((NSString*)(NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject)) stringByAppendingPathComponent:@"/Cache"];
    
    //Create the CMECache folder if it is not yet created
    if ([[NSFileManager defaultManager] fileExistsAtPath:tdCachePath] == NO) {
        [[NSFileManager defaultManager] createDirectoryAtPath:tdCachePath withIntermediateDirectories:NO attributes:nil error:nil];
    }
    self.cachePath = tdCachePath;
}
@end
