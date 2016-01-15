//
//  OrderDetailViewController.m
//  RedWoodBusiness
//
//  Created by JunLee on 16/1/11.
//  Copyright © 2016年 Jun Li. All rights reserved.
//




#import "OrderDetailViewController.h"
#import "HttpClient.h"
#import "OrderDetailModel.h"
#import "MJExtension.h"
#import <QuartzCore/QuartzCore.h>

#import "ChangeFeeViewController.h"
#import "OrderHandleViewController.h"

//view.layer.borderColor = [UIColor redColor].CGColor;
//view.layer.borderWidth = 3;
@interface OrderDetailViewController ()

//ScrollView需要下面👇两个
@property (nonatomic,strong)UIScrollView *myScrollView;
@property (nonatomic,strong)UIView *container;

//=======headView
@property (nonatomic,strong)NSString* myorderID;
@property (nonatomic,strong)NSString* myOrderStatus;

@property (nonatomic,strong)UIView* headView;
@property (nonatomic,strong)UIView* navView;

@property (nonatomic,strong)UILabel *ObjectName;
@property (nonatomic,strong)UILabel *Price;
@property (nonatomic,strong)UILabel *Count;

@property (nonatomic,strong)UILabel *orderStatusLbl;
@property (nonatomic,strong)UILabel *danjiaLbl;
@property (nonatomic,strong)UILabel *shuliangLbl;

@property (nonatomic,strong)UIImageView *imageV;
// =========== 收货人

@property (nonatomic,strong)UIView* consigneeView;
@property (nonatomic,strong)UILabel* shTitleLbl;
@property (nonatomic,strong)UILabel *xmLbl;
@property (nonatomic,strong)UILabel *sjhLbl;
@property (nonatomic,strong)UILabel *shdzLbl;

@property (nonatomic,strong)UILabel *name;
@property (nonatomic,strong)UILabel *tel;
@property (nonatomic,strong)UILabel *address;
// =========== 订单信息
@property (nonatomic,strong)UIView *orderInfoView;
@property (nonatomic,strong)UILabel *orderTileLbl;
@property (nonatomic,strong)UILabel *ddhLbl;
@property (nonatomic,strong)UILabel *xdsjLbl;
@property (nonatomic,strong)UILabel *jdztLbl;
@property (nonatomic,strong)UILabel *fkfsLbl;
@property (nonatomic,strong)UILabel *fksjLbl;
@property (nonatomic,strong)UILabel *bzLbl;

@property (nonatomic,strong)UILabel *OrderID;
@property (nonatomic,strong)UILabel *CreateTime;
@property (nonatomic,strong)UILabel *OrderStatus;
@property (nonatomic,strong)UILabel *PayType;
@property (nonatomic,strong)UILabel *PayTime;
@property (nonatomic,strong)UILabel *Remark;//备注

//跳转按钮
@property (nonatomic,strong)UIButton *gotoBtn;
@property (nonatomic,strong)OrderDetailModel *orderDetailM;
@property (nonatomic,strong)OderDetailList * orderlistM;

@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getOderDetailWithOrderID:self.myorderID];
    [self creatUI];
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [self layoutUI];
    
}

-(OrderDetailViewController*)initWithOrderID:(NSString *)myID OrderStaus:(NSString*)myOderStaus{

    self.myorderID = myID;
    self.myOrderStatus = myOderStaus;
    return self;
    
}

-(void)getOderDetailWithOrderID:(NSString*)oderStatus{
    
    NSMutableDictionary *paratemer = [[NSMutableDictionary alloc]init];
   
    NSString *url = [NSString stringWithFormat:@"%@/api/OrderInfo/Get/%@",HTTP_HOST,self.myorderID];
    HttpClient* _httpClient=[[HttpClient alloc]init];
    [_httpClient requestURL:url requestType:requestType_GET params:paratemer dataParameters:nil async:YES responseDataBlock:^(ResponseEntity *rEntity) {
        switch (rEntity.status)
        {
            case 0:
            {
              //  NSLog(@"%@",rEntity.result);
            
                //解析第一层
                NSArray *OrderDetailModelArray = [OrderDetailModel objectArrayWithKeyValuesArray:[NSArray arrayWithObject:rEntity.result]];
                _orderDetailM = [OrderDetailModelArray lastObject];
                
                //解析第二层
                NSArray* OderDetailListArray = [rEntity.result objectForKey:@"OrderDetailList"];
                
                NSArray* OderDetailListModelArray = [OderDetailList objectArrayWithKeyValuesArray:OderDetailListArray];
                _orderlistM = [OderDetailListModelArray lastObject];
                
                [self giveDataToView];
            
            }
                break;
            case 1:case 2:case 3:
            {
                
            }
                break;
                
            default:
                break;
        }
    }];
    
}

