//
//  BaseRequest.m
//  ZJBaseProject
//
//  Created by 孑孓 on 2018/5/23.
//  Copyright © 2018年 孑孓. All rights reserved.
//

#import "BaseRequest.h"

@interface BaseRequest()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation BaseRequest

static BaseRequest *networkManager = nil;
/**
 *  单例
 *
 *  @return 网络请求类的实例，可在请求时直接调用方法，也是一个直接初始化的方式
 */
+ (instancetype)defaultManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!networkManager) {
            networkManager = [[BaseRequest alloc] init];
        }
    });
    return networkManager;
}

/**
 初始化，APP每次启动时会调用该方法，运行时不会调用
 
 @return 基本的请求设置
 */
- (instancetype)init {
    if (self = [super init]) {
        self.sessionManager = [AFHTTPSessionManager manager];
        // 设置请求以及相应的序列化器
        self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        // 设置超时时间
        self.sessionManager.requestSerializer.timeoutInterval = 10.0;
        // 设置响应内容的类型
        self.sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",nil];
    }
    return self;
}

#pragma mark 常用网络请求
- (nullable NSURLSessionDataTask *)sendRequestMethod:(HTTPMethod)requestMethod
                                           serverUrl:(nonnull NSString *)serverUrl
                                             apiPath:(nonnull NSString *)apiPath
                                          parameters:(nullable id)parameters
                                            progress:(nullable void (^)(NSProgress * _Nullable progress))progress
                                             success:(nullable void(^) (BOOL isSuccess, id _Nullable responseObject))success
                                             failure:(nullable void(^) (NSString * _Nullable errorMessage))failure {
    // 请求的地址
    NSString *requestPath = [serverUrl stringByAppendingPathComponent:apiPath];
    NSURLSessionDataTask * task = nil;
    switch (requestMethod) {
        case HTTPMethodGET:
        {
            task = [self.sessionManager GET:requestPath parameters:parameters progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(YES,responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure([self failHandleWithErrorResponse:error task:task]);
                }
            }];
        }
            break;
        case HTTPMethodPOST:
        {
            task = [self.sessionManager POST:requestPath parameters:parameters progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(YES,responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure([self failHandleWithErrorResponse:error task:task]);
                }
            }];
        }
            break;
            
        case HTTPMethodPUT:
        {
            task = [self.sessionManager PUT:requestPath parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(YES,responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure([self failHandleWithErrorResponse:error task:task]);
                }
            }];
        }
            break;
        case HTTPMethodPATCH:
        {
            task = [self.sessionManager PATCH:requestPath parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(YES,responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure([self failHandleWithErrorResponse:error task:task]);
                }
            }];
        }
            break;
            
        case HTTPMethodDELETE:
        {
            task = [self.sessionManager DELETE:requestPath parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(YES,responseObject);
                }            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    if (failure) {
                        failure([self failHandleWithErrorResponse:error task:task]);
                    }
                }];
        }
            break;
    }
    return task;
}

#pragma mark POST 上传图片
- (nullable NSURLSessionDataTask *)sendPOSTRequestWithserverUrl:(nonnull NSString *)serverUrl
                                                        apiPath:(nonnull NSString *)apiPath
                                                     parameters:(nullable id)parameters
                                                     imageArray:(NSArray *_Nullable)imageArray
                                                    targetWidth:(CGFloat )width
                                                       progress:(nullable void (^)(NSProgress * _Nullable progress))progress
                                                        success:(nullable void(^) (BOOL isSuccess, id _Nullable responseObject))success
                                                        failure:(nullable void(^) (NSString  *_Nullable error))failure {
    // 请求的地址
    NSString *requestPath = [serverUrl stringByAppendingPathComponent:apiPath];
    NSURLSessionDataTask * task = nil;
    task = [self.sessionManager POST:requestPath parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSUInteger i = 0 ;
        // 上传图片时，为了用户体验或是考虑到性能需要进行压缩
        for (UIImage * image in imageArray) {
            // 压缩图片，指定宽度（注释：imageCompressed：withdefineWidth：图片压缩的category）
//            UIImage *  resizedImage =  [UIImage imageCompressed:image withdefineWidth:width];
//            NSData * imgData = UIImageJPEGRepresentation(resizedImage, 0.5);
            // 拼接Data
//            [formData appendPartWithFileData:imgData name:[NSString stringWithFormat:@"picflie%ld",(long)i] fileName:@"image.png" mimeType:@" image/jpeg"];
            i++;
        }
        
    } progress:progress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success)success(YES,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) failure([self failHandleWithErrorResponse:error task:task]);
    }];
    return task;
}

#pragma mark 报错信息
/**
 @param error AFN返回的错误信息
 @param task 任务
 @return description
 */

- (NSString *)failHandleWithErrorResponse:( NSError * _Nullable )error task:( NSURLSessionDataTask * _Nullable )task {
    __block NSString *message = nil;
    // 这里可以直接设定错误反馈，也可以利用AFN 的error信息直接解析展示
    NSData *afNetworking_errorMsg = [error.userInfo objectForKey:AFNetworkingOperationFailingURLResponseDataErrorKey];
    LRLog(@"afNetworking_errorMsg == %@",[[NSString alloc]initWithData:afNetworking_errorMsg encoding:NSUTF8StringEncoding]);
    if (!afNetworking_errorMsg) {
        message = @"网络连接失败";
    }
    NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
    NSInteger responseStatue = response.statusCode;
    if (responseStatue >= 500) {  // 网络错误
        message = @"服务器维护升级中,请耐心等待";
    } else if (responseStatue >= 400) {
        // 错误信息
        NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:afNetworking_errorMsg options:NSJSONReadingAllowFragments error:nil];
        message = responseObject[@"error"];
    }
    LRLog(@"error == %@",error);
    return message;
}
@end
