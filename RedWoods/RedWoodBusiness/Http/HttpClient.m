//
//  HttpClient.m
//  ParentsCommunity
//
//  Created by 李家龙 on 14/11/24.
//  Copyright (c) 2014年 张 诗杰. All rights reserved.
//

#import "HttpClient.h"
#import "HttpRequest.h"

@implementation HttpClient
{
    HttpRequest *_bigRequest;
}

- (void)requestURL :(NSString *) sURL
        requestType:(requestType) rType
             params:(NSDictionary *) params
     dataParameters:(NSDictionary *)dataParameters
              async:(BOOL)async
  responseDataBlock: (responseData)responseBlock
{
    HttpRequest *httpRequest=[[HttpRequest alloc]init];
    ResponseEntity *rEntity=[[ResponseEntity alloc]init];
    if (rType==requestType_GET)
    {
        [httpRequest doGetRequest:sURL parameters:params async:async HttpRequestFinishBlock:^(BOOL bSuccess, id returnData, NSError *error) {
            if (bSuccess)
            {
                if (returnData)
                {
                    NSDictionary *resultDic = [returnData objectForKey:@"status"] == [NSNull null] ? nil : [returnData objectForKey:@"status"];
                    // 容错处理
                    if (resultDic &&  [resultDic objectForKey:@"code"] != [NSNull null])
                    {
                        NSInteger status=[[ (NSDictionary *)resultDic objectForKey:@"code"]integerValue];
                        // code = 1：成功 ／ －1:失败
                        if (status==0)
                        {
                            //请求成功，但是错误信息
                            rEntity.status = 1;
                            rEntity.errorMsg = [resultDic objectForKey:@"message"];
                            responseBlock(rEntity);
                            
                        }else if (status == 1){
                            //请求成功，返回正确数据
                            rEntity.status = 0;
                            rEntity.result = [(NSDictionary *)returnData objectForKey:@"data"];
                            responseBlock(rEntity);
                            
                        }else if(status == -1){
                            
                            //结果 “失败”
                            rEntity.status = -1;
                            rEntity.result = [(NSDictionary *)returnData objectForKey:@"data"];
                            responseBlock(rEntity);
                        }
                        
                    }else {
                        //请求成功，无数据
                        rEntity.status = 2;
                        responseBlock(rEntity);
                    }
                }
                else
                {   //请求成功，无数据
                    rEntity.status = 2;
                    responseBlock(rEntity);
                }
                
            }
            else
            {
                //请求失败
                rEntity.status = 3;
                rEntity.error = error;
                responseBlock(rEntity);
            }
            
        }];
    }
    else if (rType==requestType_POST)
    {
        //POST请求
        [httpRequest doPostRequest:sURL parameters:params dataParameters:dataParameters async:async HttpRequestFinishBlock:^(BOOL bSuccess, id returnData, NSError *error) {
            if (bSuccess)
            {
                if (returnData)
                {
                    NSDictionary *resultDic = [returnData objectForKey:@"status"] == [NSNull null] ? nil : [returnData objectForKey:@"status"];
                    
                    // 容错处理
                    
                    if (resultDic &&  [resultDic objectForKey:@"code"] != [NSNull null])
                        
                    {
                        
                        int status = [[resultDic objectForKey:@"code"] intValue];
                        
                        if (status == 1)
                        {
                            //请求成功，返回正确数据
                            rEntity.status = 0;
                            rEntity.result = [returnData objectForKey:@"data"]?[returnData objectForKey:@"data"] : @"";
                           
                        }else if(status == -1){
                            
                            rEntity.status = -1;
                             rEntity.result = [returnData objectForKey:@"data"]?[returnData objectForKey:@"data"] : @"";
                            //请求成功，但是错误信息
                            rEntity.status = 1;
                            rEntity.errorMsg = [resultDic objectForKey:@"data"] == [NSNull null]?TIPS_RESULT_NULL:[resultDic objectForKey:@"data"];
                            
                           
                        }else if(status == -2){
                            
                            rEntity.status = -2;
                            rEntity.result = [resultDic objectForKey:@"data"];
                            
                        }else if (status == -3){
                            
                            rEntity.status = -3;
                            rEntity.result = [resultDic objectForKey:@"data"];
                        }
                        
                        responseBlock(rEntity);
                        
                    }
                else
                {
                    //请求成功 没有返回状态码
                    rEntity.status = 2;
                    rEntity.errorMsg = TIPS_ERROR;
                    rEntity.error = error;
                    responseBlock(rEntity);
                
               
                }
                
                }else{
                    //请求成功 无返回数据
                    rEntity.status = 2;
                    rEntity.error = error;
                    responseBlock(rEntity);
                
                }
            }else{
                //请求失败
                rEntity.status = 3;
                rEntity.error = error;
                responseBlock(rEntity);
            }

        }];
    }
    
}

- (void)bigFileRequestURL :(NSString *) sURL
                    params:(NSDictionary *)params
            dataParameters:(NSDictionary *)dataParameters
                     async:(BOOL)async
         responseDataBlock: (responseData)responseBlock
{
    _bigRequest=[[HttpRequest alloc]init];
    ResponseEntity *rEntity=[[ResponseEntity alloc]init];
    
    // 是否获取进度 传给httpRequest
    _bigRequest.isUploadProcess = _isUploadProcess;
    _bigRequest.progressDelegate = _progressDelegate;
    
    [_bigRequest doBigFilePostRequest:sURL parameters:params dataParameters:dataParameters async:async HttpRequestFinishBlock:^(BOOL success, id returnData, NSError *error) {
        if (success)
        {
            if (returnData)
            {
                
                // 容错处理
                if ([[ (NSDictionary *)returnData objectForKey:@"result"] objectForKey:@"status"])
                {
                    int status = [[[ (NSDictionary *)returnData objectForKey:@"result"] objectForKey:@"status"]intValue];
                    if (status == 0)
                    {
                        //请求成功，但是错误信息
                        rEntity.status = 1;
                        rEntity.errorMsg = [[(NSDictionary *)returnData objectForKey:@"result"] objectForKey:@"data"];
                        responseBlock(rEntity);
                    }
                    else if (status == 1)
                    {
                        //请求成功，返回正确数据
                        rEntity.status = 0;
                        rEntity.result = [[(NSDictionary *)returnData objectForKey:@"result"] objectForKey:@"data"];
                        responseBlock(rEntity);
                    }
                }
            }
            else
            {   //请求成功，无数据
                rEntity.status = 2;
                rEntity.errorMsg = TIPS_RESULT_NULL;
                responseBlock(rEntity);
            }
            
        }
        else
        {
            //请求失败
            rEntity.status = 3;
            rEntity.error = error;
            rEntity.errorMsg = TIPS_ERROR;
            responseBlock(rEntity);
        }
        
    }];
    
    
    
}

- (void)cancle
{
    [_bigRequest cancle];
    _bigRequest = nil;
}

@end
