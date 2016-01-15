//
//  UINavigationBar+LTLDefault.h
//  LTLCommunity
//
//  Created by lb on 14-7-14.
//  Copyright (c) 2014年 xes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (LTLDefault)

// 导航条 默认style
-(void)setDefaultBarAttribution;

// 导航条 全透明style
-(void)setLTLStyle;
// 导航条 改成蓝透明
- (void)setBlueStyle;
// 导航条 黑色透明60%style
-(void)setBlackStyle;
// 导航条 灰透明
- (void)setLightGrayStyle;
@end
