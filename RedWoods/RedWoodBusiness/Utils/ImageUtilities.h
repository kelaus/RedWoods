//
//  ImageUtilities.h
//  ParentsCommunity
//
//  Created by qizhang on 14-4-2.
//  Copyright (c) 2014年 张 诗杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageUtilities : NSObject
+ (CGSize )imageWithImage:(UIImage *)image scaledToMaxWidth:(CGFloat)width maxHeight:(CGFloat)height;
+(CGSize )scaleImageWithSize:(CGSize )size scaledToMaxWidth:(CGFloat)width maxHeight:(CGFloat)height;
+(UIImage *)imageFromImage:(UIImage *)image;
+ (UIImage *)createImageWithColor:(UIColor *)color;
@end
