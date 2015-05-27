//
//  ModelTest.m
//  J2M
//
//  Created by XiaoHonglin on 15/5/27.
//  Copyright (c) 2015年 Amour. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "J2MUtils.h"
#import "Student.h"
#import "Bag.h"
#import "Status.h"
#import "User.h"
#import "Ad.h"
#import "StatusResult.h"
#import "Model.h"

@interface ModelTest : XCTestCase

@end

@implementation ModelTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
    
    // test model arrays
    NSDictionary *dict = @{
      @"model" : @"model",
      @"arrays" : @[ @"obj1", @"obj2" ],
      @"dict" : @{@"key1" : @"value1", @"key2" : @"value2"},
      @"users" : @[ @{@"name" : @"modelname1"} ],
      @"user" : @{@"name" : @"modelname2"}
    };
    
    Model *m = [dict toModel:[Model class]];
    NSLog(@"model = %@", m);
    
    
}

- (void)testExample1
{
    
    NSLog(@"<---------------->");
    
    // 1.定义一个字典
    NSDictionary *d = @{
                        @"text" : @"是啊，今天天气确实不错！",
                        
                        @"user" : @{
                                @"name" : @"Jack",
                                @"icon" : @"lufy.png"
                                },
                        
                        @"retweetedStatus" : @{
                                @"text" : @"今天天气真不错！",
                                
                                @"user" : @{
                                        @"name" : @"Rose",
                                        @"icon" : @"nami.png"
                                        }
                                }
                        };
    
    // 2.将字典转为Status模型
    Status *status = [d toModel:[Status class]];
    
    // 3.打印status的属性
    NSString *text = status.text;
    NSString *name = status.user.name;
    NSString *icon = status.user.icon;
    NSLog(@"text=%@, name=%@, icon=%@", text, name, icon);
    
    // 4.打印status.retweetedStatus的属性
    NSString *text2 = status.retweetedStatus.text;
    NSString *name2 = status.retweetedStatus.user.name;
    NSString *icon2 = status.retweetedStatus.user.icon;
    NSLog(@"text2=%@, name2=%@, icon2=%@", text2, name2, icon2);
    
    
    NSLog(@"<---------------->");
    
    // 1.定义一个字典
    NSDictionary *d2 = @{
                         @"statuses" : @[
                                 @{
                                     @"text" : @"今天天气真不错！",
                                     
                                     @"user" : @{
                                             @"name" : @"Rose",
                                             @"icon" : @"nami.png"
                                             }
                                     },
                                 
                                 @{
                                     @"text" : @"明天去旅游了",
                                     
                                     @"user" : @{
                                             @"name" : @"Jack",
                                             @"icon" : @"lufy.png"
                                             }
                                     }
                                 ],
                         
                         @"ads" : @[
                                 @{
                                     @"image" : @"ad01.png",
                                     @"url" : @"http://www.ad01.com"
                                     },
                                 @{
                                     @"image" : @"ad02.png",
                                     @"url" : @"http://www.ad02.com"
                                     }
                                 ],
                         
                         @"totalNumber" : @"2014",
                         @"previousCursor" : @"13476589",
                         @"nextCursor" : @"13476599"
                         };
    
    // 2.将字典转为StatusResult模型
    StatusResult *result = [d2 toModel:[StatusResult class]];
    
    // 3.打印StatusResult模型的简单属性
    NSLog(@"totalNumber=%@, previousCursor=%lld, nextCursor=%lld", result.totalNumber, result.previousCursor, result.nextCursor);
    
    // 4.打印statuses数组中的模型属性
    for (Status *status in result.statuses) {
        NSString *text = status.text;
        NSString *name = status.user.name;
        NSString *icon = status.user.icon;
        NSLog(@"text=%@, name=%@, icon=%@", text, name, icon);
    }
    
    // 5.打印ads数组中的模型属性
    for (Ad *ad in result.ads) {
        NSLog(@"image=%@, url=%@", ad.image, ad.url);
    }
    
    NSLog(@"<---------------->");
    
    
    //------
    NSDictionary *d3 = @{
                         @"id" : @"20",
                         @"desciption" : @"好孩子",
                         @"name" : @{
                                 @"newName" : @"lufy",
                                 @"oldName" : @"kitty",
                                 @"info" : @{
                                         @"nameChangedTime" : @"2013-08-07"
                                         }
                                 },
                         @"other" : @{
                                 @"bag" : @{
                                         @"name" : @"小书包",
                                         @"price" : @100.7
                                         }
                                 }
                         };
    
    // 2.将字典转为Student模型
    Student *stu = [d3 toModel:[Student class]];
    
    // 3.打印Student模型的属性
    NSLog(@"ID=%@, desc=%@, oldName=%@, nowName=%@, nameChangedTime=%@",
          stu.ID, stu.desc, stu.oldName, stu.nowName, stu.nameChangedTime);
    NSLog(@"bagName=%@, bagPrice=%f",
          stu.bag.name, stu.bag.price);
    
    NSLog(@"<---------------->");
    
    NSArray *dictArray = @[
                           @{
                               @"name" : @"Jack",
                               @"icon" : @"lufy.png",
                               },
                           
                           @{
                               @"name" : @"Rose",
                               @"icon" : @"nami.png",
                               }
                           ];
    
    
    // 2.将字典数组转为User模型数组
    NSArray *userArray = [dictArray toModels:[User class]];
    
    // 3.打印userArray数组中的User模型属性
    for (User *user in userArray) {
        NSLog(@"name=%@, icon=%@", user.name, user.icon);
    }
    

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
