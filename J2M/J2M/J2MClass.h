//
//  OBJClass.h
//  Json2Model
//
//  Created by heramerom on 15/5/7.
//  Copyright (c) 2015年 Amour. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface J2MClass : NSObject

@property (nonatomic, assign) Class cls;
@property (nonatomic, strong, readonly) NSArray *properties;

+ (J2MClass *)objClassWithClass:(Class)cls;

- (NSArray *)properties;

@end
