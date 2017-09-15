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
@property (nonatomic, copy) NSDictionary *originData;
/// 请求error对象
@property (nonatomic, strong) NSError *requestError;

@end
