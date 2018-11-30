//
//  FFArticleCell.m
//  FlowerField
//
//  Created by 郑佳 on 16/7/14.
//  Copyright © 2016年 Triangle. All rights reserved.
//

#import "FFSpecialCell.h"
#import "public.h"
#import "FFSpecialCellBottomView.h"
#import "FFSpecialListReformerKeys.h"
#import "FFAuthorListReformerKeys.h"
#import "FFAuthorListReformer.h"

@interface FFSpecialCell ()

/// 背景视图
@property (nonatomic, strong) UIView *backView;
/// 图片
@property (nonatomic, strong) UIImageView *pictureView;
/// 作者
@property (nonatomic, strong) UILabel *authorLabel;
/// 标志作者是：花艺设计师、作家等类型
@property (nonatomic, strong) UILabel *identityLabel;
/// 头像
@property (nonatomic, strong) UIImageView *headImgView;
/// 认证图标
@property (nonatomic, strong) UIImageView *authImgView;
/// 分类
@property (nonatomic, strong) UILabel *categoryLabel;
/// 标题
@property (nonatomic, strong) UILabel *titleLabel;
/// 描述
@property (nonatomic, strong) UILabel *descLabel;
/// 线条
@property (nonatomic, strong) UIImageView *underlineImgView;
/// 底部的视图
@property (nonatomic, strong) FFSpecialCellBottomView *bottomView;

@end

@implementation FFSpecialCell

#pragma mark - 'init' method
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = kMainPageColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
        [self setLayout];
        [self handleData];
    }
    return self;
}

#pragma mark - UI & Layout
- (void)setupUI{
    
    [self.contentView addSubview:self.backView];
    [self.backView addSubview:self.pictureView];
    [self.backView addSubview:self.authorLabel];
    [self.backView addSubview:self.headImgView];
    [self.backView addSubview:self.authImgView];
    [self.backView addSubview:self.identityLabel];
    [self.backView addSubview:self.categoryLabel];
    [self.backView addSubview:self.titleLabel];
    [self.backView addSubview:self.descLabel];
    [self.backView addSubview:self.underlineImgView];
    [self.backView addSubview:self.bottomView];
}

- (void)setLayout{
    
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(FFCellInsetMargin);
        make.right.equalTo(self.contentView).offset(-FFCellInsetMargin);
        make.bottom.equalTo(self.contentView);
    }];
    
    [_pictureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.backView);
        make.height.mas_equalTo(FFPictureViewHeight);
    }];

    [_headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.sizeOffset(CGSizeMake(FFHeaderImageHeight,FFHeaderImageHeight));
        make.right.equalTo(self.backView).offset(FFCellMarginRight);
        make.top.equalTo(_pictureView.mas_bottom).offset(FFCellMarginRight);
    }];

    [_authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_headImgView.mas_left).offset(FFCellMarginRight);
        make.top.equalTo(_pictureView.mas_bottom).offset(FFCellInsetMargin);
        make.height.mas_offset(FONT_SIZE_14);
    }];

    [_identityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_authorLabel);
        make.top.equalTo(_authorLabel.mas_bottom).offset(FFCellMarginTop);
    }];

    [_authImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@(FFAuthIconHeight));
        make.bottom.right.equalTo(_headImgView);
    }];

    [_categoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).offset(FFCellMarginLeft);
        make.top.equalTo(_headImgView.mas_bottom);
        make.height.mas_equalTo(FONT_SIZE_14);
    }];

    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_categoryLabel);
        make.top.equalTo((_categoryLabel.mas_bottom)).offset(FFCellMarginTop);
        make.right.equalTo(self.backView);
        make.height.mas_equalTo(FONT_SIZE_14);
    }];

    [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLabel);
        make.top.equalTo(_titleLabel.mas_bottom).offset(FFCellMarginTop);
        make.width.lessThanOrEqualTo(self.backView).offset(FFDescLabelLessMarginRight);
        make.height.mas_equalTo(FFDescLabelHeight);
    }];

    [_underlineImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_descLabel.mas_bottom).offset(FFCellMarginTop);
        make.left.equalTo(_descLabel).offset(FFCellMarginTop);
        make.right.equalTo(_headImgView);
        make.height.mas_equalTo(FFCellLineHeight);
    }];

    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_underlineImgView.mas_bottom).offset(FFCellMarginTop);
        make.left.right.bottom.equalTo(self.backView);
        make.height.mas_equalTo(FFSpecialCellBottomViewHeight);
    }];
}

