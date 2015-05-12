//
//  OBJUtils.h
//  Json2Model
//
//  Created by heramerom on 15/5/7.
//  Copyright (c) 2015年 Amour. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "J2MClass.h"

@protocol J2MProtocol <NSObject>

@optional

+ (BOOL)j2m_wasPropertyIngored:(NSString *)name;

+ (NSString *)j2m_keyMap:(NSString *)key;

+ (NSString *)j2m_keyPath:(NSString *)path;

+ (NSString *)j2m_classInArray:(NSString *)cls;

@end

@interface NSDictionary(J2M)

- (id)toModel:(Class)cls;

@end

@interface NSArray(J2M)

- (NSArray *)toModels:(Class)cls;

@end

