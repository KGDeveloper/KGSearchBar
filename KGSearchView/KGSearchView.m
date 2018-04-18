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

#import "KGSearchView.h"
#import "KGSearchBarTableViewCell.h"
/**
 获取屏幕宽
 */
#define KGScreenWidth [UIScreen mainScreen].bounds.size.width
/**
 获取屏幕高
 */
#define KGScreenHeight [UIScreen mainScreen].bounds.size.height
/**
 获取导航栏高度
 */
#define KGNavHeight (KGScreenHeight == 812.0 ? 88.0 : 64.0)
/**
 获取起点X坐标
 */
#define KGViewX(view) view.frame.origin.x
/**
 获取起点Y坐标
 */
#define KGViewY(view) view.frame.origin.y
/**
 获取view的宽度
 */
#define KGViewWidth(view) view.frame.size.width
/**
 获取view的高度
 */
#define KGViewHeight(view) view.frame.size.height

@interface KGSearchView()
<UISearchBarDelegate,
UITableViewDelegate,
UITableViewDataSource,
KGSearchBarTableViewCellDelegate>
/**
 搜素框
 */
@property (nonatomic,strong) UISearchBar *searchBar;
/**
 模拟导航栏底部line
 */
@property (nonatomic,strong) UIView *line;
/**
 推荐标签加载视图
 */
@property (nonatomic,strong) UIView *recommendView;
/**
 搜索历史
 */
@property (nonatomic,strong) UITableView *historyView;
/**
 热门搜索
 */
@property (nonatomic,strong) UILabel *hotLabel;
/**
 最近搜索
 */
@property (nonatomic,strong) UILabel *nowLabel;
/**
 保存搜索记录
 */
@property (nonatomic,strong) NSMutableArray *dataArr;

@end

@implementation KGSearchView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.dataArr = [NSMutableArray array];
        self.searchBar.frame = CGRectMake(6,
                                          KGNavHeight - 44 + 4,
                                          KGScreenWidth - 12,
                                          36);
        self.line.backgroundColor = [UIColor colorWithRed:177/255.0 green:177/255.0 blue:177/255.0 alpha:1];
    }
    return self;
}
//MARK:初始化搜索框
/**
 初始化搜索框

 @return 搜索框
 */
- (UISearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc]init];
        _searchBar.backgroundImage = [[UIImage alloc]init];
        _searchBar.barTintColor = [UIColor whiteColor];
        _searchBar.delegate = self;
        UITextField *searchT = [_searchBar valueForKey:@"searchField"];
        searchT.placeholder = @"搜素";
        searchT.backgroundColor = [UIColor whiteColor];
        searchT.layer.cornerRadius = 16.0f;
        searchT.layer.borderColor = [UIColor redColor].CGColor;
        searchT.layer.borderWidth = 1.0f;
        searchT.layer.masksToBounds = YES;
        [self addSubview:_searchBar];
    }
    return _searchBar;
}
/**
 设置搜索框边框颜色

 @param searchBarLayerColor UIcolor类型
 */
- (void)setSearchBarLayerColor:(UIColor *)searchBarLayerColor{
    _searchBarLayerColor = searchBarLayerColor;
    UITextField *searchT = [_searchBar valueForKey:@"searchField"];
    searchT.layer.borderColor = searchBarLayerColor.CGColor;
}
/**
 设置搜索框大小

 @param searchBarWidth 搜索框宽度
 */
- (void)setSearchBarWidth:(CGFloat)searchBarWidth{
    _searchBarWidth = searchBarWidth;
    self.searchBar.frame = CGRectMake(KGViewX(self.searchBar),
                                      KGViewY(self.searchBar),
                                      searchBarWidth,
                                      KGViewHeight(self.searchBar));
}
/**
 设置搜索框的圆角角度

 @param searchBarcornerRadius 圆角角度cgfloat类型
 */
- (void)setSearchBarcornerRadius:(CGFloat)searchBarcornerRadius{
    _searchBarcornerRadius = searchBarcornerRadius;
    UITextField *searchT = [_searchBar valueForKey:@"searchField"];
    searchT.layer.cornerRadius = searchBarcornerRadius;
}
/**
 自定义搜索框搜索图标

 @param searchBarImage 搜索图标
 */
- (void)setSearchBarImage:(UIImage *)searchBarImage{
    _searchBarImage = searchBarImage;
    [self.searchBar setImage:searchBarImage
            forSearchBarIcon:UISearchBarIconSearch
                       state:UIControlStateNormal];
}
/**
 自定义右侧清除输入按钮图片

 @param searchBarClearImage 清除图标
 */
- (void)setSearchBarClearImage:(UIImage *)searchBarClearImage{
    _searchBarClearImage = searchBarClearImage;
    [self.searchBar setImage:searchBarClearImage
            forSearchBarIcon:UISearchBarIconClear
                       state:UIControlStateNormal];
    [self.searchBar setPositionAdjustment:UIOffsetMake(-10, 0)
                         forSearchBarIcon:UISearchBarIconClear];
}
/**
 搜索框关闭按钮

 @param searchBar 关闭按钮
 */
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self.searchBar resignFirstResponder];
    self.hidden = YES;
}
/**
 搜索框光标颜色

 @param searBarTintColor 光标颜色
 */
- (void)setSearBarTintColor:(UIColor *)searBarTintColor{
    _searBarTintColor = searBarTintColor;
    self.searchBar.tintColor = searBarTintColor;
}
/**
 设置搜索框样式

 @param searchBartype 搜索框样式
 */
