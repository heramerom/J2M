//
//  OBJProperty.m
//  Json2Model
//
//  Created by heramerom on 15/5/7.
//  Copyright (c) 2015年 Amour. All rights reserved.
//

#import "J2MProperty.h"
#import "MJConst_J2M.h"
#import "MJFoundation_J2M.h"

@implementation J2MProperty

- (void)setProperty:(objc_property_t)property
{
    NSString *attrs = @(property_getAttributes(property));
    NSUInteger loc = 1;
    NSUInteger len = [attrs rangeOfString:@","].location - loc;
    
    NSString *code = [attrs substringWithRange:NSMakeRange(loc, len)];
    
    _name = @(property_getName(property));
    _code = code;

    NSAssert(code != nil, @"code can not be nil!");

    if ([code isEqualToString:MJTypeId_J2M]) {
        _idType = YES;
    } else if (code.length == 0) {
        _KVCDisabled = YES;
    } else if (code.length > 3 && [code hasPrefix:@"@\""]) {
        // 去掉@"和"，截取中间的类型名称
        _code = [code substringWithRange:NSMakeRange(2, code.length - 3)];
        _typeClass = NSClassFromString(_code);
        _fromFoundation = [MJFoundation_J2M isClassFromFoundation:_typeClass];
        _numberType = (_typeClass == [NSNumber class] || [_typeClass isSubclassOfClass:[NSNumber class]]);
    } else if ([code isEqualToString:MJTypeSEL_J2M] ||
               [code isEqualToString:MJTypeIvar_J2M] ||
               [code isEqualToString:MJTypeMethod_J2M]) {
        _KVCDisabled = YES;
    }
    
    // 是否为数字类型
    NSString *lowerCode = _code.lowercaseString;
    NSArray *numberTypes = @[MJTypeInt_J2M, MJTypeFloat_J2M, MJTypeDouble_J2M, MJTypeLong_J2M, MJTypeChar_J2M];
    if ([numberTypes containsObject:lowerCode]) {
        _numberType = YES;
    }
}

@end
