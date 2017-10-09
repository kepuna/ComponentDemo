//
//  APIRequest.h
//  FlowerField
//
//  Created by kepuna on 2017/9/5.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIRequestProtocol.h"
#import "APIResponseProtocol.h"
#import "NetworkHelper.h"

@interface APIRequest : NSObject

/// reqeust对象
@property (nonatomic, weak) id<APIRequestProtocol> request;
/// response的代理对象
@property (nonatomic, weak) id<APIResponseProtocol> delegate;
/// 请求返回的原始数据
@property (nonatomic, copy) NSDictionary *responseData;
/// 请求返回error对象
@property (nonatomic, strong) NSError *responseError;
/// 请求的方式POST／GET
@property (nonatomic, strong) NSString *method;
/// 是否做缓存（默认是NO）
@property (nonatomic, assign) BOOL isCache;


@end
