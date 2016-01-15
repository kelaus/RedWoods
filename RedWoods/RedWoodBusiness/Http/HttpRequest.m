//
//  HttpRequest.m
//  ParentsCommunity
//
//  Created by 李家龙 on 14/11/24.
//  Copyright (c) 2014年 张 诗杰. All rights reserved.
//

#import "HttpRequest.h"
#import "SBJsonParser.h"
#import "AppDelegate.h"
@implementation HttpRequest
{
    __weak ASIFormDataRequest *_requestBig;
}
- (void)doGetRequest:(NSString *)urlString parameters:(NSDictionary *)parameters async:(BOOL)async HttpRequestFinishBlock:(HttpRequestFinish)finishBlock
{
     ASIHTTPRequest *request1 = [self setGetParameters:urlString parameters:parameters];
    
    __weak ASIHTTPRequest *request = request1;
//    [request setTimeOutSeconds:10];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *authCode = [userDefaults objectForKey:@"authCode"];
    
//   [self addRequestHeader:@"Content-Type" value:@"application/json"];
    if (authCode != nil) {
        [request addRequestHeader:@"token" value:authCode];
    }
    
//    [request addRequestHeader:@"Content-Type" value:@"application/json"];
    
    //判断是否为异步请求
    if (async) {
        [request startAsynchronous];
    }else
    {
        [request startSynchronous];
    }
    [request setCompletionBlock:^{
        NSString *responseString = [request responseString];
        SBJsonParser *parser = [[SBJsonParser alloc]init];
        NSError *error;
        NSDictionary *result = [parser objectWithString:responseString error:&error];
        NSLog(@"http-debug %@ -> %@",urlString , result);
        if(!result)
        {
            NSError *error=[request error];
            finishBlock(YES, nil,error);
        }
        else
        {
            finishBlock(YES,result,nil);
        }
    }];
    [request setFailedBlock:^{
        NSError *error=[request error];
        finishBlock(NO,nil,error);
    }];
}

// request get请求url 拼接
-(ASIHTTPRequest *)setGetParameters:(NSString *)urlStr parameters:(NSDictionary *)parameters {
    
    NSInteger i,count;
    id key,value;
    NSArray *keys = [parameters allKeys];
    count = [keys count];
    
    for (i=0; i<count; i++) {
        key = keys[i];
        value = [parameters objectForKey:key];
        if(i==0)
        {
            urlStr =  [urlStr stringByAppendingFormat:@"?%@=%@",key,value];
        }else
        {
            urlStr = [urlStr stringByAppendingFormat:@"&%@=%@",key,value];
        }
    }
    NSURL *url = [[NSURL alloc]initWithString:urlStr];
    ASIHTTPRequest *request = [[ASIHTTPRequest alloc]initWithURL:url];
    return request;
}

-(void)doBigFilePostRequest:(NSString *)urlString parameters:(NSDictionary *)parameters dataParameters:(NSDictionary *)dataParameters async:(BOOL)async HttpRequestFinishBlock:(HttpRequestFinish)finishBlock
{
//    NSURL *url = [[NSURL alloc]initWithString:urlString];
//    
//    ASIFormDataRequest *req = [[ASIFormDataRequest alloc]initWithURL:url];
//    // 判断是否获取上传进度
//    if(_isUploadProcess){
//        _isUploadProcess = NO;
//        req.showAccurateProgress = YES;
//        [req setUploadProgressDelegate:_progressDelegate];
//    }
//
//    _requestBig = [self setPostParameters:req parameters:parameters dataParameters:dataParameters];
//    [_requestBig setTimeOutSeconds:10];
//    //  判断是否为异步请求
//    if (async) {
//        [_requestBig startAsynchronous];
//    }else
//    {
//        [_requestBig startSynchronous];
//    }
//    
//    [_requestBig setCompletionBlock:^{
//        NSString *responseString = [_requestBig responseString];
//        SBJsonParser *parser = [[SBJsonParser alloc]init];
//        NSError *error;
//        NSDictionary *result = [parser objectWithString:responseString error:&error];
//        
//       NSLog(@"http-debug %@ -> %@",urlString , result);
//        
//        if(!result)
//        {
//            NSError *error=[_requestBig error];
//            finishBlock(YES, nil,error);
//        }
//        else
//        {
//            finishBlock(YES,result,nil);
//        }
//        
//    }];
//    
//    [_requestBig setFailedBlock:^{
//        NSError *error = [_requestBig error];
//        finishBlock (NO,nil,error);
//        NSLog(@"http-debug %@ -> %@",urlString , error);
//    
//    }];
    
}

-(void)doPostRequest:(NSString *)urlString parameters:(NSDictionary *)parameters dataParameters:(NSDictionary *)dataParameters async:(BOOL)async HttpRequestFinishBlock:(HttpRequestFinish)finishBlock
{
    NSURL *url = [[NSURL alloc]initWithString:urlString];
    ASIFormDataRequest *req = [[ASIFormDataRequest alloc]initWithURL:url];
    
    __weak ASIFormDataRequest *request = [self setPostParameters:req parameters:parameters dataParameters:dataParameters];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *authCode = [userDefaults objectForKey:@"authCode"];
    if (authCode != nil) {
        [request addRequestHeader:@"token" value:authCode];
    }
    NSLog(@"head-token:%@ ",authCode);
    
    
    [request setTimeOutSeconds:10];
    [request setCompletionBlock:^{
        NSString *responseString = [request responseString];
        SBJsonParser *parser = [[SBJsonParser alloc]init];
        NSError *error;
        NSDictionary *result = [parser objectWithString:responseString error:&error];
        
        NSLog(@"接口:%@\n参数：%@\n成功返回值:%@" , urlString , parameters ,responseString);
        
        if(!result)
        {
            NSError *error=[request error];
            finishBlock(YES, nil,error);
        }
        else
        {
            finishBlock(YES,result,nil);
        }
    }];
    
    [request setFailedBlock:^{
        NSError *error = [request error];
        NSLog(@"接口:%@\n失败返回值:%@" , urlString , error);
        finishBlock (NO,nil,error);
    }];
    //  判断是否为异步请求
    if (async) {
        [request startAsynchronous];
    }else
    {
        [request startSynchronous];
    }
}

//request post请求url 拼接
-(ASIFormDataRequest *)setPostParameters:(ASIFormDataRequest *)request parameters:(NSDictionary *)parameters dataParameters:(NSDictionary *)dataParameters
{
    NSInteger i,count;
    id key,value;
    NSArray *keys = [parameters allKeys];
    count = [keys count];
    ASIFormDataRequest *iRequest = request;
    for (i=0; i<count; i++) {
        key = keys[i];
        value = [parameters objectForKey:key];
        [iRequest setPostValue:value forKey:key];
    }
    
//    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    NSString *sessid = appDelegate.shareDataManager.myUserInfoEntity.userSessionId;
//    if (sessid) {
//        [iRequest setPostValue:sessid forKey:@"sessid"];  // seesionId作为必传字段，在此次添加上
//    }
    
    
    if(dataParameters && [request isKindOfClass:[ASIFormDataRequest class]])
    {
        keys = [dataParameters allKeys];
        
        count = [keys count];
        for (i=0; i<count; i++) {
            key = keys[i];
            value = [dataParameters objectForKey:key];
            [iRequest setData:value forKey:key];
        }
    }
    return iRequest;
}

- (void)cancle
{
    [_requestBig cancel];
    _requestBig = nil;
}
@end
