#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

///--------------
/// Basic setting
///--------------

/// page size
OBJC_EXTERN NSInteger kPageSize;
/// 字体样式
FOUNDATION_EXTERN NSString *FONT_FAMILY_CODE_LIGHT;
FOUNDATION_EXTERN NSString *FONT_FAMILY_CODE_BOLD;
// 文字大小
#define FONT_SIZE_25 25
#define FONT_SIZE_16 16
#define FONT_SIZE_14 14
#define FONT_SIZE_12 12
#define FONT_SIZE_10 10

/// 主页面的背景色
#define kMainPageColor UIColorHex(f6f6f6)
/// nav 的tint color
#define kNavBarTintColor UIColorHex(f8f8f8)
/// 专题cell作者、评论、点赞等文字的颜色
#define kHexColor_555 UIColorHex(555555)
/// 纯黑色
#define kHexColor_000 UIColorHex(000000)
#define kHexColor_c7a762 UIColorHex(c7a762)
/// 线的颜色
#define kHexColor_e1e4e8 UIColorHex(e1e4e8)

//------------
/// 首页专题模块
///-----------

/// 距离cell的top的间距
UIKIT_EXTERN CGFloat const FFCellMarginTop;
/// 距离cell的left的间距
UIKIT_EXTERN CGFloat const FFCellMarginLeft;
/// 距离cell的right的间距
UIKIT_EXTERN CGFloat const FFCellMarginRight;
/// cell的内边距
UIKIT_EXTERN CGFloat const FFCellInsetMargin;
/// cell中线条height
UIKIT_EXTERN CGFloat const FFCellLineHeight;
/// button按钮文体和图标间的距离
UIKIT_EXTERN CGFloat const FFButtonTitleImageMargin;
/// 专题cell中FFArticleBottomView的height
UIKIT_EXTERN CGFloat const FFArticleBottomViewHeight;
/// 专题cell中pictureView高
UIKIT_EXTERN CGFloat const FFPictureViewHeight;
/// 专题cell中用户头像的宽高
UIKIT_EXTERN CGFloat const FFHeaderImageHeight;
/// 专题cell中认证图标的大小
UIKIT_EXTERN CGFloat const FFAuthIconHeight;
/// 专题cell中descLabel的height
UIKIT_EXTERN CGFloat const FFDescLabelHeight;
/// 专题cell中descLabel距离右边距
UIKIT_EXTERN CGFloat const FFDescLabelLessMarginRight;
/// FFSpecialCellBottomView视图的height
UIKIT_EXTERN CGFloat const FFSpecialCellBottomViewHeight;


 

