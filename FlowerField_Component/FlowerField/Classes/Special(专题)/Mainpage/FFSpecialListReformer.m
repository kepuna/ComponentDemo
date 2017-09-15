//
//  FFSpecialReformer.m
//  FlowerField
//
//  Created by kepuna on 2017/9/5.
//  Copyright © 2017年 Triangle. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "FFSpecialListReformer.h"

@implementation FFSpecialListReformer

- (NSDictionary *)reformData:(NSDictionary *)originData {
    
    return originData ? @{
             kSpecialPropertyListKeyDesc:originData[@"desc"],
             kSpecialPropertyListKeyArticleID:originData[@"id"],
             kSpecialPropertyListKeyRead:[originData[@"read"] stringValue],
             kSpecialPropertyListKeyCommentNum:[originData[@"fnCommentNum"] stringValue],
             kSpecialPropertyListKeyFollowNum:[originData[@"favo"] stringValue],
             kSpecialPropertyListKeyShare:originData[@"share"],
             kSpecialPropertyListKeyPictureURL:[NSURL URLWithString:originData[@"smallIcon"]] ,
             kSpecialPropertyListKeyTitle:originData[@"title"],
             kSpecialPropertyListKeyCategoryName:originData[@"category"][@"name"],
             kAuthorReformer:originData[@"author"]
             } : nil;
}

@end
