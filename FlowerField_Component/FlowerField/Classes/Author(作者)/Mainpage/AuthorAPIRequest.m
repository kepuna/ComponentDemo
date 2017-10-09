//
//  AuthorAPIManager.m
//  FlowerField
//
//  Created by kepuna on 2017/9/6.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import "AuthorAPIRequest.h"
#import "FFAuthorListReformer.h"

@implementation AuthorAPIRequest

- (NSString *)apiRequestURL {
    return @"http://ec.htxq.net/servlet/SysArticleServlet?currentPageIndex=0&pageSize=10";
}

- (NSDictionary *)apiRequestParams {
    NSMutableDictionary *params = @{}.mutableCopy;
    params[@"action"] = @"topArticleAuthor";
    return  params.copy;
}

- (BOOL)isCache {
    return YES;
}

- (id)fetchDataWithReformer:(NSDictionary<FFReformProtocol> *)reformer {
    if (reformer == nil) {
        return nil;
    }
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSDictionary *dict in self.responseData[@"result"]) {
        NSDictionary *dataDict = [reformer reformData:dict];
        [tempArray addObject:dataDict];
    }
    return tempArray.copy;
}

@end
