//
//  BaseNetworking.m
//  TRProject
//
//  Created by tarena on 16/7/13.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "BaseNetworking.h"

@implementation BaseNetworking
+ (id)GET:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void (^)(id, NSError *))completionHandler{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:kBasePath.yx_URL];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    return [manager GET:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", task.currentRequest.URL.absoluteString);
        //做缓存
        NSString *cachePath = [docPath stringByAppendingPathComponent:task.currentRequest.URL.absoluteString.md5String];
        [[NSOperationQueue new] addOperationWithBlock:^{
            [NSKeyedArchiver archiveRootObject:responseObject toFile:cachePath];
        }];
        !completionHandler?:completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", task.currentRequest.URL.absoluteString);
        NSLog(@"%@", error);
        [[NSOperationQueue new] addOperationWithBlock:^{
            //读缓存
            NSString *cachePath = [docPath stringByAppendingPathComponent:task.currentRequest.URL.absoluteString.md5String];
            id responseObj = [NSKeyedUnarchiver unarchiveObjectWithFile:cachePath];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                if (responseObj) {
                    !completionHandler ?: completionHandler(responseObj, nil);
                }else{
                    !completionHandler ?: completionHandler(nil, error);
                }
            }];
        }];
        
    }];
    
}

+ (id)POST:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void (^)(id, NSError *))completionHandler{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:kBasePath.yx_URL];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    
    //拼接参数
    NSMutableDictionary *param = [NSMutableDictionary new];
    //特殊传入的参数
    [param addEntriesFromDictionary:parameters];
    //共同的参数
    [param addEntriesFromDictionary:[self commonParams]];
    
    return [manager POST:path parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", task.currentRequest.URL.absoluteString);
        !completionHandler?:completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", task.currentRequest.URL.absoluteString);
        NSLog(@"%@", error);
        !completionHandler ?: completionHandler(nil, error);
    }];
}


+ (NSMutableDictionary *)commonParams{
    NSMutableDictionary *paramDic = [NSMutableDictionary new];
    
    //经纬度字符串
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *coordinateStr = [NSString stringWithFormat:@"%f,%f",[userDefaults doubleForKey:kCurrentLongitudeKey], [userDefaults doubleForKey:kCurrentLatitudeKey]];
    //    NSLog(@"%@", coordinateStr);
    //为了不同地区的人都能用, 用假经纬度
    coordinateStr = @"116.469235297309,39.88134792751736";
    
    //当前时间, stringWithFormat是YYKit提供的日期便捷格式化方法
    NSString *timeStr = [[NSDate date] stringWithFormat:@"YYYY-MM-dd HH:mm:ss"];
    //    NSLog(@"%@", timeStr);
    
    //屏幕尺寸
    CGSize size = [UIScreen mainScreen].bounds.size;
    NSString *sizeStr = [NSString stringWithFormat:@"%.0f*%.0f", size.width, size.height];
    
    [paramDic setObject:@"110100" forKey:@"_cityid"];
    [paramDic setObject:@"1A3FAB1E-0FF5-471D-AE0F-4ED1E5B55DF3" forKey:@"_device"];
    [paramDic setObject:@"91577D73-DDF9-4151-BB86-AA3596963582" forKey:@"_idfa"];
    [paramDic setObject:[UIDevice currentDevice].systemVersion forKey:@"_osversion"];
    [paramDic setObject:@"iOS" forKey:@"_platform"];
    [paramDic setObject:sizeStr forKey:@"_screen"];
    [paramDic setObject:timeStr forKey:@"_time"];
    [paramDic setObject:@"2.9.6" forKey:@"_version"];
    [paramDic setObject:coordinateStr forKey:@"coordinate"];
    [paramDic setObject:@"0" forKey:@"type"];
    [paramDic setObject:coordinateStr forKey:@"user_coordinate"];
    
    //key不带下划线前缀的_
    [paramDic setObject:@"110100" forKey:@"cityid"];
    [paramDic setObject:@"1A3FAB1E-0FF5-471D-AE0F-4ED1E5B55DF3" forKey:@"device"];
    [paramDic setObject:@"91577D73-DDF9-4151-BB86-AA3596963582" forKey:@"idfa"];
    [paramDic setObject:[UIDevice currentDevice].systemVersion forKey:@"osversion"];
    [paramDic setObject:@"iOS" forKey:@"platform"];
    [paramDic setObject:sizeStr forKey:@"screen"];
    [paramDic setObject:timeStr forKey:@"time"];
    [paramDic setObject:@"2.9.6" forKey:@"version"];
    return paramDic;
}

@end











