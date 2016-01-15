//
//  OrderDetailViewController.h
//  RedWoodBusiness
//
//  Created by JunLee on 16/1/11.
//  Copyright © 2016年 Jun Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDetailViewController : UIViewController


-(OrderDetailViewController*)initWithOrderID:(NSString *)id OrderStaus:(NSString*)myOderStaus;
@end
