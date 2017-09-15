//
//  UIColor+Hex.h
//  LifeLine
//
//  Created by 郑佳 on 16/3/22.
//  Copyright © 2016年 Triangle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)


#ifndef UIColorHex
#define UIColorHex(_hex_) [UIColor colorWithHexString:((__bridge NSString *)CFSTR(#_hex_))]
#endif

+ (instancetype)colorWithHexString:(NSString *)hexStr ;

@end
