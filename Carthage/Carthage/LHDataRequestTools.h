//
//  LHDataRequestTools.h
//  LHDataRequestDemo
//
//  Created by 马鹏 on 16/4/26.
//  Copyright © 2016年 马鹏 All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LHDataRequestTools : NSObject

+ (void)postFetchDataWithUrlString:(NSString *)urlStr paramenters:(NSDictionary *)parameters success:(void(^)(id data))success fail:(void(^)())fail view:(UIView *)view;

+ (void)getFetchDataWithUrlString:(NSString *)urlStr paramenters:(NSDictionary *)paramenters success:(void(^)(id data))success fail:(void(^)())fail view:(UIView *)view;

@end