-(void)giveDataToView{
    
    _ObjectName.text = _orderlistM.ObjectName;
    _Price.text = _orderlistM.Price;
    _Count.text = _orderlistM.Count;
    //收货人信息
    _name.text = _orderDetailM.Name;
    _tel.text = _orderDetailM.Mobile;
    _address.text = _orderDetailM.ConsigneeAddr;
    //订单信息
    _OrderID.text =  [NSString stringWithFormat:@"%@",_orderDetailM.OrderID];
    _CreateTime.text = _orderDetailM.CreateTime;
    _OrderStatus.text = [NSString stringWithFormat:@"%@",_orderDetailM.OrderStatus];
    _PayType.text = [NSString stringWithFormat:@"%@",_orderDetailM.PayType] ;// ==nil? @" " : _orderDetailM.PayType;
    _PayTime.text = _orderDetailM.PayTime;
    _Remark.text = _orderDetailM.Remark;

}


-(void)creatUI{
    
    _myScrollView = ({
        UIScrollView *view = [UIScrollView new];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {

            make.edges.equalTo(self.view);

        }];
        view.backgroundColor = [UtilityHelper colorWithHexString:KLableBackGroudColor];
        view;
    });
    
    _container = ({
        UIView *view = [UIView new];
        [_myScrollView addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {

            make.edges.equalTo(_myScrollView);
//            make.left.equalTo(_myScrollView.left);
//            make.right.equalTo(_myScrollView.right);
    
            make.width.equalTo(self.view.mas_width);
            
        }];
        
         view.backgroundColor = [UtilityHelper colorWithHexString:KScrollViewBackColor];
        view;
    });
    
    
    _headView = [[UIView alloc] init];
    _headView.layer.borderColor = [UtilityHelper colorWithHexString:KBorderColor].CGColor;
    _headView.layer.borderWidth = 1;
    [_myScrollView addSubview:_headView];
    [_headView makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(_myScrollView.mas_top).offset(7); //距离navView 7px
        make.right.equalTo(_myScrollView).offset(0);
        make.left.equalTo(_myScrollView).offset(0);
        make.height.equalTo(@78);
    }];
    
    _consigneeView = [[UIView alloc] init];
    //    _consigneeView.backgroundColor = [UIColor yellowColor];
    _consigneeView.layer.borderColor = [UtilityHelper colorWithHexString:KBorderColor].CGColor;
    _consigneeView.layer.borderWidth = 1;
    [_myScrollView addSubview:_consigneeView];
    
    [_consigneeView makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_headView.mas_bottom).offset(10); //距离navView 7px
        make.right.equalTo(_myScrollView).offset(0);
        make.left.equalTo(_myScrollView).offset(0);
        make.height.equalTo(@170);
    }];
    
        _orderInfoView = [[UIView alloc] init];
        //    _consigneeView.backgroundColor = [UIColor yellowColor];
        _orderInfoView.layer.borderColor = [UtilityHelper colorWithHexString:KBorderColor].CGColor;
        _orderInfoView.layer.borderWidth = 1;
        [_myScrollView addSubview:_orderInfoView];
    [_orderInfoView makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_consigneeView.mas_bottom).offset(10);
        
        make.right.equalTo(_myScrollView).offset(0);
        make.left.equalTo(_myScrollView).offset(0);
        make.height.mas_equalTo(@(300));//(@240);
    }];
    
    //更新可以滑动的范围
    [_container mas_updateConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(_headView.mas_top);
        make.bottom.equalTo(_orderInfoView.mas_bottom);

    }];
 // ========== 订单概述 ＝＝＝＝＝＝＝＝＝＝＝＝＝
    _imageV  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"红木宝首页logo" ]];
    [_headView addSubview:_imageV];
    [_imageV makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_headView).offset(5);
        make.bottom.equalTo(_headView).offset(-5);
        
        make.left.equalTo(_headView).offset(12);
