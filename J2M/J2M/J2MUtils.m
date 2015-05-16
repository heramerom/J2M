//
//  OBJUtils.m
//  Json2Model
//
//  Created by heramerom on 15/5/7.
//  Copyright (c) 2015年 Amour. All rights reserved.
//

#import "J2MUtils.h"
#import "J2MClass.h"
#import "J2MProperty.h"
#import "MJFoundation_J2M.h"

@implementation NSDictionary(J2M)

- (id)toModel:(Class)cls
{
#if DEBUG
    if (![cls conformsToProtocol:@protocol(J2MProtocol)]) {
        NSAssert(NO, @"%@ must conform to <J2MProtocol>", cls);
    }
#endif
    id model = [cls new];
    J2MClass *obj = [J2MClass objClassWithClass:cls];
    NSArray *properties = [obj properties];
    for (J2MProperty *p  in properties) {
        id value = nil;
        if (p.key) {
            value = self[p.key];
        }
        else if (p.keyPath) {
            value = [self valueForKeyPath:p.keyPath];
        }
        else if (p.name) {
            value = self[p.name];
        }
        
        if (!value || [value isKindOfClass:[NSNull class]]) {
            continue;
        }
        
        if (value) {
            if ([value isKindOfClass:[NSDictionary class]] && !p.isFromFoundation) {
                [model setValue:[value toModel:p.typeClass] forKey:p.name];
            }
            else if ([value isKindOfClass:[NSArray class]] && p.arrayClass) {
                [model setValue:[value toModels:NSClassFromString(p.arrayClass)] forKey:p.name];
            }
            else {
                [model setValue:value forKey:p.name];
            }
        }
    }
    return model;
}

@end

@implementation NSArray(J2M)

- (NSArray *)toModels:(Class)cls
{
#if DEBUG
    if (![cls conformsToProtocol:@protocol(J2MProtocol)]) {
        NSAssert(NO, @"%@ must conform to <J2MProtocol>", cls);
    }
#endif
    NSMutableArray *models = [NSMutableArray array];
    for (NSDictionary *dict in self) {
        if ([dict isKindOfClass:[NSNull class]]) {
            continue;
        }
        [models addObject:[dict toModel:cls]];
    }
    return models;
}

@end