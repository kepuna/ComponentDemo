//
//  BaseAPIRequest.m
//  FlowerField
//
//  Created by kepuna on 2017/9/5.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import "APIRequest.h"
#import "NetworkHelper.h"

@implementation APIRequest

- (instancetype)init {
    self = [super init];
    if ([self conformsToProtocol:@protocol(APIRequestProtocol)]) {
        
        self.request = (id<APIRequestProtocol>)self;
        [self apiRuquest];
    } else {
        // 不遵守这个protocol的就让他crash，防止派生类乱来。
        NSAssert(NO, @"子类必须要实现APIManager这个protocol。");
    }
    return self;
}

- (void)apiRuquest {
    
    [[NetworkHelper sharedInstance] POST:[self.request apiRequestURL] parameters:[self.request apiRequestParams] finishBlock:^(id data, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.originData  = data;
            self.requestError = error;
            if ([self.delegate respondsToSelector:@selector(apiResponseSuccess:)]) {
                [self.delegate apiResponseSuccess:self.request];
            }
        });
    }];

}

@end
