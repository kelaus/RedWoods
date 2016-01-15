//
//  UserInfoEntity.h
//  RedWoodBusiness
//
//  Created by JunLee on 16/1/10.
//  Copyright © 2016年 Jun Li. All rights reserved.
//

#import "BaseEntity.h"

@interface UserInfoEntity : BaseEntity

@property (nonatomic,strong)NSString *userID;
@property (nonatomic,strong)NSString *businessID;
@property (nonatomic,strong)NSString *businessName;
@property (nonatomic,strong)NSString *address;
@property (nonatomic,strong)NSString *docount;//待配送订单数
@property (nonatomic,strong)NSString *pendingOrderNum;//待处理订单数量
@property (nonatomic,strong)NSString *msgIdList;//系统消息id列表
@property (nonatomic,strong)NSString *isAdmin;//是否为管理员
@property (nonatomic,strong)NSString *IsInner;//是否国内商户
@property (nonatomic,strong)NSString *LocationName;//所在地区

@end
