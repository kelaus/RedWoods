//
//  ImageUtilities.m
//  ParentsCommunity
//
//  Created by qizhang on 14-4-2.
//  Copyright (c) 2014年 张 诗杰. All rights reserved.
//

#import "ImageUtilities.h"

@implementation ImageUtilities
+ (CGSize )imageWithImage:(UIImage *)image scaledToMaxWidth:(CGFloat)width maxHeight:(CGFloat)height {
    
    UIImage *sourceImage = [ImageUtilities imageFromImage:image];
    CGFloat oldWidth = sourceImage.size.width;
    CGFloat oldHeight = sourceImage.size.height;
    CGFloat scaleFactor = (oldWidth > oldHeight) ? width / oldWidth : height / oldHeight;
    CGFloat newHeight = oldHeight * scaleFactor;
    CGFloat newWidth = oldWidth * scaleFactor;
    CGSize newSize = CGSizeMake(newWidth, newHeight);
    
    return newSize;
}

+(UIImage *)imageFromImage:(UIImage *)image
{
    
    
    CGFloat oldWidth = image.size.width;
    CGFloat oldHeight = image.size.height;
    CGRect rect;
    UIImage *newImage;
    if (oldHeight * 1.8 < oldWidth)
    {
        
        CGFloat newWidth = oldHeight *1.8;
        rect =  CGRectMake((oldWidth - newWidth)*0.5, 0, newWidth, oldHeight);
       
    }
    else if (oldWidth *1.8 < oldHeight)
    {
        CGFloat newHeight = oldWidth *1.8;
        rect =  CGRectMake(0, (oldHeight - newHeight)*0.5, oldWidth, newHeight);
       
    }
    else
    {
        rect =  CGRectMake(0, 0, oldWidth, oldHeight);
       
    }
   
    newImage = [UIImage imageWithCGImage:CGImageCreateWithImageInRect([image CGImage], rect)];
  
    return newImage;
}


+(CGSize )scaleImageWithSize:(CGSize)size scaledToMaxWidth:(CGFloat)width maxHeight:(CGFloat)height
{
    CGFloat oldWidth = size.width;
    CGFloat oldHeight = size.height;
    
    CGFloat scaleFactor = (oldWidth > oldHeight) ? width / oldWidth : height / oldHeight;
    
    CGFloat newHeight = oldHeight * scaleFactor;
    CGFloat newWidth = oldWidth * scaleFactor;
    CGSize newSize = CGSizeMake(newWidth, newHeight);
    
    return newSize;
}

// 颜色转图像
+ (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    theImage=[theImage stretchableImageWithLeftCapWidth:1 topCapHeight:1];
    return theImage;
}

@end
