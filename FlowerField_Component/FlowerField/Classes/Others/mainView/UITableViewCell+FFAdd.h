//
//  UITableViewCell+FFAdd.h
//  FlowerField
//
//  Created by kepuna on 2017/8/24.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFCellProtocol.h"

@interface UITableViewCell (FFAdd)

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, copy) NSDictionary *dataDict;
@property (nonatomic, weak) id<FFCellProtocol> delegate;

@end
