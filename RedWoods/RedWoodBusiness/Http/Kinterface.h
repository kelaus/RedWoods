//
//  Kinterface.h
//  ParentsCommunity
//
//  Created by 李家龙 on 14/11/24.
//  Copyright (c) 2014年 张 诗杰. All rights reserved.
//

// 本地测试使用
//#define HTTP_HOST            @"http://www.jzh.com/"
#define HTTP_HOST_TEST           @"http://www.newjzh.com/"
// 线上使用
#define HTTP_HOST               @"http://laoshi.xueersi.com/"
#define HTTP_TOUCH              @"http://touch.xueersi.com/"
#define HTTP_XES_WEB              @"http://www.xueersi.com/"

#pragma mark --------------------- HTTP_HOST域名接口 ---------------------
#define loginURL                (HTTP_HOST@"Users/login")
#define reloginURL              (HTTP_HOST@"Users/relogin")
#define registerURL             (HTTP_HOST@"Users/register")
#define completeInfoURL         (HTTP_HOST@"Users/completeInfo")
#define uploadThunmbnailURL     (HTTP_HOST@"Users/UploadThunmbnail")
#define getRoomListURL          (HTTP_HOST@"Rooms/getRoomLists")
#define uploadMsgImgURL         (HTTP_HOST@"Rooms/uploadMsgImg")
#define joinRoomURL             (HTTP_HOST@"Rooms/joinRoom")
#define applyJoinRoomURL        (HTTP_HOST@"Rooms/applyJoinRoom")
#define exitRoomURL             (HTTP_HOST@"Rooms/exitRoom")
#define roomMsgURL              (HTTP_HOST@"Rooms/uploadMsgImg")
#define getHistoryMegURL        (HTTP_HOST@"Rooms/getHistoryMsg")
#define lookMaterialsNumURL     (HTTP_HOST@"Rooms/lookMaterialsNum")
#define addCollectNumURL        (HTTP_HOST@"Rooms/addCollectNum")
#define cancelCollectNumURL     (HTTP_HOST@"Rooms/cancelCollectNum")
#define getRoomURL              (HTTP_HOST@"Rooms/getRoomInfoById")
#define getAdvertsURL           (HTTP_HOST@"Adverts/findAdvert")

// 1.获取群资料列表
#define getDatumListURL         (HTTP_HOST@"Datum/datumList")
// 2.点击资料
#define clickDatumURL           (HTTP_HOST@"Datum/clickDatum")
// 3.收藏文件
#define collectDatumURL         (HTTP_HOST@"Datum/collect")
// 4.获取收藏列表
#define getCollectListURL         (HTTP_HOST@"Datum/collectList")
// 5.取消收藏
#define cancleCollectURL         (HTTP_HOST@"Datum/cancelCollect")
// 6.资料提醒接口
#define getSpaceDatumNumURL      (HTTP_HOST@"Datum/getSpaceDatumNum")
// 7.统计资料的分享接口
#define getStatDatumShareNumURL   (HTTP_HOST@"Datum/statDatumShareNum")
// 8. 文件资料分享接口
#define shareURL                 (HTTP_HOST@"share/datum/")
// 9. 给出评价
#define suggestURL                (HTTP_HOST@"Users/goEvaluate")
// 12.设置家长身份
#define setPatriarchIdentityURL  (HTTP_HOST@"Users/addIdentity")
// 13.获取作业作文信息列表
#define getHomeWorkListURL       (HTTP_HOST@"HomeWork/couWorkList")
// 14.交作业接口http://www.jzh.com/
#define upLoadHomeWorkURL        (HTTP_HOST@"HomeWork/uploadWork")
// 17.看课（我的课程）
#define getStudyVideoListURL     (HTTP_HOST@"AppNativeStudy/learnCourseList")
// 18.我的课程详情页
#define getStudyVideoDetailURL   (HTTP_HOST@"AppNativeStudy/courseDetails")
// 19.互动题接口
#define getInteractiveQuestionURL (HTTP_HOST @"AppNativeStudy/getTestInfo")
// 20.播放列表信息
#define getCourseOutLineURL        (HTTP_HOST @"AppNativeStudy/courseOutLine")
// 21.保存互动题
#define getSaveInteractiveQuestionURL (HTTP_HOST@"Video/saveTestRecord")
// 22.本节学完
#define getStudyFinishedURL (HTTP_HOST@"Video/gainStudyOperate")


#pragma mark --------------------- 发现 - 课程中心 ---------------------
// 1.课程筛选条件接口
#define getGradeSubjectURL (HTTP_HOST@"AppIosCourse/getGradeSubject")
// 2.课程列表接口
#define getCourseListURL (HTTP_HOST@"AppIosCourse/getCourseList")
// 3.IAP支付课程详情
#define getIAPCourseDetail (HTTP_HOST@"AppIosCourse/detail")
// 4.获取学币接口
#define getLearnCoinURL (HTTP_HOST@"AppIosCourse/getLearnCoinByStuId")
// 5.学币收支列表
#define getlearnCoinRecordsURL (HTTP_HOST@"AppIosCourse/learnCoinRecords")
// 6.发送交易凭证给服务端接口
#define sendReceiptToServerURL (HTTP_HOST@"AppIosCourse/getReceiptData")
// 7.获取订单号
#define getOrderNUmberURL (HTTP_HOST@"AppIosCourse/addIosOrder")


#pragma mark --------------------- 发现 - 网校作业二期添加-------------
// 1.作业批改接口http://jzh.xueersi.com/HomeWork/lookCorrectionWork
#define correctWorkURL           (HTTP_HOST@"HomeWork/lookCorrectionWork")
// 2.老师批改作业评价接口http://jzh.xueersi.com/HomeWork/addEvaluation
#define evaluationURL            (HTTP_HOST@"HomeWork/addEvaluation")


#pragma mark --------------------- HTTP_TOUCH域名接口 ---------------------
// 1. 学习动态数据接口
//#define studyReportURL            (HTTP_TOUCH@"StudyReports/lists")
#define studyReportURL            (HTTP_HOST@"TouchStudy/lists")

// 2. 学习动态有无新数据接口
//#define newStudyReportURL        (HTTP_TOUCH@"StudyReports/isnewdata")
#define newStudyReportURL        (HTTP_HOST@"TouchStudy/isnewdata")

// 3.周学习动态接口
//#define weekLearningURL           (HTTP_TOUCH@"StudyReports/details")
#define weekLearningURL           (HTTP_HOST@"TouchStudy/details")

// 4.学习计划
//#define getStudyPlanURL          (HTTP_TOUCH@"StudyPlans/lists")
#define getStudyPlanURL           (HTTP_HOST@"TouchStudy/studyPlans")


#pragma mark --------------------- HTTP_XES_WEB域名接口 ---------------------
// 1.课程中心 - 学币购课接口
//#define buyCourseByXBURL        (HTTP_XES_WEB @"IosPays/pay")
#define buyCourseByXBURL        (HTTP_HOST@"IosPays/pay")


#pragma mark --------------------- 其他域名接口 ---------------------
#define uploadMediaURL          (@"http://jzh.xueersi.com/Media/upload/")
#define getMedalsURL              @"http://www.xueersi.com/AxhInterface/getGoldById")

