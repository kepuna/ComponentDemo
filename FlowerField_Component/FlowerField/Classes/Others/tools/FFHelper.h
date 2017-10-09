//
//  FFHelper.h
//  FlowerField
//
//  Created by kepuna on 2017/10/3.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFHelper : NSObject


/**
 将传递进来的参数拼接成url

 @param baseUrl
 @param params
 @return 完整url
 */
+ (NSString *)connectBaseUrl:(NSString *)baseUrl params:(NSMutableDictionary *)params;

@end
