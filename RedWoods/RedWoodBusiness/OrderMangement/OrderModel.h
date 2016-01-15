//
//  OrderModel.h
//  RedWoodBusiness
//
//  Created by JunLee on 16/1/11.
//  Copyright © 2016年 Jun Li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderModel : NSObject

@property (nonatomic,strong)NSString *OrderID;
@property (nonatomic,strong)NSString *UserID;
@property (nonatomic,strong)NSString *BusinessID;
@property (nonatomic,strong)NSString *OrderStatus;
@property (nonatomic,strong)NSString *Name;
@property (nonatomic,strong)NSString *Mobile;
@property (nonatomic,strong)NSString *Address;


@end
