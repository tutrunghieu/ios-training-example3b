//
//  AppDelegate.m
//  link2
//
//  Created by hilbert tu on 6/16/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import "AppDelegate.h"
#import "NetworkAccess.h"
#import "ReflectUtils.h"
#import "LikedData.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [NetworkAccess getJSONDataFromURL:@"http://103.200.20.217:8080/viademy103/lesson/like?usid=a996899dab72123d319bee80f0e303686f6a51f83d6b6e097cce96f47acde7c2&lsid=8064dab61d73701fb8295d5c277eb8fd2c7b9c6430e441d1859bd4c99f714cf3"
     
completion:^(NSDictionary *data)
{
   NSLog(@"Result %@", data);
        
    data = [data objectForKey:@"data"];
    NSLog(@"Liked %@", [data objectForKey:@"liked"]);
    NSLog(@"likedBy %@", [data objectForKey:@"likedBy"]);
    
    LikedData * object = [[LikedData alloc] init];
    object = [ReflectUtils copyFrom: data to: object];
 
    NSLog(@"~~~ Liked %@", object.liked);
    NSLog(@"~~~ likedBy 1 %@", object.likedBy);
   
}
     
error:^(NSError *error)
{
    NSLog(@"Error %@", error);
}];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
