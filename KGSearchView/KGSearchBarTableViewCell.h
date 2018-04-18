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

@protocol KGSearchBarTableViewCellDelegate <NSObject>

- (void)delectHistory:(NSString *)history;

@end

@interface KGSearchBarTableViewCell : UITableViewCell
/**
 搜索记录
 */
@property (weak, nonatomic) IBOutlet UILabel *textLbael;
/**
 删除搜索历史
 */
@property (nonatomic,assign) id<KGSearchBarTableViewCellDelegate>delegate;

@end
