/**
 
 KGSearchView
 
 Created by: KG丿轩帝 on 2018/4/18
 
 Copyright (c) 2017 My Company
 
 ☆★☆★☆★☆★☆★☆★☆★☆★☆
 ★　　│　心想　│　事成　│　　★
 ☆别╭═╮　　 ╭═╮　　 ╭═╮别☆
 ★恋│人│　　│奎│　　│幸│恋★
 ☆　│氣│　　│哥│　　│福│　☆
 ★　│超│　　│制│　　│滿│　★
 ☆别│旺│　　│作│　　│滿│别☆
 ★恋│㊣│　　│㊣│　　│㊣│恋★
 ☆　╰═╯ 天天╰═╯ 開心╰═╯　☆
 ★☆★☆★☆★☆★☆★☆★☆★☆★.
 
 */

#import <UIKit/UIKit.h>

/**
 定制搜索框样式

 - UISearchBarNormal: 正常状态，只有不带其他效果，默认
 - UISearchBarCancel: 带有关闭按钮的搜索框
 - UISearchBarMark: 带有图书标签的搜索框
 - UISearchBarResult: 带有搜索结果标签的搜索框
 */
typedef NS_ENUM(NSInteger,SearchBarType){
    UISearchBarNormal = 0,
    UISearchBarCancel,
    UISearchBarMark,
    UISearchBarResult,
};

@interface KGSearchView : UIView
/**
 搜索框宽度(因为高度是固定不变的,注：宽度范围最大不能超过屏幕宽-12)
 */
@property (nonatomic,assign) CGFloat searchBarWidth;
/**
 设置搜索框的边框颜色
 */
@property (nonatomic,copy) UIColor *searchBarLayerColor;
/**
 设置搜索框圆角角度
 */
@property (nonatomic,assign) CGFloat searchBarcornerRadius;
/**
 搜索框，搜索图标
 */
@property (nonatomic,strong) UIImage *searchBarImage;
/**
 右侧清除按钮图标
 */
@property (nonatomic,strong) UIImage *searchBarClearImage;
/**
 搜索框光标颜色
 */
@property (nonatomic,copy) UIColor *searBarTintColor;
/**
 搜索框样式
 */
@property (nonatomic,assign) SearchBarType searchBartype;
/**
 搜索框，右侧按钮的标题(注：必须先设置UISearchBarCancel样式)
 */
@property (nonatomic,copy) NSString *searchTitle;
/**
 是否显示搜索框（默认是NO）
 */
@property (nonatomic,assign) BOOL isShow;
/**
 推荐标签数组
 */
@property (nonatomic,copy) NSArray *recommendArray;
/**
 初始化view，特别注意，给view设置frame的时候，view的起始坐标必须是坐标原点，否则会出现空白区域。

 @param frame view大小和父视图的位置
 @return 对象
 */
- (instancetype)initWithFrame:(CGRect)frame;

@end
