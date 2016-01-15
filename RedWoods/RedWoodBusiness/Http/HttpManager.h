//
//  HttpManager.h
//  ParentsCommunity
//
//  Created by 李家龙 on 14/11/24.
//  Copyright (c) 2014年 张 诗杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpClient.h"
#import "HttpResponseParser.h"

#import "HttpRequest.h"
#import "Kinterface.h"
typedef void(^returnData)(ResponseEntity *rEntity);


@interface HttpManager : NSObject
@property (nonatomic,strong)HttpClient *httpClient;
@property (nonatomic,strong)HttpResponseParser *responseParser;
@property (nonatomic,strong)HttpRequest *httpRequest;
//@property (nonatomic,strong)ShareDataManager *shareDataManager_;
// 代理  如果某控件想获取上传进度 ，先蹲守代理，再传入该类 1.9版修改
@property(nonatomic,assign)id <ASIProgressDelegate>progressDelegate;


@end
