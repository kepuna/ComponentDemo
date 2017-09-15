//
//  FFTableView.h
//  FlowerField
//
//  Created by kepuna on 2017/8/23.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFCellProtocol.h"

@interface FFMainView : UIView <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, weak) id<FFCellProtocol> delegate;

/// init method
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;
/// class for 'cell'
- (void)registerCellClass:(Class)cellClass;
/// config 'view' with 'data'
- (void)configWithData:(id)data;

@end
