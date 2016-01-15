//
//  UIImageView+Rounded.m
//  TestImage
//
//  Created by lb on 14-7-10.
//  Copyright (c) 2014年 com.xueersi. All rights reserved.
//

#import "UIImageView+Rounded.h"

@implementation UIImageView (Rounded)

-(void)turnRound
{
    CGFloat radius = 0;
    if (self.frame.size.width >= self.frame.size.height) {
        radius = self.frame.size.height;
    }else{
        radius = self.frame.size.width;
    }
    
    self.layer.cornerRadius = radius/2;
    self.clipsToBounds = YES;
}

@end
