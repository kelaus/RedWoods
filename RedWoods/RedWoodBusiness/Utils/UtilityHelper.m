//
//  UtilityHelper.m
//  RedWoodBusiness
//
//  Created by JunLee on 16/1/12.
//  Copyright © 2016年 Jun Li. All rights reserved.
//
#define aViewTag                0x402

#define SF_COLOR(RED, GREEN, BLUE, ALPHA)	[UIColor colorWithRed:RED green:GREEN blue:BLUE alpha:ALPHA]

#import "UtilityHelper.h"

@implementation UtilityHelper

+ (UIColor *) colorWithHexString: (NSString *) stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    //if ([cString length] < 6) return DEFAULT_VOID_COLOR;
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    //if ([cString length] != 6) return DEFAULT_VOID_COLOR;
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    //NSLog(@"%f:::%f:::%f",((float) r / 255.0f),((float) g / 255.0f),((float) b / 255.0f));
    
    return SF_COLOR(((float) r / 255.0f),((float) g / 255.0f),((float) b / 255.0f), 1);
}

+ (UIImage *) createImageWithColor:(UIColor *) color andRect:(CGRect)rect andCornerRadius:(float)radius
{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    addRoundedRectToPath(context, rect, radius, radius);
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth,
                                 float ovalHeight)
{
    float fw, fh;
    if (ovalWidth == 0 || ovalHeight == 0) {
        CGContextAddRect(context, rect);
        return;
    }
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    
    CGContextMoveToPoint(context, fw, fh/2);  // Start at lower right corner
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);  // Top right corner
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1); // Top left corner
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1); // Lower left corner
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1); // Back to lower right
    
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}

//- (void)hideActivityViewAtCenter
//{
//    UIActivityIndicatorView* activityView = [self getActivityViewAtCenter];
//    if (activityView != nil){
//        [activityView stopAnimating];
//    }
//    for (UIView *view in [self subviews]) {
//        if (view != nil && view.tag ==  aViewTag){
//            [view removeFromSuperview];
//            return;
//        }
//    }
//    
//}
//
//- (UIActivityIndicatorView*)getActivityViewAtCenter
//{
//    for (UIView *view in [self subviews]) {
//        if (view.tag == aViewTag) {
//            [self bringSubviewToFront:view];
//            for (UIView *inview in [view subviews])
//            {
//                if (inview != nil && [inview isKindOfClass:[UIActivityIndicatorView class]]){
//                    return (UIActivityIndicatorView*)inview;
//                }
//                
//            }
//        }
//        
//        
//    }
//    return nil;
//}

+(UILabel*)addlabelToSuperView:(UIView *)superView
                          text:(NSString *)text
                     textColor:(UIColor *)textColor
               backgroundColor:(UIColor *)backgroundColor
                      fontSize:(CGFloat)fontSize
                       LineNum:(NSInteger)lineNum
                 textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor =  textColor==nil?[UIColor blackColor]:textColor ;
    label.textAlignment= textAlignment;
    label.backgroundColor = backgroundColor;
    label.font = [UIFont systemFontOfSize:fontSize];
    [superView addSubview:label];
    
    label.numberOfLines= lineNum;
    return label;
}

@end
