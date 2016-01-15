//
//  UINavigationBar+XESDropShadow.m
//  TestTableView
//
//  Created by lb on 14-6-30.
//  Copyright (c) 2014年 com.xueersi. All rights reserved.
//

#import "UINavigationBar+XESDropShadow.h"
#import <QuartzCore/QuartzCore.h>

@implementation UINavigationBar (XESDropShadow)

- (void)dropShadowWithOffset:(CGSize)offset
                      radius:(CGFloat)radius
                       color:(UIColor *)color
                     opacity:(CGFloat)opacity
{
    // Creating shadow path for better performance
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.bounds);
    self.layer.shadowPath = path;
    CGPathCloseSubpath(path);
    CGPathRelease(path);
    
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = opacity;
    
    // Default clipsToBounds is YES, will clip off the shadow, so we disable it.
    self.clipsToBounds = NO;
    
}

@end
