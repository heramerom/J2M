//
//  User.m
//  字典与模型的互转
//
//  Created by MJ Lee on 14-5-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "User.h"

@implementation User

- (NSString *)description
{
    return [NSString stringWithFormat:@"<User:%p, name = %@, age = %u>", self, self.name, self.age];
}

@end