//        make.height.equalTo(@40);
        make.width.equalTo(@40);
    }];
    
    _ObjectName = [[UILabel alloc ]init];
    _ObjectName.backgroundColor = [UtilityHelper colorWithHexString:KLableBackGroudColor];
     [_headView addSubview:_ObjectName];
   
    _orderStatusLbl = [[UILabel alloc ]init];
    _orderStatusLbl.backgroundColor = [UtilityHelper colorWithHexString:KLableBackGroudColor];
    [_headView addSubview:_orderStatusLbl];

    
    _Price = [[UILabel alloc ]init];
    _Price.backgroundColor = [UtilityHelper colorWithHexString:KLableBackGroudColor];
    [_headView addSubview:_Price];
    
    _Count = [[UILabel alloc ]init];
   
    _Count.backgroundColor = [UtilityHelper colorWithHexString:KLableBackGroudColor];
    [_headView addSubview:_Count];
    
    _danjiaLbl = [[UILabel alloc ]init];
    _danjiaLbl.text = @"单价：";
    _danjiaLbl.backgroundColor = [UtilityHelper colorWithHexString:KLableBackGroudColor];
    [_headView addSubview:_danjiaLbl];
    
    _shuliangLbl = [[UILabel alloc ]init];
    _shuliangLbl.text = @"数量：";
    _shuliangLbl.backgroundColor = [UtilityHelper colorWithHexString:KLableBackGroudColor];
    [_headView addSubview:_shuliangLbl];
