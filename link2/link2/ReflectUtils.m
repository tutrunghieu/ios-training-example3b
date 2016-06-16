//
//  ReflectUtils.m
//  link2
//
//  Created by hilbert tu on 6/16/16.
//  Copyright © 2016 silkroadpacific. All rights reserved.
//

#import "ReflectUtils.h"

@implementation ReflectUtils


+ (id)copyFrom:(NSDictionary *)data to: (id) object
{
    
    for (NSString * nk in data.allKeys)
    {
        NSObject * vk = [data valueForKey: nk];
        [object setValue:vk forKey:nk];
    }
    
    return object;
}

@end
