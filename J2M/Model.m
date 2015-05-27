//
//  Model.m
//  J2M
//
//  Created by XiaoHonglin on 15/5/27.
//  Copyright (c) 2015年 Amour. All rights reserved.
//

#import "Model.h"

@implementation ModelUser

- (NSString *)description
{
    return [NSString stringWithFormat:@"<ModelUser:%p, name = %@>", self, self.name];
}


@end

@implementation Model

+ (NSDictionary *)j2m_arrayClasses
{
    return @{@"users" : @"ModelUser"};
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<Model:%p model = %@, arrays = %@, dict = %@, users= %@, user = %@>", self, self.model, self.arrays, self.dict, self.users, self.user];
}

@end
