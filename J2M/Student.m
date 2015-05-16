//
//  Student.m
//  MJExtensionExample
//
//  Created by MJ Lee on 15/1/5.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "Student.h"

@implementation Student

//+ (NSString *)j2m_keyMap:(NSString *)key
//{
//    if ([key isEqualToString:@"ID"]) {
//        return @"id";
//    }
//    else if ( [key isEqualToString:@"desc"]) {
//        return @"desciption";
//    }
//    return nil;
//}
//
//+ (NSString *)j2m_keyPath:(NSString *)path
//{
//    if ([path isEqualToString:@"oldName"]) {
//        return @"name.oldName";
//    }
//    else if ([path isEqualToString:@"nowName"]) {
//        return @"name.newName";
//    }
//    else if ([path isEqualToString:@"nameChangedTime"]) {
//        return @"name.info.nameChangedTime";
//    }
//    else if ([path isEqualToString:@"bag"]) {
//        return @"other.bag";
//    }
//    return nil;
//}

+ (NSDictionary *)j2m_keyMaps
{
    return @{@"ID" : @"id", @"desc" : @"desciption"};
}

+ (NSDictionary *)j2m_keyPaths
{
    return @{@"oldName" : @"name.oldName",
             @"nowName" : @"name.newName",
             @"nameChangedTime" : @"name.info.nameChangedTime",
             @"bag" : @"other.bag"};
}

@end
