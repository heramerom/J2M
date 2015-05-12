#ifndef __MJConst__M__
#define __MJConst__M__

#import <Foundation/Foundation.h>

/**
 *  成员变量类型（属性类型）
 */
NSString *const MJTypeInt_J2M = @"i";
NSString *const MJTypeFloat_J2M = @"f";
NSString *const MJTypeDouble_J2M = @"d";
NSString *const MJTypeLong_J2M = @"q";
NSString *const MJTypeLongLong_J2M = @"q";
NSString *const MJTypeChar_J2M = @"c";
NSString *const MJTypeBOOL_J2M = @"c";
NSString *const MJTypePointer_J2M = @"*";

NSString *const MJTypeIvar_J2M = @"^{objc_ivar=}";
NSString *const MJTypeMethod_J2M = @"^{objc_method=}";
NSString *const MJTypeBlock_J2M = @"@?";
NSString *const MJTypeClass_J2M = @"#";
NSString *const MJTypeSEL_J2M = @":";
NSString *const MJTypeId_J2M = @"@";

#endif