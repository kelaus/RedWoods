//
//  ResponseEntity.h
//  LTLCommunity
//
//  Created by 李敏 on 14-7-16.
//  Copyright (c) 2014年 xes. All rights reserved.
//

#import "BaseEntity.h"


typedef enum {
    // 请求成功，返回entity；
    responseStatus_success = 0,
    // 请求成功，返回错误信息
    responseStatus_wrongMsg=1,
    // 请求成功，返回nil
    responseStatus_nil=2,
    // 请求失败，返回error
    responseStatus_error=3,
    
} responseStatus;


@interface ResponseEntity : BaseEntity


//返回的4种状态
@property NSInteger status;

@property(strong,nonatomic)NSString *errorMsg;

@property(nonatomic) id result;

@property(strong,nonatomic)NSError *error;

@end
