//
//  FFAuthorPropertyListReformer.m
//  FlowerField
//
//  Created by kepuna on 2017/9/1.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import "FFAuthorListReformer.h"
#import <UIKit/UIKit.h>

@implementation FFAuthorListReformer

- (NSDictionary *)reformData:(NSDictionary *)originData {
    
    return originData ? @{
              kAuthorPropertyListHeaderURL:[NSURL URLWithString:originData[@"headImg"]] ,
              kAuthorPropertyListKeyName:originData[@"userName"],
              kAuthorPropertyListKeyAuthIcon:[self authorAuthIcon:originData[@"newAuth"]]
              } : nil;
}

/// 作者认证的icon
- (UIImage *)authorAuthIcon:(NSNumber *)auth {
    switch ([auth integerValue]) {
        case 1:
            return [UIImage imageNamed:@"u_vip_yellow"];
        case 2:
            return [UIImage imageNamed:@"personAuth"];
        default:
            return [UIImage imageNamed:@"u_vip_blue"];
    }
}

@end
