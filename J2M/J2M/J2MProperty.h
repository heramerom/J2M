//
//  OBJProperty.h
//  Json2Model
//
//  Created by heramerom on 15/5/7.
//  Copyright (c) 2015年 Amour. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface J2MProperty : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *code;

@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *keyPath;
@property (nonatomic, strong) NSString *arrayClass;

@property (nonatomic, readonly, getter=isEnabled) BOOL enabled;

@property (nonatomic, readonly, getter = isKVCDisabled) BOOL KVCDisabled;

/** 是否为id类型 */
@property (nonatomic, readonly, getter=isIdType) BOOL idType;
/** 对象类型（如果是基本数据类型，此值为nil） */
@property (nonatomic, readonly) Class typeClass;
/** 类型是否来自于Foundation框架，比如NSString、NSArray */
@property (nonatomic, readonly, getter = isFromFoundation) BOOL fromFoundation;
/** 是否为基本数字类型：int、float等 */
@property (nonatomic, readonly, getter=isNumberType) BOOL numberType;


- (void)setProperty:(objc_property_t)property;

@end
