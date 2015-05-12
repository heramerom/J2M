//
//  MJFoundation.m
//  MJExtensionExample
//
//  Created by MJ Lee on 14/7/16.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJFoundation_J2M.h"
#import "MJConst_J2M.h"
#import <CoreData/CoreData.h>

static NSSet *_foundationClasses;

@implementation MJFoundation_J2M

+ (void)load
{
    _foundationClasses = [NSSet setWithObjects:
                          [NSObject class],
                          [NSURL class],
                          [NSDate class],
                          [NSNumber class],
                          [NSDecimalNumber class],
                          [NSData class],
                          [NSMutableData class],
                          [NSArray class],
                          [NSMutableArray class],
                          [NSDictionary class],
                          [NSMutableDictionary class],
                          [NSManagedObject class],
                          [NSString class],
                          [NSMutableString class], nil];
}

+ (BOOL)isClassFromFoundation:(Class)c
{
    return [_foundationClasses containsObject:c];
}
@end
