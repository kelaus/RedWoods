//
//  RWBaseNavigationController.m
//  RedWoodBusiness
//
//  Created by JunLee on 16/1/15.
//  Copyright © 2016年 Jun Li. All rights reserved.
//

#import "RWBaseNavigationController.h"

@interface RWBaseNavigationController ()

@end

@implementation RWBaseNavigationController

+(void)initialize
{
    
    // 设置导航栏主题
    UINavigationBar * navBar = [UINavigationBar appearance];
    
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    [[UINavigationBar appearance] setBarTintColor:[UtilityHelper colorWithHexString:@"#9e0c0c"]];
    
    //
    //创建一个高20的假状态栏背景
    
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, 320, 20)];
    statusBarView.backgroundColor = [UtilityHelper colorWithHexString:@"#9e0c0c"];
    [navBar addSubview:statusBarView];
    
    //修改导航栏文字颜色，这里我选择白色
    
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    //设置导航栏的背景图片
//    [self.navigationController.navigationBarsetBackgroundImage:[UIImageimageNamed:@"bg.jpg"] forBarMetrics:UIBarMetricsDefault];
    

    
    navBar.backgroundColor = [UtilityHelper colorWithHexString:@"#9e0c0c"];
    // 取出 appearanceduixiang
    
    // 设置背景
//      [navBar setTitleTextAttributes:textAttrs];
    
    [self setupBarButtonItemTheme];
}

+(void)setupBarButtonItemTheme
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[UITextAttributeTextColor] = [UIColor orangeColor];
    
    [item setTitleTextAttributes:textAttrs
                        forState:UIControlStateNormal   ];
    [item setTitleTextAttributes:textAttrs
                        forState:UIControlStateHighlighted  ];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
