//
//  HUDTools.h
//  CityLife
//
//  Created by 郑佳 on 16/1/21.
//  Copyright © 2016年 Triangle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HUDTools : NSObject


+ (void)zj_showLoadingInView:(UIView *)view;
+ (void)zj_showLoadingInView:(UIView *)view title:(NSString *)title;
+ (void)zj_showErrorStatusInView:(UIView *)view title:(NSString *)title;
+ (void)zj_showSuccessStatusInView:(UIView *)view title:(NSString *)title;
+ (void)zj_hideInView:(UIView *)view;

@end
