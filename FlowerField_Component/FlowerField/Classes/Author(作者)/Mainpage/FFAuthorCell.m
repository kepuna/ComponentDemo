//
//  FFTopAuthorCell.m
//  FlowerField
//
//  Created by 郑佳 on 16/7/15.
//  Copyright © 2016年 Triangle. All rights reserved.
//

#import "FFAuthorCell.h"
#import "public.h"
#import "YYWebImage.h"
#import "FFAuthorListReformerKeys.h"

@interface FFAuthorCell ()

/// 作者
@property (nonatomic, strong) UILabel *authorLabel;
/// 头像
@property (nonatomic, strong) UIImageView *headImgView;
/// 认证
@property (nonatomic, strong) UIImageView *authImgView;
/// 擅长专题
@property (nonatomic, strong) UILabel *goodTopic;
/// 当前第几名
@property (nonatomic, strong) UILabel *sortLabel;
/// 底部的线
@property (nonatomic, strong) UIView *lineView;

@end

@implementation FFAuthorCell

#pragma mark - 'init' method
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
        [self setLayout];
        [self handleData];
    }
    return self;
}

#pragma mark - UI & Layout
- (void)setupUI{
    
    [self.contentView addSubview:self.headImgView];
    [self.contentView addSubview:self.authImgView];
    [self.contentView addSubview:self.authorLabel];
    [self.contentView addSubview:self.goodTopic];
    [self.contentView addSubview:self.sortLabel];
    [self.contentView addSubview:self.lineView];
}

- (void)setLayout{
    
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(FFCellMarginLeft * 2);
        make.centerY.equalTo(self.contentView);
        make.width.height.equalTo(@(FFHeaderImageHeight));
    }];
    
    [self.authImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@(FFAuthIconHeight));
        make.bottom.right.equalTo(self.headImgView);
    }];
    
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(FFCellMarginLeft);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.sortLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-FFCellMarginLeft * 2);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.goodTopic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(FFDescLabelLessMarginRight + FFCellMarginRight * 2);
        make.centerY.equalTo(self.authorLabel);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView.mas_bottom).offset(FFCellMarginTop);
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(FFCellLineHeight);
    }];
    
}

#pragma mark - handle data
- (void)handleData {
    
    @weakify(self)
    [RACObserve(self, dataDict) subscribeNext:^(NSDictionary *data) {
        @strongify(self)
        [self.headImgView yy_setImageWithURL:data[kAuthorPropertyListHeaderURL] placeholder:[UIImage imageNamed:@"pc_default_avatar"]];
        self.authorLabel.text = data[kAuthorPropertyListKeyName];
        if (data[kAuthorPropertyListKeyAuthIcon]) {
            self.authImgView.image = data[kAuthorPropertyListKeyAuthIcon];
        }
        self.authImgView.image = data[kAuthorPropertyListKeyAuthIcon];
        self.sortLabel.text = [NSString stringWithFormat:@"%zd",self.indexPath.row + 1];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
        [self.goodTopic addGestureRecognizer:tap];
        @weakify(self)
        [[tap rac_gestureSignal] subscribeNext:^(id x) {
            @strongify(self)
            if ([self.delegate respondsToSelector:@selector(cellGoodTopicDidClick:params:)]) {
                [self.delegate cellGoodTopicDidClick:self.indexPath params:nil];
            }
        }];;
    }];
}

#pragma mark - getter
- (UILabel *)authorLabel{
    if (_authorLabel == nil) {
        _authorLabel = [[UILabel alloc]init];
        [_authorLabel text:nil textColor:kHexColor_555 fontSize:FONT_SIZE_14 fontName:FONT_FAMILY_CODE_LIGHT];
    }
    return _authorLabel;
}

- (UIImageView *)headImgView{
    if (_headImgView == nil) {
        _headImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pc_default_avatar"]];
        _headImgView.layer.cornerRadius = FFHeaderImageHeight * 0.5;
        _headImgView.layer.masksToBounds = YES;
        _headImgView.layer.borderWidth = 0.5;
        _headImgView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _headImgView.userInteractionEnabled = YES;
    }
    return _headImgView;
}

#pragma mark - getter
- (UIImageView *)authImgView{
    if (_authImgView == nil) {
        _authImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"personAuth"]];
    }
    return _authImgView;
}

- (UILabel *)goodTopic {
    if (_goodTopic == nil) {
        _goodTopic = [[UILabel alloc] init];
        [_goodTopic text:@"[ 擅长话题 ]" textColor:kHexColor_c7a762 fontSize:FONT_SIZE_14 fontName:FONT_FAMILY_CODE_LIGHT];
        _goodTopic.userInteractionEnabled = YES;
    }
    return _goodTopic;
}

- (UILabel *)sortLabel{
    if (_sortLabel == nil) {
        _sortLabel = [[UILabel alloc]init];
        [_sortLabel text:nil textColor:kHexColor_000 fontSize:FONT_SIZE_25 fontName:FONT_FAMILY_CODE_LIGHT];
        
    }
    return _sortLabel;
}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = kHexColor_e1e4e8;
    }
    return _lineView;
}

@end
