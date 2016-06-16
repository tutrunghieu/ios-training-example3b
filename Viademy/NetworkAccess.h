//
//  NetworkAccess.h
//  Viademy
//
//  Created by Pham Dinh Thang on 6/3/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NetworkAccess : NSObject
+ (void)getJSONDataFromURL:(NSString*)urlString completion:(void (^)(NSDictionary* dictionaryData))completionHandler error:(void (^)(NSError* error))errorHandler;
+ (void)getUnknownDataFromURL:(NSString*)urlString completion:(void (^)(id responseData))completionHandler error:(void (^)(NSError *))errorHandler;
+ (void)postHTTPRequestWithURL:(NSString*)urlString andParameter:(NSDictionary*)parameter completion:(void (^)(NSDictionary* postResponseData))completionHandler error:(void (^)(NSError* error))errorHandler;
+ (void)downloadImageWithURL:(NSString*)imageURL andID:(NSString*)imageID completion:(void (^)(UIImage *image))completionHandler;
@end