// ============ 收货人信息



   _shTitleLbl= [self addlabelToSuperView:_consigneeView text:@"收货人信息" textColor:[UtilityHelper colorWithHexString:KLableTitleColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon   LineNum:1 textAlignment:NSTextAlignmentLeft];
    
    _xmLbl= [self addlabelToSuperView:_consigneeView text:@"姓名：" textColor:[UtilityHelper colorWithHexString:KLableTitleColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon   LineNum:1 textAlignment:NSTextAlignmentLeft];
    
    _sjhLbl = [self addlabelToSuperView:_consigneeView text:@"手机号：" textColor:[UtilityHelper colorWithHexString:KLableTitleColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon  LineNum:1 textAlignment:NSTextAlignmentLeft];
    
    _shdzLbl = [self addlabelToSuperView:_consigneeView text:@"收货地址：" textColor:[UtilityHelper colorWithHexString:KLableTitleColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon  LineNum:1 textAlignment:NSTextAlignmentLeft];
    
    _name= [self addlabelToSuperView:_consigneeView text:@"" textColor:[UtilityHelper colorWithHexString:KLableCommonColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon LineNum:1 textAlignment:NSTextAlignmentRight];
    
    _tel= [self addlabelToSuperView:_consigneeView text:@"" textColor:[UtilityHelper colorWithHexString:KLableCommonColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon LineNum:1 textAlignment:NSTextAlignmentRight];
   
    _address= [self addlabelToSuperView:_consigneeView text:@"" textColor:[UtilityHelper colorWithHexString:KLableCommonColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor]  fontSize:KTextFONTSIZECommon LineNum:0 textAlignment:NSTextAlignmentRight];
    
// ============订单信息 ＝＝＝＝＝＝＝＝＝＝＝＝
 
    _orderTileLbl = [self addlabelToSuperView:_orderInfoView text:@"订单信息:" textColor:[UtilityHelper colorWithHexString:KLableTitleColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon   LineNum:1 textAlignment:NSTextAlignmentLeft];
    _ddhLbl = [self addlabelToSuperView:_orderInfoView text:@"订单编号:" textColor:[UtilityHelper colorWithHexString:KLableTitleColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon   LineNum:1 textAlignment:NSTextAlignmentLeft];
    _xdsjLbl= [self addlabelToSuperView:_orderInfoView text:@"下单时间:" textColor:[UtilityHelper colorWithHexString:KLableTitleColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon   LineNum:1 textAlignment:NSTextAlignmentLeft];
   _jdztLbl= [self addlabelToSuperView:_orderInfoView text:@"订单状态:" textColor:[UtilityHelper colorWithHexString:KLableTitleColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon   LineNum:1 textAlignment:NSTextAlignmentLeft];
    _fkfsLbl= [self addlabelToSuperView:_orderInfoView text:@"付款方式:" textColor:[UtilityHelper colorWithHexString:KLableTitleColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon   LineNum:1 textAlignment:NSTextAlignmentLeft];
    _fksjLbl= [self addlabelToSuperView:_orderInfoView text:@"付款时间:" textColor:[UtilityHelper colorWithHexString:KLableTitleColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon   LineNum:1 textAlignment:NSTextAlignmentLeft];
    _bzLbl= [self addlabelToSuperView:_orderInfoView text:@"备注：" textColor:[UtilityHelper colorWithHexString:KLableTitleColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon   LineNum:1 textAlignment:NSTextAlignmentLeft];
    
    _OrderID= [self addlabelToSuperView:_orderInfoView text:@"" textColor:[UtilityHelper colorWithHexString:KLableCommonColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon LineNum:1 textAlignment:NSTextAlignmentRight];
    _CreateTime= [self addlabelToSuperView:_orderInfoView text:@"" textColor:[UtilityHelper colorWithHexString:KLableCommonColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon LineNum:1 textAlignment:NSTextAlignmentRight];
    _OrderStatus= [self addlabelToSuperView:_orderInfoView text:@"" textColor:[UtilityHelper colorWithHexString:KLableCommonColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon LineNum:1 textAlignment:NSTextAlignmentRight];
    _PayType= [self addlabelToSuperView:_orderInfoView text:@"" textColor:[UtilityHelper colorWithHexString:KLableCommonColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon LineNum:1 textAlignment:NSTextAlignmentRight];
    _PayTime= [self addlabelToSuperView:_orderInfoView text:@"" textColor:[UtilityHelper colorWithHexString:KLableCommonColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon LineNum:1 textAlignment:NSTextAlignmentRight];
   _Remark= [self addlabelToSuperView:_orderInfoView text:@"" textColor:[UtilityHelper colorWithHexString:KLableCommonColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon LineNum:1 textAlignment:NSTextAlignmentRight];//备注
    
    //创建按钮
//    CGSize size = CGSizeMake(100, 30);
    UIButton *btn = [[UIButton alloc] init];
    btn.backgroundColor = [UIColor redColor];
    [_myScrollView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_orderInfoView.mas_bottom).offset(10);
        make.centerX.equalTo(_myScrollView);
//        make.size.equalTo(size);
        
                    make.height.equalTo(@100);
                    make.width.equalTo(@100);
        
        
    }];
    [btn layoutIfNeeded];
    //            btn;
    //        });
    //更新可以滑动的范围
    [_container mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_headView.top);
        make.bottom.equalTo(btn.mas_bottom).offset(100);
        
    }];
    
    if([_myOrderStatus isEqualToString:@"10337"]){
        
        [self addbtnlabelToSuperView:btn text:@"处理订单" textColor:[UtilityHelper colorWithHexString:KLableTitleColor] backgroundColor:[UIColor clearColor] fontSize:KFONTSIZEHomeTitle LineNum:0 textAlignment:NSTextAlignmentCenter];

        _orderStatusLbl.text = @"[待处理]";
//        btn.titleLabel.text = @"处理订单";
        [btn addTarget:self action:@selector(gotoOrderHandle) forControlEvents:UIControlEventTouchUpInside];
        
        
    }else{
        _orderStatusLbl.text = @"[已完成]";
        
        [self addbtnlabelToSuperView:btn text:@"修改运费" textColor:[UtilityHelper colorWithHexString:KLableTitleColor] backgroundColor:[UIColor clearColor] fontSize:KFONTSIZEHomeTitle LineNum:0 textAlignment:NSTextAlignmentCenter];
        
        [btn addTarget:self action:@selector(gotoChangeFee) forControlEvents:UIControlEventTouchUpInside];
    }

}

//布局

-(void)layoutUI{
//headView
    //订单 商品名
    [_ObjectName makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_imageV).offset(3);
        make.left.equalTo(_imageV.right).offset(12);
        make.height.equalTo(@25);
        make.width.equalTo(@200);
        
    }];
    //订单状态
    [_orderStatusLbl makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(_ObjectName);
        
        make.right.equalTo(_headView).offset(-12);
        make.height.equalTo(@25);
        make.width.equalTo(@60);
        
    }];
    
    [_danjiaLbl makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_ObjectName.bottom).offset(10);
        make.left.equalTo(_ObjectName.left).offset(0);
        make.height.equalTo(@25);
        make.width.equalTo(@55);
    }];
    
    [_Price makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(_danjiaLbl);
        make.left.equalTo(_danjiaLbl.right).offset(1);
        make.height.equalTo(@25);
        make.width.equalTo(@100);
    }];
    
    
    [_shuliangLbl makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(_danjiaLbl);
        make.left.equalTo(_Price.right).offset(20); //在 价钱 右边
        make.height.equalTo(@25);
        make.width.equalTo(@55);
    }];
    
    [_Count makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(_shuliangLbl);
        make.left.equalTo(_shuliangLbl.right).offset(1);
        make.height.equalTo(@25);
        make.width.equalTo(@20);
    }];

// ＝＝＝＝＝＝＝＝＝ 收货人信息 布局
  
    [_shTitleLbl makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_consigneeView).offset(3);;
        make.left.equalTo(_consigneeView).offset(13);
        make.height.equalTo(@20);
        make.width.equalTo(@130);
    }];
    
    UIView* blackView = [[UIView alloc] init];
    
    blackView.backgroundColor = [UtilityHelper colorWithHexString:KBorderColor];
    [_consigneeView addSubview:blackView];
  
    [blackView makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_shTitleLbl.bottom).offset(3); //距离navView 7px
        make.right.equalTo(_consigneeView).offset(-10);
        make.left.equalTo(_consigneeView).offset(10);
        make.height.equalTo(@1);
    }];
    
    [_xmLbl makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(blackView).offset(12);;
        make.left.equalTo(_consigneeView).offset(13);
        make.height.equalTo(@20);
        make.width.equalTo(@100);
    }];
    
    [_name makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(_xmLbl);
        make.right.equalTo(_consigneeView.right).offset(-13);
        make.height.equalTo(@20);
        make.width.equalTo(@100);
    }];
    
   
    [_sjhLbl makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_xmLbl.bottom).offset(12);;
        make.left.equalTo(_xmLbl).offset(0);
        make.height.equalTo(@20);
        make.width.equalTo(@100);
    }];
    
    [_tel makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(_sjhLbl);
        make.right.equalTo(_consigneeView).offset(-13);
        make.height.equalTo(@20);
        make.width.equalTo(@200);
    }];
    [_shdzLbl makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_sjhLbl.bottom).offset(12);;
        make.left.equalTo(_sjhLbl).offset(0);
        make.height.equalTo(@20);
        make.width.equalTo(@100);
    }];
    
    
    [_address makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_shdzLbl.top);
        make.right.equalTo(_consigneeView).offset(-13);
        make.height.equalTo(@60);
        make.width.equalTo(@200);
    }];
    
