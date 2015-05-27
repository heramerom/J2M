//
//  Model.h
//  J2M
//
//  Created by XiaoHonglin on 15/5/27.
//  Copyright (c) 2015年 Amour. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "J2MUtils.h"

@interface ModelUser : NSObject<J2MProtocol>

@property (nonatomic, strong) NSString *name;

@end


@interface Model : NSObject<J2MProtocol>

@property (nonatomic, strong) NSString *model;
@property (nonatomic, strong) NSArray *arrays;
@property (nonatomic, strong) NSDictionary *dict;
@property (nonatomic, strong) NSArray *users;
@property (nonatomic, strong) ModelUser *user;

@end
