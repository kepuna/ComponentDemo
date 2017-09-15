//
//  FFArticleBottomView.m
//  FlowerField
//
//  Created by 郑佳 on 16/7/14.
//  Copyright © 2016年 Triangle. All rights reserved.
//

#import "FFSpecialCellBottomView.h"
#import "public.h"

@implementation FFSpecialCellBottomView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
        [self setLayout];
    }
    return self;
}

- (void)setupUI{
    
    [self addSubview:self.readBtn];
    [self addSubview:self.commentBtn];
    [self addSubview:self.followBtn];
}

- (void)setLayout{
    
    [_commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-FFButtonTitleImageMargin);
        make.centerY.equalTo(self);
    }];
    
    [_followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_commentBtn.mas_left).offset(-FFButtonTitleImageMargin);
        make.centerY.equalTo(self);
    }];
    
    [_readBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_followBtn.mas_left).offset(-FFButtonTitleImageMargin);
        make.centerY.equalTo(self);
    }];
 
}

- (UIButton *)readBtn{
    if (_readBtn == nil) {
        _readBtn = [self createBtn:@"hp_count"];
    }
    return _readBtn;
}

- (UIButton *)commentBtn{
    if (_commentBtn == nil) {
        _commentBtn = [self createBtn:@"p_comment"];
    }
    return _commentBtn;
}

- (UIButton *)followBtn{
    if (_followBtn == nil) {
        _followBtn = [self createBtn:@"p_zan"];
    }
    return _followBtn;
}

- (UIButton *)createBtn:(NSString *)imageName{
   
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn title:nil titleColor:kHexColor_555 image:imageName backgroundColor:nil fontSize:FONT_SIZE_12 target:nil action:nil];
    [btn sizeToFit];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -FFButtonTitleImageMargin);
    return btn;
}

@end