// ==============订单
 
    [_orderTileLbl makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_orderInfoView).offset(3);;
        make.left.equalTo(_orderInfoView).offset(13);
        make.height.equalTo(@20);
        make.width.equalTo(@130);
    }];
    
    UIView* blackView2 = [[UIView alloc] init];
    
    blackView2.backgroundColor = [UtilityHelper colorWithHexString:KBorderColor];
    [_orderInfoView addSubview:blackView2];
    
    [blackView2 makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_orderTileLbl.bottom).offset(3); //距离navView 7px
        make.right.equalTo(_orderInfoView).offset(-10);
        make.left.equalTo(_orderInfoView).offset(10);
        make.height.equalTo(@1);
    }];
   // ~~~~~~~
   [_ddhLbl makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(blackView2.bottom).offset(12);;
        make.left.equalTo(_orderInfoView).offset(13);
        make.height.equalTo(@20);
        make.width.equalTo(@100);
    }];
    
    [_OrderID makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_ddhLbl);
        make.right.equalTo(_orderInfoView).offset(-13);
        make.height.equalTo(@20);
        make.width.equalTo(@250);
    }];
    
    [_xdsjLbl  makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_ddhLbl.bottom).offset(12);;
        make.left.equalTo(_orderInfoView).offset(13);
        make.height.equalTo(@20);
        make.width.equalTo(@100);
    }];
    
    [ _CreateTime makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_xdsjLbl);
        make.right.equalTo(_orderInfoView).offset(-13);
        make.height.equalTo(@20);
        make.width.equalTo(@200);
    }];
    
    [_jdztLbl  makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_xdsjLbl.bottom).offset(12);;
        make.left.equalTo(_orderInfoView).offset(13);
        make.height.equalTo(@20);
        make.width.equalTo(@100);
    }];
    
   [_OrderStatus makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_jdztLbl);
        make.right.equalTo(_orderInfoView).offset(-10);
        make.height.equalTo(@20);
        make.width.equalTo(@200);
    }];
    
    [_fkfsLbl  makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_jdztLbl.bottom).offset(12);;
        make.left.equalTo(_consigneeView).offset(13);
        make.height.equalTo(@20);
        make.width.equalTo(@100);
    }];
    
 
    [_PayType makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_fkfsLbl);
        make.right.equalTo(_orderInfoView).offset(-13);
        make.height.equalTo(@20);
        make.width.equalTo(@200);
    }];
    
    [_fksjLbl  makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_fkfsLbl.bottom).offset(12);;
        make.left.equalTo(_orderInfoView).offset(13);
        make.height.equalTo(@20);
        make.width.equalTo(@100);
    }];
    
    [_PayTime makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_fksjLbl);
        make.right.equalTo(_orderInfoView).offset(-13);
        make.height.equalTo(@20);
        make.width.equalTo(@200);
    }];
    
    [_bzLbl  makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_fksjLbl.bottom).offset(12);;
        make.left.equalTo(_orderInfoView).offset(13);
        make.height.equalTo(@20);
        make.width.equalTo(@100);
    }];
    
   
    [_Remark makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_bzLbl);
        make.right.equalTo(_orderInfoView).offset(-13);
        make.height.equalTo(@20);
        make.width.equalTo(@200);
    }];//备注
    
}


