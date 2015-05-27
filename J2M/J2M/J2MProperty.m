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
    unsigned int count = 0;
    objc_property_attribute_t *ts = property_copyAttributeList(property, &count);
    for (int i = 0; i < count; i ++) {
        if (strcmp("T", ts[i].name) == 0) {
            _code = @(ts[i].value);
        }
        else if (strcmp("R", ts[i].name) == 0) {
            _readonly = YES;
            free(ts);
            return;
        }
    }
    free(ts);
    
    _name = @(property_getName(property));
    
    NSAssert(_code != nil, @"code can not be nil!");

    if ([_code isEqualToString:MJTypeId_J2M]) {
        _idType = YES;
    } else if (_code.length == 0) {
        _KVCDisabled = YES;
    } else if (_code.length > 3 && [_code hasPrefix:@"@\""]) {
        _code = [_code substringWithRange:NSMakeRange(2, _code.length - 3)];
        _typeClass = NSClassFromString(_code);
        _fromFoundation = [MJFoundation_J2M isClassFromFoundation:_typeClass];
        _numberType = (_typeClass == [NSNumber class] || [_typeClass isSubclassOfClass:[NSNumber class]]);
    } else if ([_code isEqualToString:MJTypeSEL_J2M] ||
               [_code isEqualToString:MJTypeIvar_J2M] ||
               [_code isEqualToString:MJTypeMethod_J2M]) {
        _KVCDisabled = YES;
    }
    
    NSString *lowerCode = _code.lowercaseString;
    NSArray *numberTypes = @[MJTypeInt_J2M, MJTypeFloat_J2M, MJTypeDouble_J2M, MJTypeLong_J2M, MJTypeChar_J2M];
    if ([numberTypes containsObject:lowerCode]) {
        _numberType = YES;
    }
}

@end
