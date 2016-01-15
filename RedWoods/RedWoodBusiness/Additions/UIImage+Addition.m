//
//  UIImage+Addition.m
//  LTLCommunity
//
//  Created by lb on 14-11-21.
//  Copyright (c) 2014年 xes. All rights reserved.
//

#import "UIImage+Addition.h"

@implementation UIImage (Addition)

// 适当压缩后的img
-(UIImage *)compressedProperly
{
    CGFloat widthScale =  1500. / self.size.width;
    CGFloat heightScale =  1500. / self.size.height;
    CGFloat scale = widthScale > heightScale ? heightScale : widthScale;
    if (scale > 1) {
        scale = 1;
    }
    
    CGSize newSize = CGSizeMake(self.size.width * scale, self.size.height * scale);
    
    // Scale the original image to match the new size.
    UIGraphicsBeginImageContext(newSize);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage* compressedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImageJPEGRepresentation(compressedImage, 1.);
    if (imageData.length > 500000) { //小于200k则不压缩
        imageData = UIImageJPEGRepresentation(compressedImage, .8);
    }
    return [UIImage imageWithData:imageData];
}

@end