- (void)setSearchBartype:(SearchBarType)searchBartype{
    _searchBartype = searchBartype;
    switch (searchBartype) {
        case UISearchBarNormal:
            
            break;
        case UISearchBarMark:
            self.searchBar.showsBookmarkButton = YES;
            break;
        case UISearchBarCancel:
            self.searchBar.showsCancelButton = YES;
            break;
        default:
            self.searchBar.showsSearchResultsButton = YES;
            break;
    }
}
/**
 设置关闭按钮标题

 @param searchTitle 标题
 */
- (void)setSearchTitle:(NSString *)searchTitle{
    for (UIView *obj in self.searchBar.subviews.lastObject.subviews) {
        if ([obj isKindOfClass:NSClassFromString(@"UINavigationButton")]) {
            UIButton *cancel = (UIButton *)obj;
            [cancel setTitle:searchTitle
                    forState:UIControlStateNormal];
        }
    }
}
/**
 是否显示搜索框

 @param isShow 是否显示
 */
- (void)setIsShow:(BOOL)isShow{
    _isShow = isShow;
    if (isShow == YES) {
        [self.searchBar becomeFirstResponder];
        self.hidden = NO;
    }else{
        [self.searchBar resignFirstResponder];
        self.hidden = YES;
    }
}
//MARK:创建推荐模块
- (UIView *)line{
    if (!_line) {
        _line = [[UIView alloc]initWithFrame:CGRectMake(0, KGNavHeight, KGViewWidth(self), 1)];
        [self addSubview:_line];
    }
    return _line;
}
- (UIView *)recommendView{
    if (!_recommendView) {
        _recommendView = [[UIView alloc]initWithFrame:CGRectMake(0, KGNavHeight + 1, KGViewWidth(self), 200)];
        [self addSubview:_recommendView];
    }
    return _recommendView;
}
- (UILabel *)hotLabel{
    if (!_hotLabel) {
        _hotLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, KGViewWidth(self.recommendView) - 20, 30)];
        _hotLabel.font = [UIFont systemFontOfSize:17];
        [self.recommendView addSubview:_hotLabel];
    }
    return _hotLabel;
}
- (UILabel *)nowLabel{
    if (!_nowLabel) {
        _nowLabel = [[UILabel alloc]init];
        _nowLabel.text = @"最近搜索";
        _nowLabel.font = [UIFont systemFontOfSize:17];
        [self addSubview:_nowLabel];
    }
    return _nowLabel;
}
- (void)setRecommendArray:(NSArray *)recommendArray{
    _recommendArray = recommendArray;
    
    self.hotLabel.text = @"热门搜索";
    
    CGFloat x = 10;
    CGFloat y = 50;
    for (int i = 0; i < recommendArray.count; i++) {
        if (x + [self resultWidthFromString:recommendArray[i]] + 30 >= KGViewWidth(self)) {
            x = 10;
            y = y + 40;
        }
        UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(x, y, [self resultWidthFromString:recommendArray[i]] + 20, 30)];
        text.textColor = [UIColor redColor];
        text.text = recommendArray[i];
        text.font = [UIFont systemFontOfSize:13];
        text.textAlignment = NSTextAlignmentCenter;
        text.layer.cornerRadius = 15;
        text.layer.borderColor = [UIColor redColor].CGColor;
        text.layer.borderWidth = 1;
        text.layer.masksToBounds = YES;
        [self.recommendView addSubview:text];
        
        x = x + [self resultWidthFromString:recommendArray[i]] + 30;
    }
    self.recommendView.frame = CGRectMake(KGViewX(self.recommendView),
                                          KGViewY(self.recommendView),
                                          KGViewWidth(self.recommendView),
                                          y + 50);
    self.nowLabel.frame = CGRectMake(10,
                                     KGViewY(self.recommendView) + KGViewHeight(self.recommendView),
                                     KGViewWidth(self) - 20,
                                     30);
    self.historyView.frame = CGRectMake(0,
                                        KGViewY(self.nowLabel) + KGViewHeight(self.nowLabel),
                                        KGViewWidth(self),
                                        KGViewHeight(self) - KGViewY(self.historyView));
}
- (CGFloat)resultWidthFromString:(NSString *)string{
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
    CGRect rect = [string boundingRectWithSize:CGSizeMake(0, 30) options:NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.width;
}
//MARK:创建搜索记录
- (UITableView *)historyView{
    if (!_historyView) {
        _historyView = [[UITableView alloc]init];
        _historyView.delegate = self;
        _historyView.dataSource = self;
        _historyView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        [self addSubview:_historyView];
    }
    return _historyView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KGSearchBarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"KGSearchBarTableViewCell" owner:self options:nil] lastObject];
    }
    cell.delegate = self;
    cell.textLbael.text = _dataArr[indexPath.row];
    return cell;
}
- (void)delectHistory:(NSString *)history{
    [self.dataArr removeObject:history];
    [self.historyView reloadData];
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    if (self.dataArr.count > 0) {
        BOOL isHave = NO;
        for (int i = 0; i < self.dataArr.count; i++) {
            if ([self.dataArr[i] isEqualToString:searchBar.text]) {
                isHave = YES;
            }
        }
        if (isHave == NO) {
            [self.dataArr addObject:searchBar.text];
        }
    }else{
        [self.dataArr addObject:searchBar.text];
    }
    [self.historyView reloadData];
}
@end
