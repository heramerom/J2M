//
//  OBJClass.m
//  Json2Model
//
//  Created by heramerom on 15/5/7.
//  Copyright (c) 2015年 Amour. All rights reserved.
//

#import "J2MClass.h"
#import "MJFoundation_J2M.h"
#import "J2MProperty.h"
#import "J2MUtils.h"

static NSMutableDictionary *s_classCacheed;

@implementation J2MClass

@synthesize properties = _properties;

+ (void)cacheClassWithKey:(NSString *)key class:(J2MClass *)cls
{
    if (!s_classCacheed) {
        s_classCacheed = [[NSMutableDictionary alloc] init];
    }
    [s_classCacheed setObject:cls forKey:key];
}

+ (J2MClass *)classWithCachedKey:(NSString *)key
{
    return [s_classCacheed objectForKey:key];
}

+ (J2MClass *)objClassWithClass:(Class)cls
{
    J2MClass  *obj = [J2MClass classWithCachedKey:NSStringFromClass(cls)];
    if (!obj) {
        obj = [[J2MClass alloc] initWithClass:cls];
        [J2MClass cacheClassWithKey:NSStringFromClass(cls) class:obj];
    }
    return obj;
}

- (id)initWithClass:(Class)cls
{
    if (self = [super init]) {
        self.cls = cls;
    }
    return self;
}

- (NSArray *)properties
{
    if (!_properties) {
        NSMutableArray *properties = [[NSMutableArray alloc] init];
        Class c = self.cls;
        while (![MJFoundation_J2M isClassFromFoundation:c]) {
            unsigned int outCount = 0;
            objc_property_t *ps = class_copyPropertyList(c, &outCount);
            
            NSArray *ignores = nil;
            if (class_getClassMethod(self.cls, @selector(j2m_ignoreProperties))) {
                ignores = [self.cls j2m_ignoreProperties];
            }
            
            NSDictionary *keyPaths = nil;
            if (class_getClassMethod(self.cls, @selector(j2m_keyPaths))) {
                keyPaths = [self.cls j2m_keyPaths];
            }
            
            NSDictionary *keyMaps = nil;
            if (class_getClassMethod(self.cls, @selector(j2m_keyMaps))) {
                keyMaps = [self.cls j2m_keyMaps];
            }
            
            NSDictionary *clses = nil;
            if (class_getClassMethod(self.cls, @selector(j2m_arrayClasses))) {
                clses = [self.cls j2m_arrayClasses];
            }
            
            for (unsigned int i = 0; i < outCount; i ++ ) {
                objc_property_t t = ps[i];
                
                NSString *name = @(property_getName(t));
                
                if ([ignores containsObject:name]) {
                    continue;
                }
                
                J2MProperty *objp = [J2MProperty new];
                if ([[keyPaths allKeys] containsObject:name]) {
                    objp.keyPath = [keyPaths valueForKey:name];
                    objp.name = name;
                }
                else if ([[keyMaps allKeys] containsObject:name]) {
                    objp.key = [keyMaps valueForKey:name];
                    objp.name = name;
                }
                
                if ([[clses allKeys] containsObject:name]) {
                    objp.arrayClass = [clses valueForKey:name];
                }
                
                objp.property = ps[i];
                // If the property is readonly, ignore
                if (!objp.isReadonly && !objp.isKVCDisabled) {
                    [properties addObject:objp];
                }
            }
            free(ps);
            
            c = class_getSuperclass(c);
        }
        _properties = properties;
    }
    return _properties;
}

@end
