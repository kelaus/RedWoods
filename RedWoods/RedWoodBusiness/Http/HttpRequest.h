//
//  HttpRequest.h
//  ParentsCommunity
//
//  Created by 李家龙 on 14/11/24.
//  Copyright (c) 2014年 张 诗杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"

/*
 *   定义请求完成闭包，返回链接是否成功（bSucess），请求返回数据（returnData），请求错误 （error）
 */
typedef void(^HttpRequestFinish)(BOOL success,id returnData,NSError *error);


@interface HttpRequest : NSObject
// 是否获取上传进度
@property(nonatomic,assign)BOOL isUploadProcess;
// 遵守进度代理的类
@property(nonatomic,assign)id <ASIProgressDelegate>progressDelegate;

/*
 *   作get请求
 */
- (void)doGetRequest:(NSString *)urlString parameters:(NSDictionary *)parameters                                   async:(BOOL)async HttpRequestFinishBlock:(HttpRequestFinish)finishBlock ;
/*
 *   作post请求
 */

-(void)doPostRequest:(NSString *)urlString parameters:(NSDictionary *)parameters dataParameters:(NSDictionary *)dataParameters async:(BOOL)async HttpRequestFinishBlock:(HttpRequestFinish)finishBlock ;
/*
 *   作大文件请求
 */
-(void)doBigFilePostRequest:(NSString *)urlString parameters:(NSDictionary *)parameters dataParameters:(NSDictionary *)dataParameters async:(BOOL)async HttpRequestFinishBlock:(HttpRequestFinish)finishBlock;
- (void)cancle;
@end
