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
+ (NSArray *)j2m_ignoreProperties;
+ (NSDictionary *)j2m_keyMaps;
+ (NSDictionary *)j2m_keyPaths;
+ (NSDictionary *)j2m_arrayClasses;

@end

@interface NSDictionary(J2M)

- (id)toModel:(Class)cls;

@end

@interface NSArray(J2M)

- (NSArray *)toModels:(Class)cls;

@end