#pragma mark - handle data
- (void)handleData {
    
    @weakify(self)
    [RACObserve(self, dataDict) subscribeNext:^(NSDictionary *data) {
        @strongify(self)
    
        FFAuthorListReformer *reformer = [[FFAuthorListReformer alloc] init];
        NSDictionary *author = [reformer reformData:data[kAuthorReformer]];
        [self.pictureView yy_setImageWithURL:data[kSpecialPropertyListKeyPictureURL] placeholder:[UIImage imageNamed:@"placehodler"]];
        [self.headImgView yy_setImageWithURL:author[kAuthorPropertyListHeaderURL] placeholder:[UIImage imageNamed:@"pc_default_avatar"]];
        self.identityLabel.text = data[kSpecialPropertyListKeyAuthorIdentity];
        self.categoryLabel.text = data[kSpecialPropertyListKeyCategoryName];
        self.authorLabel.text = author[kAuthorPropertyListKeyName];
        self.titleLabel.text = data[kSpecialPropertyListKeyTitle];
        self.descLabel.text = data[kSpecialPropertyListKeyDesc];
        if (author[kAuthorPropertyListKeyAuthIcon]) {
            self.authImgView.image = author[kAuthorPropertyListKeyAuthIcon];
        }
        [self.bottomView.readBtn setTitle:data[kSpecialPropertyListKeyRead] forState:UIControlStateNormal];
        [self.bottomView.followBtn setTitle:data[kSpecialPropertyListKeyFollowNum] forState:UIControlStateNormal];
        [self.bottomView.commentBtn setTitle:data[kSpecialPropertyListKeyCommentNum] forState:UIControlStateNormal];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
        [self.headImgView addGestureRecognizer:tap];
        @weakify(self)
        [[tap rac_gestureSignal] subscribeNext:^(id x) {
            @strongify(self)
            if ([self.delegate respondsToSelector:@selector(cellHeaderIconDidClick:params:)]) {
                [self.delegate cellHeaderIconDidClick:self.indexPath params:nil];
            }
        }];;
    }];
    
}

#pragma mark - getter
- (UIView *)backView {
    if (_backView == nil) {
        _backView = [[UIView alloc]init];
        _backView.backgroundColor = [UIColor whiteColor];
    }
    return _backView;
}

- (UIImageView *)pictureView{
    if (_pictureView == nil) {
        _pictureView = [[UIImageView alloc]init];
        _pictureView.contentMode = UIViewContentModeScaleAspectFill;
        _pictureView.clipsToBounds = YES;
    }
    return _pictureView;
}

- (UILabel *)authorLabel{
    if (_authorLabel == nil) {
        _authorLabel = [[UILabel alloc]init];
        _authorLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [_authorLabel text:nil textColor:kHexColor_555 fontSize:FONT_SIZE_14 fontName:FONT_FAMILY_CODE_LIGHT];
    }
    return _authorLabel;
}

- (UILabel *)identityLabel{
    if (_identityLabel == nil) {
        _identityLabel = [[UILabel alloc]init];
        [_identityLabel text:nil textColor:nil fontSize:FONT_SIZE_12 fontName:FONT_FAMILY_CODE_LIGHT];
        _identityLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.9];
    }
    return _identityLabel;
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

- (UIImageView *)authImgView{
    if (_authImgView == nil) {
        _authImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"personAuth"]];
    }
    return _authImgView;
}

- (UILabel *)categoryLabel{
    if (_categoryLabel == nil) {
        _categoryLabel = [[UILabel alloc]init];
        [_categoryLabel text:nil textColor:kHexColor_c7a762 fontSize:FONT_SIZE_14 fontName:FONT_FAMILY_CODE_LIGHT];
    }
    return _categoryLabel;
}

- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel text:nil textColor:kHexColor_555 fontSize:FONT_SIZE_14 fontName:FONT_FAMILY_CODE_LIGHT];
    }
    return _titleLabel;
}

- (UILabel *)descLabel{
    if (_descLabel == nil) {
        _descLabel = [[UILabel alloc]init];
        [_descLabel text:nil textColor:kHexColor_555 fontSize:FONT_SIZE_12 fontName:FONT_FAMILY_CODE_LIGHT];
        _descLabel.numberOfLines = 2;
    }
    return _descLabel;
}

- (UIImageView *)underlineImgView{
    if (_underlineImgView == nil) {
        _underlineImgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"underLine"]];
        _underlineImgView.backgroundColor = [UIColor greenColor];
    }
    return _underlineImgView;
}

- (FFSpecialCellBottomView *)bottomView{
    if(_bottomView == nil){
        _bottomView = [[FFSpecialCellBottomView alloc]init];
    }
    return _bottomView;
}

@end
