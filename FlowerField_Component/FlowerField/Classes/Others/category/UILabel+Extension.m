//
//  UILabel+Extension.m
//  LifeLine
//
//  Created by 郑佳 on 16/4/11.
//  Copyright © 2016年 Triangle. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

- (void)textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize{
    self.font = [UIFont systemFontOfSize:fontSize];
    self.textColor = textColor;
    
}

- (void)textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment fontSize:(CGFloat)fontSize{
    [self textColor:textColor fontSize:fontSize];
    self.textAlignment = textAlignment;
}

- (void)text:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize{
    [self textColor:textColor fontSize:fontSize];
    self.text = text;
}

- (void)text:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize fontName:(NSString *)fontName{
    [self text:text textColor:textColor fontSize:fontSize];
    self.font = [UIFont fontWithName:fontName size:fontSize];
}

@end
