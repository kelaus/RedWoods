//
//  UINavigationBar+XESDropShadow.h
//  TestTableView
//
//  Created by lb on 14-6-30.
//  Copyright (c) 2014年 com.xueersi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (XESDropShadow)

- (void)dropShadowWithOffset:(CGSize)offset
                      radius:(CGFloat)radius
                       color:(UIColor *)color
                     opacity:(CGFloat)opacity;
@end
