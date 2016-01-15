//
//  UINavigationBar+LTLDefault.m
//  LTLCommunity
//
//  Created by lb on 14-7-14.
//  Copyright (c) 2014年 xes. All rights reserved.
//

#import "UINavigationBar+LTLDefault.h"
#import "ImageUtilities.h"
@implementation UINavigationBar (LTLDefault)

-(void)setDefaultBarAttribution{
    [self setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                  [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0],
                                  UITextAttributeTextShadowColor,
                                  [NSValue valueWithUIOffset:UIOffsetMake(0, 0)],
                                  UITextAttributeTextShadowOffset,
                                  nil]];
    
    self.translucent = NO;
    self.tintColor = [UIColor whiteColor];
}
-(void)setLTLStyle
{
    [self setNavigationBarWithImage:[UIImage imageNamed:@"pic_no_color"]];
}

- (void)setBlueStyle
{
     UIImage *toolBg = [ImageUtilities createImageWithColor:[UIColor colorWithRed:0.37f green:0.66f blue:0.86f alpha:1.0f]];
    [self setNavigationBarWithImage:toolBg];
}

- (void)setLightGrayStyle
{
    UIImage *toolBg = [ImageUtilities createImageWithColor:[UIColor colorWithRed:170./255 green:170./255 blue:170./255 alpha:.5]];
    [self setNavigationBarWithImage:toolBg];
}


-(void)setNavigationBarWithImage:(UIImage *)image
{
    [self setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self setBarStyle:UIBarStyleDefault];
    [self setShadowImage:[UIImage new]];
    [self setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [self setTintColor:[UIColor whiteColor]];
    [self setTranslucent:YES];
    
}

-(void)setBlackStyle
{
    self.clearsContextBeforeDrawing = YES;
    [self setBackgroundImage:[UIImage imageNamed:@"pic_black_color"] forBarMetrics:UIBarMetricsDefault];
    [self setShadowImage:[UIImage imageNamed:@"pic_white_color"]];
    
}

@end
