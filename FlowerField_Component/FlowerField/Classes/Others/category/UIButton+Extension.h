//
//  UIButton+Extension.h
//  LifeLine
//
//  Created by 郑佳 on 16/4/11.
//  Copyright © 2016年 Triangle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

- (void)title:(NSString *)title titleColor:(UIColor *)titleColor image:(NSString *)image backgroundColor:(UIColor *)backgroundColor fontSize:(CGFloat)fontSize target:(id)target action:(SEL)action;

@end
