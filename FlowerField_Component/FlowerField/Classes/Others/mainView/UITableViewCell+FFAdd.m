//
//  UITableViewCell+FFAdd.m
//  FlowerField
//
//  Created by kepuna on 2017/8/24.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import "UITableViewCell+FFAdd.h"
#import <objc/runtime.h>

static char indexPathKey,dataDictKey,delegateKey;

@implementation UITableViewCell (FFAdd)

- (void)setIndexPath:(NSIndexPath *)indexPath {
    
    objc_setAssociatedObject(self, &indexPathKey, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSIndexPath *)indexPath {
    return objc_getAssociatedObject(self, &indexPathKey);
}

- (void)setDataDict:(NSDictionary *)dataDict {
     objc_setAssociatedObject(self, &dataDictKey, dataDict, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSDictionary *)dataDict {
    return objc_getAssociatedObject(self, &dataDictKey);
}

- (void)setDelegate:(id<FFCellProtocol>)delegate {
   objc_setAssociatedObject(self, &delegateKey, delegate, OBJC_ASSOCIATION_ASSIGN);
}

- (id<FFCellProtocol>)delegate {
    return objc_getAssociatedObject(self, &delegateKey);
}

@end
