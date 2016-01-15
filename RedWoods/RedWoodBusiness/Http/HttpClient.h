//
//  HttpClient.h
//  ParentsCommunity
//
//  Created by 李家龙 on 14/11/24.
//  Copyright (c) 2014年 张 诗杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIProgressDelegate.h"
#import "ResponseEntity.h"
typedef enum {
    // get请求
    requestType_GET = 0,
    // post请求
    requestType_POST = 1
} requestType;

/*
 *  定义返回数据闭包  其中data的返回值类型如果是NSString，直接用来显示，如果是NSDictionary类型，则调用解析类直接解析。
 */
typedef void(^responseData)(ResponseEntity *rEntity);
@interface HttpClient : NSObject

#if NS_BLOCKS_AVAILABLE
// 是否获取上传进度
@property(nonatomic,assign)BOOL isUploadProcess;
@property(nonatomic,assign)id <ASIProgressDelegate>progressDelegate;
- (void)requestURL :(NSString *) sURL
        requestType:(requestType) rType
             params:(NSDictionary *)params
     dataParameters:(NSDictionary *)dataParameters
              async:(BOOL)async
  responseDataBlock: (responseData)responseBlock;
- (void)bigFileRequestURL :(NSString *) sURL
                    params:(NSDictionary *)params
            dataParameters:(NSDictionary *)dataParameters
                     async:(BOOL)async
         responseDataBlock: (responseData)responseBlock;
- (void)cancle;


#endif


@end
