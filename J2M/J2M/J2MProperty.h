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
@property (nonatomic, readonly, getter=isIdType) BOOL idType;
@property (nonatomic, readonly) Class typeClass;
@property (nonatomic, readonly, getter = isFromFoundation) BOOL fromFoundation;
@property (nonatomic, readonly, getter=isNumberType) BOOL numberType;


- (void)setProperty:(objc_property_t)property;

@end
