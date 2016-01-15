//
//  UINavigationItem+WXAddition.m
//  ParentsCommunity
//
//  Created by LiuBo on 15/7/17.
//  Copyright (c) 2015年 XES. All rights reserved.
//

#import "UINavigationItem+WXAddition.h"

@implementation UINavigationItem (WXAddition)

-(void)setDefaultTitleView:(NSString *)title{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)] ;
    label.font = [UIFont boldSystemFontOfSize:20.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = title;

    [self setTitleView:label];
}

-(void)setDefaultLoadingView:(NSString *)loadingTitle{
    UIView *viewBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 110, 30)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 80, 30)] ;
    label.font = [UIFont boldSystemFontOfSize:20.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = loadingTitle;
    
    UIActivityIndicatorView *viewIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    CGRect viewIndicatorFrame = viewIndicator.frame;
    viewIndicatorFrame.origin = CGPointMake(5, 5);
    viewIndicator.frame = viewIndicatorFrame;
    [viewIndicator startAnimating];
    
    [viewBg addSubview:viewIndicator];
    [viewBg addSubview:label];
    
    [self setTitleView:viewBg];
}

@end
