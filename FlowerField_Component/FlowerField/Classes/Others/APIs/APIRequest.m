//
//  BaseAPIRequest.m
//  FlowerField
//
//  Created by kepuna on 2017/9/5.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import "APIRequest.h"
#import "DBManager.h"
#import "FFHelper.h"

@implementation APIRequest

- (instancetype)init {
    self = [super init];
    if ([self conformsToProtocol:@protocol(APIRequestProtocol)]) {
        
        self.request = (id<APIRequestProtocol>)self;
        self.method = POST;
        [self apiRuquest];
    } else {
        // 不遵守这个protocol的就让他crash，防止派生类乱来。
        NSAssert(NO, @"子类必须要实现APIManager这个protocol");
    }
    return self;
}

- (void)apiRuquest {
    
    NSString *url = [self.request apiRequestURL];
    NSDictionary *params = [self.request apiRequestParams];
    NSString *cacheKey = [FFHelper connectBaseUrl:url params:params.mutableCopy];
    
    [[NetworkHelper sharedInstance] requestMethod:self.method url:url parameters:params finishBlock:^(id data, NSError *error) {
        if (error) {
            NSDictionary *cacheData = [[DBManager sharedManager] itemWithCacheKey:cacheKey];
            if (!cacheData) {
                self.responseError = error;
                if ([self.delegate respondsToSelector:@selector(apiResponseFaild:error:)]) {
                    [self.delegate apiResponseFaild:self.request error:error];
                }
                return;
            }
            [self successCallBack:cacheData];
            return;
        }
        [self successCallBack:data];
        if (self.isCache) {
             [[DBManager sharedManager] insertItem:data cacheKey:cacheKey];
        }
    }];
}

- (void)successCallBack:(NSDictionary *)data {
    self.responseData  = data;
    if ([self.delegate respondsToSelector:@selector(apiResponseSuccess:)]) {
        [self.delegate apiResponseSuccess:self.request];
    }
}

@end
