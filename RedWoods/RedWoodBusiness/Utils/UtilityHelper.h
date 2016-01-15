//
//  UtilityHelper.h
//  RedWoodBusiness
//
//  Created by JunLee on 16/1/12.
//  Copyright © 2016年 Jun Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UtilityHelper : NSObject

+ (UIColor *) colorWithHexString: (NSString *) stringToConvert;
+(UILabel*)addlabelToSuperView:(UIView *)superView
                           text:(NSString *)text
                      textColor:(UIColor *)textColor
                backgroundColor:(UIColor *)backgroundColor
                       fontSize:(CGFloat)fontSize
                        LineNum:(NSInteger)lineNum
                  textAlignment:(NSTextAlignment)textAlignment;
@end
