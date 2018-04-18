//
//  ViewController.m
//  KGSearchView
//
//  Created by KG丿轩帝 on 2018/4/18.
//  Copyright © 2018年 KG丿轩帝. All rights reserved.
//

#import "ViewController.h"
#import "KGSearchView.h"

@interface ViewController ()

@property (nonatomic,strong) KGSearchView *search;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.\
    
    self.view.backgroundColor = [UIColor yellowColor];
    
}

- (KGSearchView *)search{
    if (!_search) {
        _search = [[KGSearchView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, [UIScreen mainScreen].bounds.size.height)];
        _search.searchBarLayerColor = [UIColor orangeColor];
        _search.searchBarWidth = self.view.frame.size.width - 12;
        _search.searchBartype = UISearchBarCancel;
        _search.searchTitle = @"取消";
        _search.searchBarcornerRadius = 18.0f;
        _search.searchBarImage = [UIImage imageNamed:@"搜索"];
        _search.searchBarClearImage = [UIImage imageNamed:@"删除"];
        _search.searBarTintColor = [UIColor orangeColor];
        _search.isShow = NO;
        [self.view addSubview:_search];
    }
    return _search;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.search.isShow = YES;
    self.search.recommendArray = @[@"音乐",@"内涵段子",@"抖音",@"滴滴滴",@"完美世界小说",@"狄仁吉之神都龙王"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