#pragma mark -------------------------UI公用-------------------------


//btn的文字 相对btn底部 40 直接和 image 一起加上去
- (UILabel*)addbtnlabelToSuperView:(UIButton *)superView
                           text:(NSString *)text
                      textColor:(UIColor *)textColor
                backgroundColor:(UIColor *)backgroundColor
                       fontSize:(CGFloat)fontSize
                        LineNum:(NSInteger)lineNum
                  textAlignment:(NSTextAlignment)textAlignment

{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor =  textColor==nil?[UIColor blackColor]:textColor ;
    label.textAlignment= textAlignment;
    label.backgroundColor = backgroundColor;
    label.font = [UIFont systemFontOfSize:fontSize];
    [superView addSubview:label];
    
    label.numberOfLines= lineNum;
    CGSize size = CGSizeMake(70, 20);
    [label makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(superView.centerY).offset(0);
        make.centerX.equalTo(superView).offset(0);
        make.size.mas_equalTo(size);
        
    }];
    return label;
}

-(UILabel*)addlabelToSuperView:(UIView *)superView
                       text:(NSString *)text
                  textColor:(UIColor *)textColor
            backgroundColor:(UIColor *)backgroundColor
                   fontSize:(CGFloat)fontSize
                        LineNum:(NSInteger)lineNum
              textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor =  textColor==nil?[UIColor blackColor]:textColor ;
    label.textAlignment= textAlignment;
    label.backgroundColor = backgroundColor;
    label.font = [UIFont systemFontOfSize:fontSize];
    [superView addSubview:label];
    
    label.numberOfLines= lineNum;
    return label;
}

-(void)addLineWithFrame:(CGRect)rect colorString:(NSString*)colorString superView:(UIView*)superView{
    UIView *line=[[UIView alloc]initWithFrame:rect];
    line.backgroundColor=[UtilityHelper colorWithHexString:colorString];
    [superView addSubview:line];
}

-(void)addImageViewWithFrame:(CGRect)rect imageName:(NSString*)imageName cornerRadius:(CGFloat)radius  tag:(NSInteger)tag  superView:(UIView*)superView{
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:rect];
    imageView.image=[UIImage imageNamed:imageName];
    imageView.layer.cornerRadius=radius;
    imageView.layer.masksToBounds=YES;
    imageView.tag=tag;
    imageView.userInteractionEnabled=NO;
    [superView addSubview:imageView];
    
}

-(void)gotoOrderHandle{
    
    NSLog(@"gotoOrderHandle");
    OrderHandleViewController *ohVC = [[OrderHandleViewController alloc] initWithNibName:@"OrderHandleViewController" bundle:nil];
    ohVC.orderidStr = _orderDetailM.OrderID;
    [self.navigationController pushViewController:ohVC animated:YES];
    
}

-(void)gotoChangeFee{
      NSLog(@"gotoChangeFee");
    ChangeFeeViewController* cfVC = [[ChangeFeeViewController alloc] init];
    cfVC.hjNum = _orderlistM.Total; //运费
    cfVC.orderidStr = _orderDetailM.OrderID;
    
     NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    cfVC.businessidStr = [userDefaults objectForKey:@"businessID"];
    [self.navigationController pushViewController:cfVC animated:YES];
}
@end
