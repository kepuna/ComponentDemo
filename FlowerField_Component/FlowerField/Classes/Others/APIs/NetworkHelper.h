//
//  NetworkHelper.h
//  FlowerField
//
//  Created by 郑佳 on 2017/8/20.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkHelper : NSObject

+ (instancetype)sharedInstance;

- (void)GET:(NSString *)URLString parameters:(id)parameters finishBlock:(void (^)(id data, NSError *error))finishBlock;

- (void)POST:(NSString *)URLString parameters:(id)parameters finishBlock:(void (^)(id data, NSError *error))finishBlock;

@end
