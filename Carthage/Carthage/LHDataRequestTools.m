//
//  LHDataRequestTools.m
//  LHDataRequestDemo
//
//  Created by 马鹏 on 16/4/26.
//  Copyright © 2016年 马鹏 All rights reserved.
//

#import "LHDataRequestTools.h"
#import <AFNetworking/AFNetworking.h>
#import <MBProgressHUD/MBProgressHUD.h>

@implementation LHDataRequestTools

+ (void)postFetchDataWithUrlString:(NSString *)urlStr paramenters:(NSDictionary *)parameters success:(void(^)(id data))success fail:(void(^)())fail view:(UIView *)view {
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        MBProgressHUD *hud = nil;
        if (view) {
            
            hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        }
        if (status == AFNetworkReachabilityStatusUnknown || status == AFNetworkReachabilityStatusNotReachable) {
            
            hud.mode = MBProgressHUDModeText;
            hud.labelText = @"网络你要去哪儿?";
            [hud hide:YES afterDelay:2.0f];
        } else {
            
            hud.mode = MBProgressHUDModeIndeterminate;
            hud.labelText = @"正在努力加载中";
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            [manager POST:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                if (success) {
                    
                    [hud removeFromSuperview];
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                if (fail) {
                    
                    hud.labelText = @"数据请求失败";
                    [hud hide:YES afterDelay:2.0f];
                }
            }];
        }
    }];
}

+ (void)getFetchDataWithUrlString:(NSString *)urlStr paramenters:(NSDictionary *)paramenters success:(void(^)(id data))success fail:(void(^)())fail view:(UIView *)view {
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
       
        MBProgressHUD *hud = nil;
        if (view) {
            
            hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        }
        if (status == AFNetworkReachabilityStatusUnknown || status == AFNetworkReachabilityStatusNotReachable) {
            
            hud.mode = MBProgressHUDModeText;
            hud.labelText = @"网络你要去哪儿?";
            [hud hide:YES afterDelay:2.0f];
        } else {
            
            hud.mode = MBProgressHUDModeIndeterminate;
            hud.labelText = @"正在努力加载中";
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            [manager GET:urlStr parameters:paramenters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                if (success) {
                    
                    [hud removeFromSuperview];
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                if (fail) {
                    
                    hud.labelText = @"数据请求失败";
                    [hud hide:YES afterDelay:2.0f];
                }
            }];
        }
    }];
}


@end
