//
//  HttpResponseParser.h
//  ParentsCommunity
//
//  Created by 李家龙 on 14/11/24.
//  Copyright (c) 2014年 张 诗杰. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "ShareDataManager.h"


@interface HttpResponseParser : NSObject
{
//    ShareDataManager* _shareDataManager;
    NSString *_atMatchingValue;
}
//
//- (instancetype)initWithParameters:(ShareDataManager *)shareDataManager;
//
//// 根据返回数据的result解析出相应entity的数据
//// 个人信息数据解析
//- (MyUserInfoEntity *)parserFromResult:(NSDictionary *)result;
//// 未完善信息数据解析
//- (MyUserInfoEntity *)parserFromCompleteResult:(NSDictionary *)result withUserInfo:(MyUserInfoEntity *)userInfo;
//
////解析群资料列表
//- (NSArray *)getDatumListFromResult:(NSDictionary *)result;
//// 解析收藏资料
//- (CollectionEntity *)getCollectionParse : (NSDictionary *)result;
//// 解析收藏资料列表
//- (NSArray *)getCollectListFromResult:(NSArray *)result;
//// 解析学习报告列表
//- (NSArray *)getStudyReportFromResult:(NSDictionary *)result;
//// 解析个人勋章数据
//- (MyUserInfoEntity *)getMedalsFromResult:(NSDictionary *)result;
//// 解析指定账号的用户信息
//- (MyUserInfoEntity *)getUserInfoFromResult:(NSDictionary *)result;
//// 解析广告列表
//- (NSMutableDictionary *)getAdvertsFromResult:(NSDictionary *)result;
//// 解析作业作文科目列表
//- (NSMutableArray *)getSubjectsFromResult:(NSMutableArray *)resultArray;
//// 上传作业返回数据解析
//- (NSArray *)getUploadHomeWork:(NSDictionary *)result  withWorCorrectEntity:(NSDictionary *)values;
//// 周学习报告解析
//- (WeekLearningEntity *)getWeekLearning:(NSDictionary *)result WithWeekId:(NSString *)weekId;
//// 学习计划解析
//- (NSMutableArray *)getStudyPlanFromResult:(NSDictionary *)result;
//// 看课
//- (NSMutableArray *)getStudyVideoListFromResult:(NSMutableArray *)result;
//// 看课详情
//- (VideoCourseEntity *)getStudyVideoDetailFromResult:(NSDictionary *)result;
//// 播放列表大纲解析
//- (NSMutableArray *)getCourseOutLineFromResult:(NSMutableArray *)result;
//// 互动题解析
//-  (NSMutableArray *)getInteractiveQuestionsFromResult:(NSMutableArray*)result;
//// 学到1分钟，金币提示解析
//- (NSAttributedString *)getGlodFormResult:(NSDictionary *)result;
//
////---------------发现 - 课程中心----------------
//// 1.课程筛选条件接口
//- (NSDictionary *)getGradeSubjectFromResult:(NSDictionary *)result;
//// 2.课程列表接口
//- (NSDictionary *)getCourseListFromResult:(NSDictionary *)result;
//
//// 4.学币收支列表
//- (NSDictionary *)getLearnCoinRecords:(NSDictionary *)result;
//
//// IAP支付课程详情数据解析
//- (BuyCourseEntity *)getIAPCourseDetailFromResult:(NSDictionary *)result;
//// -------------网校作业二期--------------------
//// 解析修改作业
//- (HomeWorkEntity *)getCollectedWork:(NSDictionary *)result;
@end
