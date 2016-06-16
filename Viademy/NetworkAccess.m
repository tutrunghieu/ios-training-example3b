//
//  NetworkAccess.m
//  Viademy
//
//  Created by Pham Dinh Thang on 6/3/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import "NetworkAccess.h"
#import <UIKit/UIKit.h>
#import "AFNetworking.h"
@implementation NetworkAccess
+ (void)getJSONDataFromURL:(NSString *)urlString completion:(void (^)(NSDictionary * dictionaryData))completionHandler error:(void (^)(NSError *))errorHandler {
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"GET = %@",urlString);
    NSURL* url = [NSURL URLWithString:urlString];
    NSURLRequest* urlRequest = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation* operation = [[AFHTTPRequestOperation alloc]initWithRequest:urlRequest];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
//    [[LoadingView sharedLoadingView] addLoadingViewToView:UIApplication.sharedApplication.delegate.window];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation* operation, id responseObject) {
 //       [[LoadingView sharedLoadingView] removeLoadingView];
        NSDictionary* dictionaryData = (NSDictionary*)responseObject;
        completionHandler(dictionaryData);
    } failure:^(AFHTTPRequestOperation* operation, NSError* error) {
//        [[LoadingView sharedLoadingView] removeLoadingView];
        errorHandler(error);
    }];
    [operation start];
}
+ (void)getUnknownDataFromURL:(NSString *)urlString completion:(void (^)(id responseData))completionHandler error:(void (^)(NSError *))errorHandler {
    NSLog(@"GET = %@",urlString);
    NSURL* url = [NSURL URLWithString:urlString];
    NSURLRequest* urlRequest = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation* operation = [[AFHTTPRequestOperation alloc]initWithRequest:urlRequest];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    
    
 //   [[AlertLoadingView sharedAlertLoadingView] showLoadingWithTitle:@"loading"];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation* operation, id responseObject) {
//        [[AlertLoadingView sharedAlertLoadingView] dismissLoadingView];
        completionHandler(responseObject);
    } failure:^(AFHTTPRequestOperation* operation, NSError* error) {
 //       [[AlertLoadingView sharedAlertLoadingView] dismissLoadingView];
        errorHandler(error);
    }];
    [operation start];
}
+ (void)postHTTPRequestWithURL:(NSString*)urlString andParameter:(NSDictionary*)parameter completion:(void (^)(NSDictionary *))completionHandler error:(void (^)(NSError *))errorHandler {
    
    //Original POST param to body of HTTP post request
    //    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    //    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    //    [manager.requestSerializer setValue:@"*/*" forHTTPHeaderField:@"Accept"];
    //    [[TDAlertLoadingView sharedTDAlertLoadingView] showLoadingWithTitle:@"loading"];
    //    [manager POST:urlString parameters:parameter success:^(AFHTTPRequestOperation* operation, id responseObject) {
    //        [[TDAlertLoadingView sharedTDAlertLoadingView] dismissLoadingView];
    //        NSDictionary* etodenDic = (NSDictionary*)responseObject;
    //        completionHandler(etodenDic);
    //    } failure: ^(AFHTTPRequestOperation* operation, NSError* error) {
    //        [[TDAlertLoadingView sharedTDAlertLoadingView] dismissLoadingView];
    //        errorHandler(error);
    //    }];
    
    
    //Trick version: append param to the URL, then use HTTP GET instead of POST
    NSMutableString* appendedUrlString = [NSMutableString stringWithString:urlString];
    
    for (NSString* akey in parameter.allKeys) {
        id value = [parameter objectForKey:akey];
        if ([value isKindOfClass:[NSString class]]) {
            [appendedUrlString appendString:[NSString stringWithFormat:@"%@=%@&",akey,value]];
        }
        if ([value isKindOfClass:[NSArray class]]) {
            [appendedUrlString appendString:[NSString stringWithFormat:@"&%@=",akey]];
            for (NSString* aStr in (NSArray*)value) {
                [appendedUrlString appendString:[NSString stringWithFormat:@"%@;",aStr]];
            }
            [appendedUrlString deleteCharactersInRange:NSMakeRange([appendedUrlString length]-1, 1)];
        }
    }
    NSString* lastChar = [appendedUrlString substringFromIndex:[appendedUrlString length]-1];
    if ([lastChar isEqualToString:@"&"]) {
        appendedUrlString = (NSMutableString*)[appendedUrlString substringToIndex:[appendedUrlString length]-1];
    }
    
    appendedUrlString = [NSMutableString stringWithString:[appendedUrlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"POST = %@",appendedUrlString);
    NSURL* url = [NSURL URLWithString:appendedUrlString];
    NSURLRequest* urlRequest = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation* operation = [[AFHTTPRequestOperation alloc]initWithRequest:urlRequest];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
//    operation.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
//    [[LoadingView sharedLoadingView] addLoadingViewToView:UIApplication.sharedApplication.delegate.window];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation* operation, id responseObject) {
//        [[LoadingView sharedLoadingView] removeLoadingView];
        completionHandler(responseObject);
    } failure:^(AFHTTPRequestOperation* operation, NSError* error) {
//        [[LoadingView sharedLoadingView] removeLoadingView];
        errorHandler(error);
    }];
    [operation start];
}
+ (void)downloadImageWithURL:(NSString*)imageURL andID:(NSString*)imageID completion:(void (^)(UIImage *image))completionHandler {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:imageURL] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * response, NSData *responseData, NSError *error) {
        if (responseData) {
            UIImage* responseImage = [[UIImage alloc]initWithData:responseData];
            completionHandler(responseImage);
            
            //Save the image asynchronously on the background thread to avoid lag
//            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//                if (imageID != nil) {
//                    [TDFileManager saveImage:[[UIImage alloc] initWithData:responseData] toCMECacheWithImageID:imageID];
//                }
//            });
        } else {
            NSLog(@"Error downloading image. Error description = %@",error.description);
        }
    }];
}
@end
