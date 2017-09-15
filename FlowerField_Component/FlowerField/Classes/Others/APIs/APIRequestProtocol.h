//
//  APIRequestProtocol.h
//  FlowerField
//
//  Created by kepuna on 2017/9/7.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FFReformProtocol.h"

@protocol APIRequestProtocol <NSObject>

@required;
/// 请求的URL
- (NSString *)apiRequestURL;
/// 请求的参数
- (NSDictionary *)apiRequestParams;
/// 请求成功的数据加工
- (id)fetchDataWithReformer:(NSDictionary <FFReformProtocol>*)reformer;

@end
