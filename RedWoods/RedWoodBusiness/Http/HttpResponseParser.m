//
//  HttpResponseParser.m
//  ParentsCommunity
//
//  Created by 李家龙 on 14/11/24.
//  Copyright (c) 2014年 张 诗杰. All rights reserved.
//

#import "HttpResponseParser.h"

@implementation HttpResponseParser
static HttpResponseParser *httpResponseParser;

//- (instancetype)initWithParameters:(ShareDataManager *)shareDataManager
//{
//    self = [super init];
//    if (self) {
//        _shareDataManager = shareDataManager;
//        //_atMatchingValue = [NSString stringWithFormat:@"@%@",_shareDataManager.myUserInfoEntity.nickName];
//    }
//    return self;
//}
//
//// 个人信息数据解析
//-(MyUserInfoEntity *)parserFromResult:(NSDictionary *)result
//{
//    MyUserInfoEntity *userInfo = [[MyUserInfoEntity alloc]init];
//    userInfo.userIsband = [[result objectForKey:@"isband"] intValue];
//    userInfo.userBigHead = [result objectForKey:@"himgbig"];
//    NSString *areaName = [result objectForKey:@"areaname"];
//    NSString *cityName = [result objectForKey:@"cityname"];
//    userInfo.userCityName = [NSString stringWithFormat:@"%@%@",areaName,cityName];
//    userInfo.userEnstuId = [result objectForKey:@"enstuId"];
//    userInfo.userExpnum = [result objectForKey:@"expnum"];
//    userInfo.userGrade_tips = [[result objectForKey:@"grade_tips"] intValue];
//    
//    NSString *gradeCode = [result objectForKey:@"grade"];
//    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"i" ofType:@"plist" ]];
//    NSArray *grades = [dict objectForKey:@"grades"];
//    for (NSDictionary *dict in grades) {
//        NSString *code = [dict objectForKey:@"code"];
//        if ([code isEqualToString:gradeCode]) {
//            userInfo.userGradeName = [dict objectForKey:@"name"];
//            break;
//        }
//    }
//    userInfo.userHead = [result objectForKey:@"himg"];
//    userInfo.userId = [result objectForKey:@"username"];
//    userInfo.userIsAutoLogin = YES;
//    userInfo.userIsReading = [[result objectForKey:@"isReading"]intValue];
//    //最后登录时间
//    NSString *lastLoginDate =[result objectForKey:@"lastLoginTime"];
//    if (lastLoginDate && lastLoginDate.length > 0) {
//        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//        userInfo.userLastLoginDate = [dateFormatter dateFromString:lastLoginDate];
//    }
//    userInfo.userLevel = [[result objectForKey:@"stulevel"] intValue];
//    userInfo.userType = [[result objectForKey:@"type"] intValue];
//    userInfo.userLevelName = userInfo.userType !=1?@"老师":[result objectForKey:@"levelname"];
//    userInfo.userNextexp = [[result objectForKey:@"nextexp"] integerValue];
//    userInfo.userNickName = [ result objectForKey:@"nickname"];
//    userInfo.userStuId = [result objectForKey:@"stuId"];
//    NSString *subString = [result objectForKey:@"sex"];
//    if (![@"" isEqual:subString]) {
//        userInfo.userSubName = [self  getRoleStr:[[result objectForKey:@"sex"] intValue]];
//    }else{
//        userInfo.userSubName = nil;
//    }
//    return userInfo;
//}
//// 未完善个人信息数据解析
//- (MyUserInfoEntity *)parserFromCompleteResult:(NSDictionary *)result withUserInfo:(MyUserInfoEntity *)userInfo
//{
//    userInfo.userNickName = [result objectForKey:@"nickname"];
//    userInfo.userGradeName = [result objectForKey:@"gradename"];
//    NSString *areaName = [result objectForKey:@"areaname"];
//    NSString *cityName = [result objectForKey:@"cityname"];
//    userInfo.userCityName = [NSString stringWithFormat:@"%@%@",areaName,cityName];
//    userInfo.userSubName = nil;
//    return userInfo;
//}
//
//#pragma mark - 群空间界面数据解析
///*! @brief 群空间界面数据解析。
// * @see getDatumListFromResult
// * @param  result data 字典
// * @return 返回保存资料数据模型的数组
// */
//- (NSArray *)getDatumListFromResult:(NSDictionary *)result
//{
//    NSDictionary *spaceInfo = [result objectForKey:@"spaceInfo"];
//    NSArray *datumList = [result objectForKey:@"datumList"];
//    
//    NSMutableArray *datumListResult = [NSMutableArray array];
//    for (NSDictionary *dic in datumList)
//    {
//        DatumEntity *datumEntity = [[DatumEntity alloc]init];
//        datumEntity.datum_room_name = [spaceInfo objectForKey:@"space_name"];
//        datumEntity.datum_time = [[dic objectForKey:@"time"] longLongValue];
//        datumEntity.datum_Id = [[dic objectForKey:@"id"]integerValue];
//        datumEntity.datum_spaceid = [[dic objectForKey:@"space_id"]integerValue];;
//        datumEntity.datum_isTop = [[dic objectForKey:@"is_top"]integerValue];
//        datumEntity.datum_title = [dic objectForKey:@"title"];
//        datumEntity.datum_type = [[dic objectForKey:@"type"]integerValue];
//        datumEntity.datum_coll_per_count = [[dic objectForKey:@"collect_num"]integerValue];
//        datumEntity.datum_iscollect = [[dic objectForKey:@"is_collect"]integerValue];
//        datumEntity.datum_look_over_count = [[dic objectForKey:@"click_num"]integerValue];
//        datumEntity.datum_author = [dic objectForKey:@"nickname"];
//        datumEntity.datum_url = [dic objectForKey:@"datum_path"];
//        datumEntity.datum_size = [dic objectForKey:@"size"] ;
//        [datumListResult addObject:datumEntity];
//    }
//    return datumListResult;
//    
//}
//
//#pragma mark - 收藏界面数据解析
///*! @brief 收藏界面数据解析。
// * @see getCollectListFromResult
// * @param  result data 数组
// * @return 返回保存收藏数据模型的数组
// */
//- (NSArray *)getCollectListFromResult:(NSArray *)result
//{
//    NSMutableArray *collectionListResult = [NSMutableArray array];
//    for (NSDictionary *dic in result)
//    {
//        CollectionEntity *collectionEntity = [[CollectionEntity alloc]init];
//        collectionEntity = [self getCollectionParse:dic];
//        [collectionListResult addObject:collectionEntity];
//    }
//    return collectionListResult;
//}
//
///*! @brief 单条收藏数据解析。
// * @see getCollectionParse
// * @param  result 保存收藏数据的字典
// * @return 返回收藏数据模型
// */- (CollectionEntity *)getCollectionParse : (NSDictionary *)result
//{
//    CollectionEntity *collectionEntity = [[CollectionEntity alloc]init];
//    
//    if ([[result objectForKey:@"collect_type"]integerValue] == 6)
//    {
//        if ([@"voice"isEqualToString:[result objectForKey:@"con_type"]])
//        {
//            collectionEntity.collection_type = collectionType_Voice;
//        }
//        else if ([@"text"isEqualToString:[result objectForKey:@"con_type"]])
//        {
//            collectionEntity.collection_type = collectionType_txt;
//        }
//        else if ([@"img"isEqualToString:[result objectForKey:@"con_type"]])
//        {
//            collectionEntity.collection_type = collectionType_Img;
//        }
//    }
//    else
//    {
//        collectionEntity.collection_type = [[result objectForKey:@"collect_type"]integerValue];
//    }
//    collectionEntity.collection_Id = [[result objectForKey:@"id"]integerValue];
//    collectionEntity.collection_author = [result objectForKey:@"publish_name"];
//    collectionEntity.collection_title = [result objectForKey:@"content"];
//    collectionEntity.collection_time = [[result objectForKey:@"time"]longLongValue];
//    collectionEntity.collection_url = [result objectForKey:@"url_path"];
//    collectionEntity.collection_file_id = [[result objectForKey:@"datum_id"]integerValue];
//    
//    
//    if (collectionEntity.collection_type == CollectionType_Folder )
//    {
//        
//        collectionEntity.collection_source_img = [result objectForKey:@"publish_himg"];
//        collectionEntity.collection_room_name = [result objectForKey:@"roomname"];
//        if ([result objectForKey:@"size"])
//        {
//            if ([@"" isEqualToString:[result objectForKey:@"size"]]) {
//                collectionEntity.collection_size = nil;
//            }
//            else
//            {
//                collectionEntity.collection_size = [result objectForKey:@"size"];
//            }
//        }
//        else
//        {
//            collectionEntity.collection_size = nil;
//        }
//        
//    }
//    else if (collectionEntity.collection_type == collectionType_Voice)
//    {
//        collectionEntity.collection_source_img = [result objectForKey:@"publish_himg"];
//        collectionEntity.collection_room_name = [result objectForKey:@"roomname"];
//        collectionEntity.collection_size = [result objectForKey:@"voice_length"];
//    }
//    else
//    {
//        collectionEntity.collection_source_img = [result objectForKey:@"publish_himg"];
//        collectionEntity.collection_room_name = [result objectForKey:@"roomname"];
//        collectionEntity.collection_size = nil;
//    }
//    
//    return collectionEntity;
//}
//
//#pragma  mark - 学习报告数据解析
///*! @brief 学习报告数据解析。
// * @see getStudyReportFromResult
// * @param  result data 数组
// * @return 返回保存学习报告模型的数组
// */
//- (NSArray *)getStudyReportFromResult:(NSDictionary *)result
//{
//    
//    NSMutableArray *studyReportResult = [NSMutableArray array];
//    NSDictionary *headimgDict = [result objectForKey:@"stuInfo"];
//    NSString *headImg = [headimgDict objectForKey:@"stu_head_img"];
//    for (NSDictionary *dic in [result objectForKey:@"dataList"])
//    {
//        StudyReportEntity *studyReportEntity = [self getStudyReportParse:dic];
//        studyReportEntity.studyReport_headimg = headImg;
//        [studyReportResult addObject:studyReportEntity];
//    }
//    return studyReportResult;
//}
//
///*! @brief 单条学习报告数据解析。
// * @see getStudyReportParse
// * @param  result 要解析的字典
// * @return 返回学习报告模型
// */
//- (StudyReportEntity *)getStudyReportParse:(NSDictionary *)result
//{
//    StudyReportEntity *studyReportEntity = [[StudyReportEntity alloc]init];
//    studyReportEntity.studyReport_weekId = [NSString stringWithFormat:@"%d",[[result objectForKey:@"week"] intValue]];
//    studyReportEntity.studyReport_title = [result objectForKey:@"title"];
//    studyReportEntity.studyReport_detail = [result objectForKey:@"sec_title"];
//    studyReportEntity.studyReport_type = [[result objectForKey:@"type"]intValue];
//    studyReportEntity.studyReport_time = [NSString stringWithFormat:@"%d",[[result objectForKey:@"timestamp"] intValue]];
//    studyReportEntity.studyReport_url = [result objectForKey:@"url"];
//    studyReportEntity.studyReport_create_time = nil;
//    return studyReportEntity;
//}
//
//// 解析个人勋章数据
//- (MyUserInfoEntity *)getMedalsFromResult:(NSDictionary *)result
//{
//    NSError *error = nil;
//    NSDictionary *medalsDic = [result objectForKey:@"medal"];
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:medalsDic options:NSJSONWritingPrettyPrinted error:&error];
//    NSString *medals = [[NSString alloc] initWithData:jsonData
//                                             encoding:NSUTF8StringEncoding];
//    MyUserInfoEntity *userInfo = [[MyUserInfoEntity alloc]init];
//    NSDictionary *levelDict = [result objectForKey:@"level"];
//    userInfo.userExpnum = [levelDict objectForKey:@"expnum"];
//    userInfo.userLevelName = [levelDict objectForKey:@"levelname"];
//    userInfo.userNextexp = [[levelDict objectForKey:@"nextexp"]integerValue];
//    userInfo.userLevel = [[levelDict objectForKey:@"stulevel"]intValue];
//    userInfo.userMedals = medals;
//    return userInfo;
//}
///*! @brief 周学习动态数据解析。
// * @see getWeekLearning
// * @param  result 要解析的字典
// * @return 返回学习动态模型
// */
//- (WeekLearningEntity *)getWeekLearning:(NSDictionary *)result WithWeekId:(NSString *)weekId
//{
//    WeekLearningEntity *weekLearningEntity = [[WeekLearningEntity alloc]init];
//    weekLearningEntity.weekId = weekId;
//    weekLearningEntity.stuWeekDate = [result objectForKey:@"week"];
//    
//    NSDictionary *stuReportsDict = [result objectForKey:@"stuReports"];
//    weekLearningEntity.stuName = [stuReportsDict objectForKey:@"stu_name"];
//    weekLearningEntity.stuHeadImage = [stuReportsDict objectForKey:@"stu_img"];
//    weekLearningEntity.stuWeekTime = [self stringWithNumber:[stuReportsDict objectForKey:@"total_time_len"]];
//    // 录播
//    if ([stuReportsDict.allKeys containsObject:@"study_num"] == YES) {
//       
//        WeekInfoEntity *weekInfo = [[WeekInfoEntity alloc]init];
//        weekInfo.weekId = weekId;
//        weekInfo.stuNum = [self stringWithNumber:[stuReportsDict objectForKey:@"study_num"]];
//        weekInfo.stuTime = [self stringWithNumber:[stuReportsDict objectForKey:@"study_time_len"]];
//        weekInfo.stuWorkNum = [self stringWithNumber:[stuReportsDict objectForKey:@"testpaper_nums"]];
//        weekInfo.stuType = @"录播";
//        [weekLearningEntity.weekStudyArray  addObject:weekInfo];
//    }
//    // 直播
//    if ([stuReportsDict.allKeys containsObject:@"live_num"] == YES) {
//       
//        WeekInfoEntity *weekInfo = [[WeekInfoEntity alloc]init];
//        weekInfo.weekId = weekId;
//        weekInfo.stuNum = [self stringWithNumber:[stuReportsDict objectForKey:@"live_num"]];
//        weekInfo.stuTime = [self stringWithNumber:[stuReportsDict objectForKey:@"live_time_len"]];
//        weekInfo.stuWorkNum = [self stringWithNumber:[stuReportsDict objectForKey:@"live_test_num"]];
//        weekInfo.stuType = @"直播";
//        [weekLearningEntity.weekStudyArray  addObject:weekInfo];
//
//    }
//    // 考试
//    if ([stuReportsDict.allKeys containsObject:@"monthly_exam_num"] == YES) {
//        
//        WeekInfoEntity *weekInfo = [[WeekInfoEntity alloc]init];
//        weekInfo.weekId = weekId;
//        weekInfo.stuNum = [self stringWithNumber:[stuReportsDict objectForKey:@"monthly_exam_num"]];
//        weekInfo.stuTime = [self stringWithNumber:[stuReportsDict objectForKey:@"monthly_exam_time_len"]];
//        weekInfo.stuWorkNum = [self stringWithNumber:[stuReportsDict objectForKey:@"monthly_exam_right_nums"]];
//        weekInfo.stuType = @"考试";
//        [weekLearningEntity.weekStudyArray  addObject:weekInfo];
//        
//    }
//       
//    NSArray *subjects = [self getSubjectInfoWithArray:[result objectForKey:@"subReports"] withWeekId:weekId];
//    [weekLearningEntity.subReportArray addObjectsFromArray:subjects];
//    NSArray *lives = [self getLiveInfoWithArray:[result objectForKey:@"liveReports"] withWeekId:weekId];
//    [weekLearningEntity.liveArray addObjectsFromArray:lives];
//    
//    return  weekLearningEntity;
//}
//
//// 周学习动态 科目信息解析
//- (NSArray *)getSubjectInfoWithArray:(NSArray *)subjectArray withWeekId:(NSString *)weekId
//{
//    NSMutableArray *subjectInfo = [NSMutableArray array];
//    for (NSDictionary *dict in subjectArray) {
//        
//        SubjectReportEntity *subject = [[SubjectReportEntity alloc]init];
//        subject.subName = [dict objectForKey:@"subject_name"];
//        subject.subYear = [dict objectForKey:@"year"];
//        subject.subDate = [dict objectForKey:@"end_date"];
//        subject.subTime = [dict objectForKey:@"totalm"];
//        subject.weekId = weekId;
//        [subjectInfo addObject:subject];
//    }
//    
//    return subjectInfo;
//}
//// 周学习动态 直播信息
//- (NSArray *)getLiveInfoWithArray:(NSArray *)liveArray withWeekId:(NSString *)weekId
//{
//
//    NSMutableArray *liveInfo = [NSMutableArray array];
//    for (NSDictionary *dict in liveArray) {
//       
//        LiveReportEntity *live = [[LiveReportEntity alloc]init];
//        live.weekId = weekId;
//        live.liveTeacherName = [dict objectForKey:@"teacher_name"];
//        live.liveSubject = [dict objectForKey:@"subject_name"];
//        live.liveTime = [self stringWithNumber:[dict objectForKey:@"live_time"]];
//        live.liveTestNum = [dict objectForKey:@"live_test_num"];
//        live.liveRightTestNum = [dict objectForKey:@"live_test_right_num"];
//        live.liveGold = [dict objectForKey:@"gold_num"];
//        live.liveFlowerNum = [dict objectForKey:@"flower_num"];
//        live.liveDate = [NSString stringWithFormat:@"%@  %@  %@",[dict objectForKey:@"day"],[dict objectForKey:@"week_name"],[dict objectForKey:@"start_time"]];
//        live.liveStuId = [dict objectForKey:@"stu_id"];
//        live.liveStuNum = [dict objectForKey:@"stu_num"];
//        [liveInfo addObject:live];
//      }  
//    return liveInfo;
//}
//
//- (NSString *)stringWithNumber:(NSNumber *)number
//{
//    return [NSString stringWithFormat:@"%d",[number intValue]];
//}
//
//- (NSMutableDictionary *)getAdvertsFromResult:(NSDictionary *)result
//{
//    NSMutableDictionary *resultDic = [NSMutableDictionary dictionary];
//    @try {
//        NSDictionary *dict1 = [result objectForKey:@"findAdvert"];
//        NSMutableArray *array = [NSMutableArray array];
//        NSInteger i = 0 ;
//        for (NSDictionary *dic in [dict1 objectForKey:@"info"])
//        {
//            AdvertsEntity *advertEntity = [self getAdvertFromResult:dic];
//            advertEntity.index = i;
//            [array addObject:advertEntity];
//            i++;
//        }
//        [resultDic setObject:array forKey:@"findAdvert"];
//        
//        NSDictionary *dict2 = [result objectForKey:@"chatAdvert"];
//        NSMutableArray *array1 = [NSMutableArray array];
//        for (NSDictionary *dic in [dict2 objectForKey:@"info"])
//        {
//            AdvertsEntity *advertEntity = [self getAdvertFromResult:dic];
//            advertEntity.index = i;
//            [array1 addObject:advertEntity];
//            i++;
//        }
//        [resultDic setObject:array1 forKey:@"chatAdvert"];
//    }
//    @catch (NSException *exception) {
//        XESLog(@"exception==%@",exception.description);
//    }
//    @finally {
//        
//    }
//   
//    return resultDic;
//}
//
//// 解析指定账号的用户信息
//- (MyUserInfoEntity *)getUserInfoFromResult:(NSDictionary *)result
//{
//    MyUserInfoEntity *userInfo = [[MyUserInfoEntity alloc]init];
//    userInfo.userType = [[result objectForKey:@"type"]intValue];
//    if (userInfo.userType == 1) {
//        // 普通用户
//        NSString *areaName = [result objectForKey:@"areaname"];
//        NSString *cityName = [result objectForKey:@"cityname"];
//        userInfo.userCityName = [NSString stringWithFormat:@"%@%@",areaName,cityName];
//        userInfo.userExpnum = [result objectForKey:@"expnum"];
//        userInfo.userGradeName = [result objectForKey:@"gradename"];
//        userInfo.userHead = [result objectForKey:@"himg"];
//        userInfo.userLevel = [[result objectForKey:@"stulevel"]intValue];
//        userInfo.userLevelName = [result objectForKey:@"levelname"];
//        
//        NSError *error = nil;
//        NSDictionary *medalsDic = [result objectForKey:@"medal"];
//        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:medalsDic options:NSJSONWritingPrettyPrinted error:&error];
//        NSString *medals = [[NSString alloc] initWithData:jsonData
//                                                 encoding:NSUTF8StringEncoding];
//        userInfo.userMedals =medals;
//        userInfo.userNextexp = [[result objectForKey:@"nextexp"]integerValue];
//        userInfo.userSubName = [self getRoleStr:[[result objectForKey:@"sex"]intValue]];
//        userInfo.userNickName = [result objectForKey:@"nickname"];
//    }else{
//        // 直播老师和学科老师
//        userInfo.userBindstatus = [[result objectForKey:@"bindstatus"]intValue];
//        userInfo.userAbstract = [result objectForKey:@"abstract"];
//        userInfo.userNickName = [result objectForKey:@"nickname"];
//        userInfo.userHead = [result objectForKey:@"himg"];
//        if (userInfo.userBindstatus == 1) {
//            userInfo.userBaseabstract = [result objectForKey:@"baseabstract"];
//            userInfo.userSatisfaction = [result objectForKey:@"satisfaction"];
//            userInfo.userStudentNum = [result objectForKey:@"studentNum"];
//            userInfo.userFocus = [result objectForKey:@"gradesubject"];
//        }else{
//            userInfo.userFocus = [result objectForKey:@"expert"];
//        }
//    }
//    return userInfo;
//}
//
//// 上传作业返回数据解析
//- (NSArray *)getUploadHomeWork:(NSDictionary *)result  withWorCorrectEntity:(NSDictionary *)values
//{
//    NSMutableArray *homeWorkArr = [NSMutableArray array];
//    NSString *imageUrls = [result objectForKey:@"imgs"];
//    NSArray *array = [imageUrls componentsSeparatedByString:@","];
//    for (NSString *str in array) {
//        HomeWorkCorrectEntity *homeWork = [[HomeWorkCorrectEntity alloc]init];
//        homeWork.smallImgUrl = [self getSmallImgUrl:str];
//        homeWork.bigImgUrl = str;
//        homeWork.homeWorkID = [[values objectForKey:@"workId"] intValue];
//        homeWork.couserID = [[values objectForKey:@"courseId"]intValue];
//        homeWork.servicePacksId = [[values objectForKey:@"stuPacksId"]intValue];
//        [homeWorkArr addObject:homeWork];
//    }
//    return homeWorkArr;
//}
//
//- (NSString *)getSmallImgUrl:(NSString *)url
//{
//    NSRange range = [url rangeOfString:@".jpg"];
//    if (range.location != NSNotFound) {
//        
//    NSString *str  =  [url stringByReplacingOccurrencesOfString:@".jpg" withString:@"_small.jpg"];
//       
//    return str;
//    }
//    return nil;
//}
//
///**
// *  获得对应的角色名
// *
// *  @param roleindex 角色名索引
// *
// *  @return 角色名
// */
//-(NSString *)getRoleStr:(NSInteger)roleindex
//{
//    NSDictionary *regions = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"i" ofType:@"plist"]];
//    return [[regions objectForKey:@"roles"] objectAtIndex:roleindex];
//}
//
//- (AdvertsEntity *)getAdvertFromResult:(NSDictionary *)dictionary;
//{
//    AdvertsEntity *advert = [[AdvertsEntity alloc]init];
//    advert.imgURL = [dictionary objectForKey:@"img_url"];
//    advert.URL = [dictionary objectForKey:@"url"];
//    return advert;
//}
//
///**
// *  获得作业作文科目列表
// *
// *  @param 解析返回的result
// *
// *  @return 作业作文科目列表
// */
//- (NSMutableArray *)getSubjectsFromResult:(NSMutableArray *)resultArray
//{
//    NSMutableArray *subjectArray = [[NSMutableArray alloc] init];
//    for (NSDictionary *subListDic in resultArray)
//    {
//        // 科目
//        AsubjectEntity *subjectEntity = [[AsubjectEntity alloc] init];
//        subjectEntity.subjectID = [[subListDic objectForKey:@"sub_id"] intValue];
//        subjectEntity.subjectName = [subListDic objectForKey:@"sub_name"];
//        // 服务包数组
//        NSMutableArray *servicePacksArray = [[NSMutableArray alloc] init];
//        for (NSDictionary *couserDict in [subListDic objectForKey:@"courseList"])
//        {
//         
//            for (NSDictionary *servicePacksDict in [couserDict objectForKey:@"service_packs"])
//            {
//                CouserEntity *couserEntity = [[CouserEntity alloc] init];
//                couserEntity.couserID = [[couserDict objectForKey:@"courseId"] intValue];
//                couserEntity.couserName = [couserDict objectForKey:@"courseName"];
//                NSArray *teachArray = [couserDict objectForKey:@"teacher_name"];
//                NSString *teach ;
//                for (NSString *teachName  in teachArray)
//                {
//                    // NSLog(@"teacher ===servicePacksId = %d=====couserid=%d==%@",couserEntity.servicePacksId,couserEntity.couserID,teachName);
//                    if (teach == nil||[teach isEqualToString:@""]) {
//                        teach = teachName;
//                    }else{
//                        teach = [NSString stringWithFormat:@"%@##%@",teach,teachName];
//                    }
//                }
//                NSArray *teachImgArray = [couserDict objectForKey:@"teacher_img"];
//                NSString *teachImg;
//                for (NSString *teachImage in teachImgArray) {
//                    if (teachImage == nil || [teachImage isEqualToString:@""]) {
//                        teachImg = @" ";
//                    }
//                    else{
//                        if (teachImg == nil) {
//                            teachImg = teachImage;
//                        }else{
//                            teachImg = [NSString stringWithFormat:@"%@##%@",teachImg,teachImage];
//                        }
//                    }
//                }
//                couserEntity.teacherName = teach;
//                couserEntity.teacherImg = teachImg;
//                couserEntity.servicePacksId = [[servicePacksDict objectForKey:@"stu_packs_id"] intValue];
//                couserEntity.servicePackName = [servicePacksDict objectForKey:@"service_pack_name"];
//                couserEntity.serviceTimes = [[servicePacksDict objectForKey:@"service_times"] intValue];
//                couserEntity.correctTimes = [[servicePacksDict objectForKey:@"correct_times"] intValue];
//                couserEntity.homeWorkNum = [[servicePacksDict objectForKey:@"homework_num"] intValue];
//                couserEntity.subjectID = subjectEntity.subjectID;
//                // 作业列表数组
//                NSMutableArray *homeWorkArray = [[NSMutableArray alloc] init];
//                for (NSDictionary *homeWorkDict in [servicePacksDict objectForKey:@"service_data"])
//                {
//                    HomeWorkEntity *homeWorkEntity = [[HomeWorkEntity alloc] init];
//                    homeWorkEntity.servicePackID = couserEntity.servicePacksId;
//                    homeWorkEntity.homeWorkID = [[homeWorkDict objectForKey:@"id"] intValue];
//                    homeWorkEntity.homeWorkName = [homeWorkDict objectForKey:@"orig_name"];
//                    homeWorkEntity.correctVoice = [homeWorkDict objectForKey:@"url"];
//                    homeWorkEntity.homeworkState = [[homeWorkDict objectForKey:@"status"] intValue];
//                    homeWorkEntity.resetCommitText = [homeWorkDict objectForKey:@"refusal_reason"];
//                    homeWorkEntity.couserID = couserEntity.couserID;
//                    homeWorkEntity.subjectID = subjectEntity.subjectID;
//                    // -----网校作业二期添加-------
//                    // 作业压缩大小
//                    homeWorkEntity.size = [homeWorkDict objectForKey:@"size"];
//                    // 上传图片信息数组
//                    NSMutableArray *commitImgUrlA = [[NSMutableArray alloc] init];
//                    for (NSString *commitImgUrl in [homeWorkDict objectForKey:@"imgs"])
//                    {
//                        HomeWorkCorrectEntity *correctEntity = [[HomeWorkCorrectEntity alloc] init];
//                        correctEntity.bigImgUrl = commitImgUrl;
//                        correctEntity.homeWorkID = homeWorkEntity.homeWorkID;
//                        correctEntity.servicePacksId = couserEntity.servicePacksId;
//                        correctEntity.couserID = couserEntity.couserID;
//                        correctEntity.subjectID = subjectEntity.subjectID;
//                        [commitImgUrlA addObject:correctEntity];
//                    }
//                    homeWorkEntity.homeWorkCorrectArray = [NSMutableArray arrayWithArray:commitImgUrlA];
//                    // 作业列表存入
//                    [homeWorkArray addObject:homeWorkEntity];
//
//                }
//                [servicePacksArray addObject:couserEntity];
//                couserEntity.homeWorkArray = [NSMutableArray arrayWithArray:homeWorkArray];
//                // [courseListArray addObject:couserEntity];
//
//            }
//            // couserEntity.servicePacksArray = [NSMutableArray arrayWithArray:servicePacksArray];
//        }
//        subjectEntity.courseArray = [NSMutableArray arrayWithArray:servicePacksArray];
//        [subjectArray addObject:subjectEntity];
//    }
//    return subjectArray;
//}
//
//
//// 学习计划解析
//- (NSMutableArray *)getStudyPlanFromResult:(NSDictionary *)result
//{
//    // 信息及学习计划
//    NSMutableArray *studyPlanInfo = [[NSMutableArray alloc] init];
//    
//    // 周
//    NSString *day = [result objectForKey:@"day"];
//    // 日期
//    NSString *week = [result objectForKey:@"week"];
//    // 信息数组
//    NSMutableArray *infoArray = [[NSMutableArray alloc] init];
//    [infoArray addObject:day];
//    [infoArray addObject:week];
//    
//    // 学习计划
//    if ([result objectForKey:@"studyPlan"] != nil || [result objectForKey:@"studyPlan"] != NULL )
//    {
//        // 以下为学习计划内容
//        NSMutableArray *studyPlanArray = [[NSMutableArray alloc] init];
//        NSDictionary *resultDict = [result objectForKey:@"studyPlan"];
//        // 阶段考试
//        for (NSDictionary *dict in [resultDict objectForKey:@"exam"])
//        {
//            StudyPlanEntity *studyPlan = [[StudyPlanEntity alloc] init];
//            studyPlan.status = 0;
//            studyPlan.testId = [[dict objectForKey:@"id"] intValue];
//            studyPlan.testName = [dict objectForKey:@"testpaper_name"];
//            studyPlan.testPaperId = [[dict objectForKey:@"testpaper_id"] intValue];
//            studyPlan.courseId = [[dict objectForKey:@"course_id"] intValue];
//            studyPlan.chapterId = [[dict objectForKey:@"chapter_id"] intValue];
//            studyPlan.teacherId = [[dict objectForKey:@"teacher_id"] intValue];
//            studyPlan.startDate = [dict objectForKey:@"start_date"];
//            studyPlan.endDate = [dict objectForKey:@"end_date"];
//            studyPlan.courseName = [dict objectForKey:@"course_name"];
//            studyPlan.teacherName = [dict objectForKey:@"teacher_names"];
//            // studyPlan.teacherSpells = [dict objectForKey:@"teacher_spells"];
//            studyPlan.teachers = [dict objectForKey:@"teacher"];
//            studyPlan.teacherId = [[[dict objectForKey:@"teacher"] objectForKey:@"id"] intValue];
//            studyPlan.exite = [dict objectForKey:@"exite"];
//            studyPlan.teacherName = [[dict objectForKey:@"teacher"] objectForKey:@"name"];
//            studyPlan.teacherSpells = [[dict objectForKey:@"teacher"] objectForKey:@"spell"];
//            studyPlan.teacherSex = [[dict objectForKey:@"teacher"] objectForKey:@"sex"];
//            studyPlan.teacherHeadUrl = [[dict objectForKey:@"teacher"] objectForKey:@"img"];
//            studyPlan.teacherStatus = [[dict objectForKey:@"teacher"] objectForKey:@"status"];
//            [studyPlanArray addObject:studyPlan];
//        }
//        
//        // 直播辅导
//        for (NSDictionary *dict  in [resultDict objectForKey:@"learningClass"])
//        {
//            StudyPlanEntity *studyPlan = [[StudyPlanEntity alloc] init];
//            studyPlan.status = 1;
//            studyPlan.startDate = [dict objectForKey:@"start_time"];
//            studyPlan.endDate = [dict objectForKey:@"end_time"];
//            studyPlan.testName = [dict objectForKey:@"title"];
//            studyPlan.courseName = [dict objectForKey:@"course_name"];
//            studyPlan.teachers = [dict objectForKey:@"teacher"];
//            studyPlan.teacherId = [[[dict objectForKey:@"teacher"] objectForKey:@"id"] intValue];
//            studyPlan.exite = [dict objectForKey:@"exite"];
//            studyPlan.teacherName = [[dict objectForKey:@"teacher"] objectForKey:@"name"];
//            studyPlan.teacherSpells = [[dict objectForKey:@"teacher"] objectForKey:@"spell"];
//            studyPlan.teacherSex = [[dict objectForKey:@"teacher"] objectForKey:@"sex"];
//            studyPlan.teacherHeadUrl = [[dict objectForKey:@"teacher"] objectForKey:@"img"];
//            studyPlan.teacherStatus = [[dict objectForKey:@"teacher"] objectForKey:@"status"];
//            [studyPlanArray addObject:studyPlan];
//        }
//        
//        // 直播讲座
//        for (NSDictionary *dict in [resultDict objectForKey:@"lectureLive"])
//        {
//            StudyPlanEntity *studyPlan = [[StudyPlanEntity alloc] init];
//            studyPlan.status = 2;
//            studyPlan.testId = [[dict objectForKey:@"id"] intValue];
//            studyPlan.testName = [dict objectForKey:@"name"];
//            // studyPlan.teacherId = [[dict objectForKey:@"teacher_id"] intValue];
//            studyPlan.startDate = [dict objectForKey:@"day"];
//            studyPlan.endDate = [dict objectForKey:@"day"];
//            studyPlan.startTime = [dict objectForKey:@"start_time"];
//            studyPlan.endTime = [dict objectForKey:@"end_time"];
//            studyPlan.teachers = [dict objectForKey:@"teacher"];
//            studyPlan.teacherId = [[[dict objectForKey:@"teacher"] objectForKey:@"id"] intValue];
//            studyPlan.exite = [dict objectForKey:@"exite"];
//            studyPlan.teacherName = [[dict objectForKey:@"teacher"] objectForKey:@"name"];
//            studyPlan.teacherSpells = [[dict objectForKey:@"teacher"] objectForKey:@"spell"];
//            studyPlan.teacherSex = [[dict objectForKey:@"teacher"] objectForKey:@"sex"];
//            studyPlan.teacherHeadUrl = [[dict objectForKey:@"teacher"] objectForKey:@"img"];
//            studyPlan.teacherStatus = [[dict objectForKey:@"teacher"] objectForKey:@"status"];
//            [studyPlanArray addObject:studyPlan];
//        }
//        [infoArray addObject:[resultDict objectForKey:@"remainingPlanCnt"]];
//        [studyPlanInfo addObject:infoArray];
//        [studyPlanInfo addObject:studyPlanArray];
//    }else{
//        [studyPlanInfo addObject:infoArray];
//    }
//    return studyPlanInfo;
//}
//
//
//#pragma mark - 看课功能解析
//- (NSMutableArray *)getStudyVideoListFromResult:(NSMutableArray *)result
//{
//    // 存储解析的 课程列表
//    NSMutableArray *videoListArray = [[NSMutableArray alloc] init];
//    int i = 0;
//    NSString *vSubjectTmpStr = @"";
//    for (NSDictionary *subDict in result)
//    {
//        VideoSubjectEntity *vSubEntity = [[VideoSubjectEntity alloc] init];
//        vSubEntity.vsubjectId = [[subDict objectForKey:@"sub_id"] intValue];
//        vSubEntity.vsubjectName = [subDict objectForKey:@"sub_name"];
//        NSArray *courseListArray = [subDict objectForKey:@"courseList"];
//        NSString *temp = @"";
//        if (i > 0)
//        {
//            temp = @" union all select ";
//        }
//        i ++;
//        vSubjectTmpStr = [NSString stringWithFormat:@"%@%@%d,'%@'",vSubjectTmpStr,temp,vSubEntity.vsubjectId,vSubEntity.vsubjectName];
//        vSubEntity.vsubjectString = vSubjectTmpStr;
//       
//        NSMutableArray *courseArray = [[NSMutableArray alloc] init];
//        int j = 0;
//        NSString *vCourseTmpStr = @"";
//        for (NSDictionary *courseDict in courseListArray)
//        {
//            VideoCourseEntity *vCourEntity = [[VideoCourseEntity alloc] init];
//            vCourEntity.vsubjectId = vSubEntity.vsubjectId;
//            vCourEntity.stuCouId = [[courseDict objectForKey:@"stuCouId"] intValue];
//            vCourEntity.vcourseId = [[courseDict objectForKey:@"courseId"] intValue];
//            vCourEntity.vcourseName = [courseDict objectForKey:@"courseName"];
//            vCourEntity.vcourseStatus = [[courseDict objectForKey:@"lock_logs_id"] intValue];
//            vCourEntity.vcourseOutOfDays = [[courseDict objectForKey:@"days"] intValue];
//            vCourEntity.isExpCourse = [[courseDict objectForKey:@"is_exp_course"]intValue];
//            NSString *teacherStr = nil;
//            for (NSDictionary *dict in [courseDict objectForKey:@"teacher"])
//            {
//                NSString *str = [NSString stringWithFormat:@"%@#*#%@#*#%@",[dict objectForKey:@"t_id"],[dict objectForKey:@"t_name"],[dict objectForKey:@"t_img"]];
//                if (teacherStr.length > 0) {
//                    teacherStr = [NSString stringWithFormat:@"%@<!:!>%@",teacherStr,str];
//                }else{
//                    teacherStr = str;
//                }
//            }
//            vCourEntity.vcourseTeacherData = teacherStr;
//            vCourEntity.vcourseAllSectionCount = [[courseDict objectForKey:@"chapter_count"] intValue];
//            vCourEntity.vcourseTips = [courseDict objectForKey:@"pre_chapter"];
//            NSString *tempC = @"";
//            if (j > 0)
//            {
//                tempC = @" union all select ";
//            }
//            j ++;
//            vCourseTmpStr = [NSString stringWithFormat:@"%@%@%d,%d,'%@',%d,%d,'%@','%@',%d,%d,%d",vCourseTmpStr,tempC,vSubEntity.vsubjectId,vCourEntity.vcourseId,vCourEntity.vcourseName,vCourEntity.vcourseAllSectionCount,vCourEntity.vcourseOutOfDays,vCourEntity.vcourseTips,vCourEntity.vcourseTeacherData,vCourEntity.vcourseStatus,vCourEntity.stuCouId,vCourEntity.isExpCourse];
//            vCourEntity.vCourseString = vCourseTmpStr;
//            [courseArray addObject:vCourEntity];
//        }
//        vSubEntity.vcourseArray = [NSMutableArray arrayWithArray:courseArray];
//        [videoListArray addObject:vSubEntity];
//    }
//    return videoListArray;
//}
//
//
//#pragma mark 看课详情解析
//- (VideoCourseEntity *)getStudyVideoDetailFromResult:(NSDictionary *)result
//{
//    VideoCourseEntity *vCourseEntity = [[VideoCourseEntity alloc] init];
//    vCourseEntity.vcourseId = [[result objectForKey:@"courseId"] intValue];
//    vCourseEntity.vcourseName = [result objectForKey:@"courseName"];
//    vCourseEntity.vcourseOutOfDays = [[result objectForKey:@"days"] intValue];
//    vCourseEntity.vcourseStatus = [[result objectForKey:@"lock_logs_id"] intValue];
//    vCourseEntity.vcourseAlreadyOnlineCount = [[result objectForKey:@"chapterOnlineCount"] intValue];
//    vCourseEntity.vcourseAllSectionCount = [[result objectForKey:@"sectionCount"] intValue];
//    vCourseEntity.vcourseLastStudySection = [[result objectForKey:@"sectionId"] intValue];
//    vCourseEntity.vcourseLastStudyChapter = [[result objectForKey:@"chapterId"] intValue];
//    vCourseEntity.vcourseStudyPercent = [[result objectForKey:@"studyPercent"] intValue];
//    return vCourseEntity;
//}
//
//// 播放列表大纲解析(节信息解析)
//- (NSMutableArray *)getCourseOutLineFromResult:(NSMutableArray *)result
//{
//    NSMutableArray *sectionArray = [NSMutableArray array];
//    NSMutableArray *tenSectionArray;
//    int i = 0;
//    int j = 0;
//    for (NSDictionary *courseDict in result) {
//       
//        if (i== 0) {
//            
//        tenSectionArray = [NSMutableArray array];
//        }
//        VideoChapterEntity *chapterEntity = [[VideoChapterEntity alloc]init];
//        chapterEntity.vchapterId = [[courseDict objectForKey:@"chapterId"] intValue];
//        chapterEntity.vchapterName = [courseDict objectForKey:@"name"];
//        chapterEntity.chapterNumber = [[courseDict objectForKey:@"sort"]intValue];
//        
//        NSArray *sections = [courseDict objectForKey:@"sectionList"];
//        for (NSDictionary *sectionDict in sections) {
//            
//            VideoSectionEntity *sectionEntity = [[VideoSectionEntity alloc]init];
//            sectionEntity.vchapterId = [[courseDict objectForKey:@"chapterId"] intValue];
//            sectionEntity.vsectionId = [[sectionDict objectForKey:@"id"]intValue];
//            sectionEntity.vsectionName = [sectionDict objectForKey:@"name"];
//            sectionEntity.vsectionIsfinished = [[sectionDict objectForKey:@"isStudy"] intValue];
//            [chapterEntity.sectionList addObject:sectionEntity];
//        }
//        [tenSectionArray addObject:chapterEntity];
//        
//        if (tenSectionArray.count == 10 || j==result.count-1) {
//            
//            [sectionArray addObject:tenSectionArray];
//             
//            i = 0;
//       
//        }else{
//          
//            i++;
//        }
//        j++;
//    }
//    return sectionArray;
//}
//
//// 互动题解析
//-  (NSMutableArray *)getInteractiveQuestionsFromResult:(NSMutableArray* )result
//{
//
//    NSMutableArray *questionArray = [NSMutableArray array];
//    for (NSDictionary *questionDict in result) {
//        
//        VideoQuestionEntity *videoQuestionEntity = [[VideoQuestionEntity alloc]init];
//        videoQuestionEntity.vquestionId = [[questionDict objectForKey:@"id"]intValue];
//        videoQuestionEntity.vquestionTitle = [questionDict objectForKey:@"name"];
//        videoQuestionEntity.vquestionResourcesUrl = [questionDict objectForKey:@"content"];
//        videoQuestionEntity.vquestionAnswer = [questionDict objectForKey:@"answer"];
//        videoQuestionEntity.vquestionInsertTime = [questionDict objectForKey:@"time"];
//        [questionArray addObject:videoQuestionEntity];
//    }
//    return questionArray;
//}
//
//// 学到1分钟，金币提示解析
//- (NSAttributedString *)getGlodFormResult:(NSDictionary *)result
//{
//    NSString *goldStr =[NSString stringWithFormat:@"%ld",[[result objectForKey:@"gold"] longValue]];
//    // 将string 转成attributedString
//    NSMutableAttributedString * goldString = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"恭喜你，获得了%@枚金币，",goldStr]];
//    // 设置整个goldString字体颜色
//    [goldString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, goldString.length)];
//    // 设置指定字符串的字体颜色
//    [goldString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:1.00f green:0.98f blue:0.00f alpha:1.00f] range:NSMakeRange(7, goldStr.length)];
//    
//    if ([result.allKeys containsObject:@"exp"]) {
//        
//        NSString *expStr = [NSString stringWithFormat:@"%ld",[[result objectForKey:@"exp"] longValue]];
//        NSMutableAttributedString *expAttributeStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@学力！",expStr]];
//        [expAttributeStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, expAttributeStr.length)];
//        [expAttributeStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:1.00f green:0.98f blue:0.00f alpha:1.00f] range:NSMakeRange(0, expStr.length)];
//        // 将字符串进行拼接
//        [goldString appendAttributedString:expAttributeStr];
//    }else if([result.allKeys containsObject:@"curLevel"]){
//    
//        NSString *curLevelStr = [NSString stringWithFormat:@"%ld",[[result objectForKey:@"curLevel"] longValue]];
//        NSMutableAttributedString *curLevelAttributeStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"升到了%@级！",curLevelStr]];
//        [curLevelAttributeStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, curLevelAttributeStr.length)];
//        [curLevelAttributeStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:1.00f green:0.98f blue:0.00f alpha:1.00f] range:NSMakeRange(3, curLevelStr.length)];
//        
//        [goldString appendAttributedString:curLevelAttributeStr];
//    }
//    // 设置字号
//    [goldString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14.0f] range:NSMakeRange(0, goldString.length)];
//    
//    return goldString;
//}
//
//#pragma mark - ---------------发现 - 课程中心----------------
//// 1.课程筛选条件接口
//- (NSDictionary *)getGradeSubjectFromResult:(NSDictionary *)result{
//    
//    NSMutableDictionary *returnDic = [NSMutableDictionary dictionary];
//    
//    // 年级 学科
//    NSArray *gradeValues = result[@"grade"] == NULL ? nil : result[@"grade"];
//    NSMutableArray *grades = [NSMutableArray array];
//    for (NSDictionary *tmpGrade in gradeValues) {
//        BuyGradeEntity *grade = [[BuyGradeEntity alloc] init];
//        grade.gradeId = [tmpGrade[@"gradeId"] intValue];
//        grade.gradeName = tmpGrade[@"gradeName"];
//        grade.buySubjects = [NSMutableArray array];
//        for (NSDictionary *tmpSubject in tmpGrade[@"subjectList"]) {
//            BuySubjectEntity *subject = [[BuySubjectEntity alloc] init];
//            subject.subjectId = [tmpSubject[@"subjectId"] intValue];
//            subject.subjectName = tmpSubject[@"subjectName"];
//            [grade.buySubjects addObject:subject];
//        }
//        [grades addObject:grade];
//    }
//    if (grades.count > 0) {
//        [returnDic setObject:grades forKey:@"grade"];
//    }
//    
//    // 排序信息
//    NSArray *sortValues = result[@"sort"] == NULL ? nil : result[@"sort"];
//    NSMutableArray *sorts = [NSMutableArray array];
//    for (NSDictionary *tmpSort in sortValues) {
//        BuySortEntity *sort = [[BuySortEntity alloc] init];
//        sort.sortId = [tmpSort[@"sortId"] intValue];
//        sort.sortName = tmpSort[@"sortName"];
//        [sorts addObject:sort];
//    }
//    if (sorts.count > 0) {
//        [returnDic setObject:sorts forKey:@"sort"];
//    }
//    
//    // 当前用户年级
//    [returnDic setObject:result[@"userGrade"] forKey:@"userGrade"];
//    
//    return returnDic;
//    
//}
//// 2.课程列表接口
//- (NSDictionary *)getCourseListFromResult:(NSDictionary *)result{
//    
//    NSMutableDictionary *returnDic = [NSMutableDictionary dictionary];
//    
//    NSArray *listValues = result[@"list"] == NULL ? nil : result[@"list"];
//    NSMutableArray *courses = [NSMutableArray array];
//    for (NSDictionary *tmpCourse in listValues) {
//        BuyCourseEntity *course = [[BuyCourseEntity alloc] init];
//        course.courseID = tmpCourse[@"id"];
//        course.courseName = tmpCourse[@"name"];
//        course.subjectName = tmpCourse[@"subject_name"];
//        course.teacherName = tmpCourse[@"teacher_name"];
//        course.teacherImg = tmpCourse[@"teacher_img"];
//        course.tryLearnCount = [tmpCourse[@"clickNum"] intValue];
//        course.studentCount = [tmpCourse[@"buyNum"] intValue];
//        course.price = [tmpCourse[@"price"] intValue];
//        course.isWillfulPurchase = NO;//[tmpCourse[@"is_willful_purchase"]boolValue];
//        [courses addObject:course];
//    }
//    [returnDic setObject:courses forKey:@"list"];
//    
//    [returnDic setObject:result[@"countPage"] forKey:@"countPage"];
//    
//    return returnDic;
//    
//}
//// 4.学币收支列表
//- (NSDictionary *)getLearnCoinRecords:(NSDictionary *)result{
//    
//    NSMutableDictionary *returnDic = [NSMutableDictionary dictionary];
//    
//    NSArray *listValues = result[@"list"] == NULL ? nil : result[@"list"];
//    NSMutableArray *records = [NSMutableArray array];
//    for (NSDictionary *tmpRecord in listValues) {
//        XBBalanceEntity *record = [[XBBalanceEntity alloc] init];
//        record.balanceTypeName = tmpRecord[@"type_name"];
//        record.balanceDate = [tmpRecord[@"create_time"] doubleValue];
//        record.balanceAmount = tmpRecord[@"num"];
//        [records addObject:record];
//    }
//    
//    [returnDic setObject:records forKey:@"list"];
//    
//    [returnDic setObject:result[@"countPage"] forKey:@"countPage"];
//    [returnDic setObject:result[@"currentCoin"] forKey:@"currentCoin"];
//    return returnDic;
//    
//}
//// IAP支付课程详情数据解析
//- (BuyCourseEntity *)getIAPCourseDetailFromResult:(NSDictionary *)result
//{
//    BuyCourseEntity *buyCourseEntity = [[BuyCourseEntity alloc]init];
//    buyCourseEntity.courseID = [result objectForKey:@"id"];
//    buyCourseEntity.courseName = [result objectForKey:@"course_name"];
//    buyCourseEntity.online = [[result objectForKey:@"status"] intValue];
//    buyCourseEntity.canBuy = [[result objectForKey:@"is_nosale"] intValue];
//    buyCourseEntity.price = [[result objectForKey:@"price"] intValue];
//    buyCourseEntity.teacherName = [result objectForKey:@"teacher_name"];
//    buyCourseEntity.teacherImg = [result objectForKey:@"teacher_img"];
//    buyCourseEntity.tryLearnCount = [[result objectForKey:@"clickNum"] intValue];
//    buyCourseEntity.studentCount = [[result objectForKey:@"buyNum"] intValue];
//    
//    NSMutableArray *syllabusArray = [NSMutableArray array];
//    for (NSDictionary *dict in [result objectForKey:@"syllabus"]) {
//        
//        NSString *name = [dict objectForKey:@"name"];
//        [syllabusArray addObject:name];
//    }
//    buyCourseEntity.outLineItems = syllabusArray;
//    buyCourseEntity.tryVideoUrl = [result objectForKey:@"auditionUrl"];
//    buyCourseEntity.detailsUrl = [result objectForKey:@"description"];
//    return buyCourseEntity;
//}
//
//// 解析修改作业
//- (HomeWorkEntity *)getCollectedWork:(NSDictionary *)result
//{
//    HomeWorkEntity *homeE = [[HomeWorkEntity alloc] init];
//    homeE.servicePackID = [[result objectForKey:@"stu_packs_id"] intValue];
//    homeE.couserID = [[result objectForKey:@"course_id"] intValue];
//    homeE.homeWorkID = [[result objectForKey:@"work_id"] intValue];
//    homeE.correctVoice = [result objectForKey:@"vedio_url"];
//    homeE.goaldCount = [[result objectForKey:@"gold_num"] intValue];
//    homeE.teacherInfo = [NSString stringWithFormat:@"%@##%@##%@##%@",[result objectForKey:@"teacher_id"],[result objectForKey:@"teacher_name"],[result objectForKey:@"teacher_img"],[result objectForKey:@"tea_comment"]];
//    homeE.evaluationContent = [result objectForKey:@"content"];
//    homeE.evaluationStar = [[result objectForKey:@"star"] intValue];
//    
//    NSMutableArray *corectedImgUrlA = [[NSMutableArray alloc] init];
//    for (NSString *correctedImgUrl in [result objectForKey:@"work_img_url"])
//    {
//        HomeWorkCorrectEntity *correctEntity = [[HomeWorkCorrectEntity alloc] init];
//        correctEntity.bigImgUrl = correctedImgUrl;
//        correctEntity.smallImgUrl = [self getSmallImgUrl:correctedImgUrl];
//        correctEntity.homeWorkID = homeE.homeWorkID;
//        correctEntity.servicePacksId = homeE.servicePackID;
//        correctEntity.couserID = homeE.couserID;
//        [corectedImgUrlA addObject:correctEntity];
//    }
//    homeE.homeWorkCorrectArray = [NSMutableArray arrayWithArray:corectedImgUrlA];
//    return homeE;
//}
@end
