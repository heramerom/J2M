//
//  Bag.h
//  MJExtensionExample
//
//  Created by MJ Lee on 15/1/28.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "J2MUtils.h"

@interface Bag : NSObject  <J2MProtocol>
@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) double price;
@end
