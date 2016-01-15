//
//  OrderDetailModel.h
//  RedWoodBusiness
//
//  Created by JunLee on 16/1/12.
//  Copyright © 2016年 Jun Li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderDetailModel : NSObject
@property (nonatomic,strong)NSString* OverTime	;//
@property (nonatomic,strong)NSString* BusinessLongitude;
@property (nonatomic,strong)NSString* BusinessLatitude;
@property (nonatomic,strong)NSString* Distance;
@property (nonatomic,strong)NSString* UserLongitude; //经度
@property (nonatomic,strong)NSString* UserLatitude; //纬度
@property (nonatomic,strong)NSString* PayTime;
@property (nonatomic,strong)NSString* PayStatus;
@property (nonatomic,strong)NSString* PayType;
@property (nonatomic,strong)NSString* PinYin; //?

@property (nonatomic,strong)NSString* ConsigneeAddr	;//收货地址
@property (nonatomic,strong)NSString* CreateTime	;//下单时间
@property (nonatomic,strong)NSString* OrderID;//订单ID
@property (nonatomic,strong)NSString* OrderNo	;//订单编号
@property (nonatomic,strong)NSString* OrderStatus	;//	订单状态
@property (nonatomic,strong)NSString* OrderType	;//订单类型

@property (nonatomic,strong)NSString* Name	;//姓名
@property (nonatomic,strong)NSString* RealityAmount;//订单总计
@property (nonatomic,strong)NSString* StatusDec	;//	订单状态描述
@property (nonatomic,strong)NSString* WayBillCode;//	运单编号
@property (nonatomic,strong)NSString* Remark	;//订单留言

@property (nonatomic,strong)NSString* LogisticsName	;//	物流名称
@property (nonatomic,strong)NSString* Postage	;//	配送费
@property (nonatomic,strong)NSString* Status	;//订单状态


@property (nonatomic,strong)NSString* Mobile	;//	手机
@property (nonatomic,strong)NSMutableArray *OderDetailList; //见面下的模型

@end

//OderDetailList
@interface OderDetailList : NSObject
@property (nonatomic,strong)NSString* ServiceState	;//售后状态
@property (nonatomic,strong)NSString* Total	;//	商品合计
@property (nonatomic,strong)NSString* ObjectName	;//商品清单
@property (nonatomic,strong)NSString* ServiceID	;//	售后ID
@property (nonatomic,strong)NSString* Count	;//商品数量
@property (nonatomic,strong)NSString* Price	;//商品单价
@end
