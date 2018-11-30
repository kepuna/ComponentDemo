//
//  FFTopAuthorController.m
//  FlowerField
//
//  Created by 郑佳 on 16/7/15.
//  Copyright © 2016年 Triangle. All rights reserved.
//

#import "FFAuthorController.h"
#import "public.h"
#import "AuthorAPIRequest.h"
#import "FFAuthorListReformer.h"
// view
#import "FFMainView.h"
#import "FFAuthorCell.h"
// controller
#import "FFAuthorDetailController.h"
#import "FFSpecialDetailController.h"

@interface FFAuthorController ()<APIResponseProtocol,FFCellProtocol>

@property (nonatomic, strong) FFMainView *mainView;
@property (nonatomic, strong) APIRequest *request;

@end

@implementation FFAuthorController

#pragma mark - lift cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mainView];
    [self.mainView registerCellClass:[FFAuthorCell class]];
    
    [HUDTools zj_showLoadingInView:self.view];
    [self request];
}

#pragma mark -- CustomDelegate
- (void)apiResponseSuccess:(id<APIRequestProtocol>)request {
    [HUDTools zj_hideInView:self.view];
    NSArray *dataArray = [request fetchDataWithReformer:[[FFAuthorListReformer alloc] init]];
    [self.mainView configWithData:dataArray];
}

- (void)apiResponseFaild:(id<APIRequestProtocol>)request error:(NSError *)error {
    [HUDTools zj_hideInView:self.view];
    NSArray *dataArray = [request fetchDataWithReformer:[[FFAuthorListReformer alloc] init]];
    [self.mainView configWithData:dataArray];
}

- (void)cellDidClick:(NSIndexPath *)indexPath params:(NSDictionary *)params {
    UIViewController *controller = [[FFAuthorDetailController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)cellGoodTopicDidClick:(NSIndexPath *)indexPath params:(NSDictionary *)params {
    UIViewController *controller = [[FFSpecialDetailController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - getter
- (APIRequest *)request {
    if (_request == nil) {
        _request = [[AuthorAPIRequest alloc] init];
        _request.delegate = self;
    }
    return _request;
}

- (FFMainView *)mainView {
    if (_mainView == nil) {
        _mainView = [[FFMainView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
        _mainView.delegate = self;
    }
    return _mainView;
}

@end
