//
//  FFSpecialController.m
//  FlowerField
//
//  Created by 郑佳 on 16/7/13.
//  Copyright © 2016年 Triangle. All rights reserved.
//

#import "FFSpecialController.h"
#import "public.h"
#import "SpecialAPIRequest.h"
#import "FFSpecialListReformer.h"
/// view
#import "FFMainView.h"
#import "FFSpecialCell.h"
#import "FFAuthorDetailController.h"
#import "FFSpecialDetailController.h"

@interface FFSpecialController ()<APIResponseProtocol,FFCellProtocol>

@property (nonatomic, strong) FFMainView *mainView;
@property (nonatomic, strong) APIRequest *request;

@end

@implementation FFSpecialController

#pragma mark - lift cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mainView];
    [HUDTools zj_showLoadingInView:self.view];
    [self request];
}

#pragma mark -- CustomDelegate
- (void)apiResponseSuccess:(id<APIRequestProtocol>)request {
    [HUDTools zj_hideInView:self.view];
    
    NSArray *dataArray = [request fetchDataWithReformer:[[FFSpecialListReformer alloc] init]];
    [self.mainView configWithData:dataArray];
}

- (void)apiResponseFaild:(id<APIRequestProtocol>)request error:(NSError *)error {
    [HUDTools zj_hideInView:self.view];
    NSArray *dataArray = [request fetchDataWithReformer:[[FFSpecialListReformer alloc] init]];
    [self.mainView configWithData:dataArray];
}

- (void)cellHeaderIconDidClick:(NSIndexPath *)indexPath params:(NSDictionary *)params {
    UIViewController *controller = [[FFAuthorDetailController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)cellDidClick:(NSIndexPath *)indexPath params:(NSDictionary *)params {
    UIViewController *controller = [[FFSpecialDetailController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - getter
- (APIRequest *)request {
    if (_request == nil) {
        _request = [[SpecialAPIRequest alloc] init];
        _request.delegate = self;
    }
    return _request;
}

- (FFMainView *)mainView {
    if (_mainView == nil) {
        _mainView = [[FFMainView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
        _mainView.delegate = self;
        [_mainView registerCellClass:[FFSpecialCell class]];
    }
    return _mainView;
}


@end
