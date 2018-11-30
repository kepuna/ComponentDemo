//
//  APIResponseProtocol.h
//  FlowerField
//
//  Created by kepuna on 2017/9/7.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APIResponseProtocol <NSObject>

@optional;
/// 响应成功后的处理
- (void)apiResponseSuccess:(id<APIRequestProtocol>)request;
/// 响应失败后的处理
- (void)apiResponseFaild:(id<APIRequestProtocol>)request error:(NSError *)error;

@end
