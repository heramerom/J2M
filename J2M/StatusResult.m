//
//  StatusResult.m
//  字典与模型的互转
//
//  Created by MJ Lee on 14-5-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "StatusResult.h"

@implementation StatusResult

+ (NSString *)j2m_classInArray:(NSString *)cls
{
    if ([cls isEqualToString:@"statuses"]) {
        return @"Status";
    }
    else if ([cls isEqualToString:@"ads"]) {
        return @"Ad";
    }
    return nil;
}

@end
