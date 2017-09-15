//
//  public.h
//  iLife
//
//  Created by 郑佳 on 16/1/22.
//  Copyright © 2016年 Triangle. All rights reserved.
//


#ifdef __OBJC__

#ifdef DEBUG
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NSLog(...)
#endif

#endif


#ifndef public_h
#define public_h

#import "FFConst.h"
#import "HUDTools.h"
#import "UILabel+Extension.h"
#import "UIColor+Hex.h"
#import "UIButton+Extension.h"
#import "UIView+FFFrame.h"
#import "UITableViewCell+FFAdd.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Masonry/Masonry.h>
#import <YYWebImage/YYWebImage.h>

#endif /* public_h */
