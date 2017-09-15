//
//  FFTableView.m
//  FlowerField
//
//  Created by kepuna on 2017/8/23.
//  Copyright © 2017年 Triangle. All rights reserved.
//

#import "FFMainView.h"
#import "UITableViewCell+FFAdd.h"

@interface FFMainView ()

@property (nonatomic, strong) Class cellClass;

@end

@implementation FFMainView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame]) {
        
        self.tableView = [[UITableView alloc] initWithFrame:frame style:style];
        [self addSubview:self.tableView];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 100;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.tableFooterView = [UIView new];
    }
    return self;
}

#pragma mark -- handle data
- (void)registerCellClass:(Class)cellClass {
    self.cellClass = cellClass;
    [self.tableView registerClass:cellClass forCellReuseIdentifier:[cellClass description]];
}

- (void)configWithData:(id)data {
    
    self.dataSource = data;
    [self.tableView reloadData];
}

#pragma mark -- UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self.cellClass description] forIndexPath:indexPath];
    cell.indexPath = indexPath;
    cell.delegate = self.delegate;
    if (self.dataSource.count) {
         cell.dataDict = self.dataSource[indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!self.dataSource.count) {
        return;
    }
    NSDictionary *cellDict = self.dataSource[indexPath.row];
    if ([self.delegate respondsToSelector:@selector(cellDidClick:params:)]) {
        [self.delegate cellDidClick:indexPath params:cellDict];
    }
}

#pragma mark -- getter
- (NSArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSArray array];
    }
    return _dataSource;
}

@end
