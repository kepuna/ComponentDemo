//
//  FFCellProtocol.h
//  FlowerField
//
//  Created by 郑佳 on 2017/9/10.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FFCellProtocol <NSObject>

@optional;
/// tableView中点击cell的代理
- (void)cellDidClick:(NSIndexPath *)indexPath params:(NSDictionary *)params;
/// cell上点击头像代理方法
- (void)cellHeaderIconDidClick:(NSIndexPath *)indexPath params:(NSDictionary *)params;
/// cell上点击“擅长换题”label的代理方法
- (void)cellGoodTopicDidClick:(NSIndexPath *)indexPath params:(NSDictionary *)params;

@end
