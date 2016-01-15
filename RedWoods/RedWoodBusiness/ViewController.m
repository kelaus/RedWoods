//
//  ViewController.m
//  RedWoodBusiness
//
//  Created by JunLee on 16/1/7.
//  Copyright © 2016年 Jun Li. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

#import "OrderMangementViewController.h"
#import "MyStoreViewController.h"
#import "GoodsListViewController.h"

@interface ViewController ()
@property (nonatomic,strong)UIView *blueView;
@property (nonatomic,strong)UIView *headView;

@property (nonatomic,strong)UIButton *orderBtn;
@property (nonatomic,strong)UIButton *moneyBtn;
@property (nonatomic,strong)UIButton *myStoreBtn;

@property (nonatomic,strong)UIButton *goodsBtn;
@property (nonatomic,strong)UIButton *serviceBtn;
//@property (nonatomic,strong)UIButton *setBtn;
@property (nonatomic,strong)UIButton *couponsBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

-(void)viewWillAppear:(BOOL)animated{

    [self layoutUI];
}

-(void)createUI{
    _blueView = [[UIView alloc] init];
    _blueView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_blueView];
    [_blueView makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.left.equalTo(self.view).offset(0);
        make.height.equalTo(@64);
    }];
    
    _headView = [[UIView alloc] init];
    _headView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_headView];
    [_headView makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_blueView.bottom).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.left.equalTo(self.view).offset(0);
        make.height.equalTo(@160);
    }];
    
    UIImageView *imageV  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"红木宝首页logo" ]];
    [_headView addSubview:imageV];
    [imageV makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_headView).offset(22);
        make.centerX.equalTo(_headView).offset(0);
        make.height.equalTo(@44);
        make.width.equalTo(@44);
    }];
    
    UIView* view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor clearColor];
    view1.layer.borderColor = [UtilityHelper colorWithHexString:KBorderColor].CGColor;
    view1.layer.borderWidth = 1;
    [_headView addSubview:view1];
    
    UIView* view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor clearColor];
    view2.layer.borderColor = [UtilityHelper colorWithHexString:KBorderColor].CGColor;
    view2.layer.borderWidth = 1;
    [_headView addSubview:view2];
    
    UIView* view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor clearColor];
    view3.layer.borderColor = [UtilityHelper colorWithHexString:KBorderColor].CGColor;
    view3.layer.borderWidth = 1;
    [_headView addSubview:view3];
    
    [view1 makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(_headView).offset(0);
        make.right.equalTo(view2.left).offset(0);
        make.left.equalTo(self.view).offset(0);
        make.width.equalTo(view2);
        make.height.equalTo(@64);
    }];
    
    [view2 makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(_headView).offset(0);
        make.right.equalTo(view3.left).offset(0);
        make.left.equalTo(view1.right).offset(0);
        make.height.equalTo(@64);
        make.width.equalTo(view1);
    }];
    
    [view3 makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(_headView).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.left.equalTo(view2.right).offset(0);
        make.height.equalTo(@64);
        make.width.equalTo(view2);
    }];
    
    //小按钮
    UIImageView *imageV1  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"有单提醒" ]];
    [view1 addSubview:imageV1];
    [imageV1 makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(view1).offset(10);
        make.centerX.equalTo(view1).offset(0);
        make.height.equalTo(@20);
        make.width.equalTo(@20);
    }];
    UIImageView *imageV2  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"消息通知1" ]];
    [view2 addSubview:imageV2];
    [imageV2 makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(view2).offset(10);
        make.centerX.equalTo(view2).offset(0);
        make.height.equalTo(@20);
        make.width.equalTo(@20);
    }];
    UIImageView *imageV3  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"每日签到" ]];
    [view3 addSubview:imageV3];
    [imageV3 makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(view3).offset(10);
        make.centerX.equalTo(view3).offset(0);
        make.height.equalTo(@20);
        make.width.equalTo(@20);
    }];
    
    //@"我的店铺"
    _myStoreBtn =[[UIButton alloc] init];
    _myStoreBtn.layer.borderColor = [UtilityHelper colorWithHexString:KBorderColor].CGColor;
    _myStoreBtn.layer.borderWidth = 1;
    [_myStoreBtn addTarget:self action:@selector(toMyStore) forControlEvents:UIControlEventTouchUpInside];
    _myStoreBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_myStoreBtn];
    UIImageView *myStoreImage = [self addImage:@"我的店铺"  toSuperView:_myStoreBtn size:CGSizeMake(30,30)];
    
    
    _goodsBtn =[[UIButton alloc] init];
    _goodsBtn.layer.borderColor = [UtilityHelper colorWithHexString:KBorderColor].CGColor;
    _goodsBtn.layer.borderWidth = 1;
//    [_goodsBtn setTitle:@"商品管理" forState:UIControlStateNormal];
    [_goodsBtn addTarget:self action:@selector(toGoodList) forControlEvents:UIControlEventTouchUpInside];
    _goodsBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_goodsBtn];
     UIImageView *goodsImage = [self addImage:@"商品管理" toSuperView:_goodsBtn size:CGSizeMake(30,30)];
    
    _moneyBtn =[[UIButton alloc] init];
    _moneyBtn.layer.borderColor = [UtilityHelper colorWithHexString:KBorderColor].CGColor;
    _moneyBtn.layer.borderWidth = 1;
    [_moneyBtn addTarget:self action:@selector(toMoneyMangement) forControlEvents:UIControlEventTouchUpInside];
    _moneyBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_moneyBtn];
    UIImageView *moneyImage = [self addImage:@"资金管理" toSuperView:_moneyBtn size:CGSizeMake(30,30)];
    
    _orderBtn =[[UIButton alloc] init];
    _orderBtn.layer.borderColor = [UtilityHelper colorWithHexString:KBorderColor].CGColor;
    _orderBtn.layer.borderWidth = 1;
    [_orderBtn addTarget:self action:@selector(toOrderMangement) forControlEvents:UIControlEventTouchUpInside];
    _orderBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_orderBtn];
    UIImageView *orderImage = [self addImage:@"订单管理" toSuperView:_orderBtn size:CGSizeMake(30,30)];
    
    
    _serviceBtn =[[UIButton alloc] init];
    _serviceBtn.layer.borderColor = [UtilityHelper colorWithHexString:KBorderColor].CGColor;
    _serviceBtn.layer.borderWidth = 1;
    [_serviceBtn addTarget:self action:@selector(toMyStore) forControlEvents:UIControlEventTouchUpInside];
    _serviceBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_serviceBtn];
    UIImageView *serviceImage = [self  addImage:@"商品售后" toSuperView:_serviceBtn size:CGSizeMake(50,30)];
    
    _couponsBtn =[[UIButton alloc] init];
    _couponsBtn.layer.borderColor = [UtilityHelper colorWithHexString:KBorderColor].CGColor;
    _couponsBtn.layer.borderWidth = 1;
    
    [_couponsBtn addTarget:self action:@selector(toMyStore) forControlEvents:UIControlEventTouchUpInside];
    _couponsBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_couponsBtn];
      UIImageView *couponsImage = [self addImage:@"优惠券" toSuperView:_couponsBtn size:CGSizeMake(30,30)];
    

}



-(void)layoutUI{
    //myStoreBtn布局
    [_myStoreBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headView.bottom).offset(5);
        make.bottom.equalTo(_moneyBtn.top).offset(-5);
        make.right.equalTo(_goodsBtn.left).offset(-5);
        make.left.equalTo(self.view).offset(5);
        make.height.equalTo(_goodsBtn);
        
        make.width.equalTo(_goodsBtn);
    }];
    
    //_goodsBtn布局
    [_goodsBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_headView.bottom).offset(5);
        make.bottom.equalTo(_orderBtn.top).offset(-5);
        make.right.equalTo(self.view).offset(-5);
        make.left.equalTo(_myStoreBtn.right).offset(5);
        
        make.height.equalTo(_serviceBtn);
        make.width.equalTo(_moneyBtn);
    }];
    
    
    // moneyBtn布局
    [_moneyBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_myStoreBtn.bottom).offset(5);
        make.bottom.equalTo(_serviceBtn.top).offset(-5);
        make.right.equalTo(_orderBtn.left).offset(-5);
        make.left.equalTo(self.view).offset(5);
        make.height.equalTo(_myStoreBtn);
        make.width.equalTo(_orderBtn);
    }];
    
    [_orderBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_goodsBtn.bottom).offset(5);
        make.bottom.equalTo(_couponsBtn.top).offset(-5);
        
        make.right.equalTo(self.view).offset(-5);
        make.left.equalTo(_moneyBtn.right).offset(5);
        make.height.equalTo(_moneyBtn);
        make.width.equalTo(_moneyBtn);
        
    }];
    
    
    //serviceBtn布局
    [_serviceBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_moneyBtn.bottom).offset(5);
        make.bottom.equalTo(self.view).offset(-5);
        make.right.equalTo(_couponsBtn.left).offset(-5);
        make.left.equalTo(self.view).offset(5);
        make.height.equalTo(_moneyBtn);
        make.width.equalTo(_moneyBtn);
    }];
    
    //couponsBtn布局
    [_couponsBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_orderBtn.bottom).offset(5);
        make.bottom.equalTo(self.view).offset(-5);
        make.right.equalTo(self.view).offset(-5);
        make.left.equalTo(_serviceBtn.right).offset(5);
        make.height.equalTo(_moneyBtn.height);
        make.width.equalTo(_moneyBtn);
    }];

}
//按钮跳转
//订单
- (void)toOrderMangement{
    NSLog(@"toOrdeerMangment");
    OrderMangementViewController *orderVC = [[OrderMangementViewController alloc] initWithNibName:@"OrderMangementViewController" bundle:nil];;
    [self.navigationController pushViewController:orderVC animated:YES];
    
}

- (void)toMoneyMangement{
    NSLog(@"toMoneyMangement");
}

- (void)toMyStore{
    
    NSLog(@"toMyStore");
    MyStoreViewController *myStore = [[MyStoreViewController alloc]  init];//initWithNibName:@"MyStoreViewController" bundle:nil];
    [self.navigationController pushViewController:myStore animated:YES];
}

-(void)toGoodList{
    
    GoodsListViewController *glVC = [[GoodsListViewController alloc] initWithNibName:@"GoodsListViewController" bundle:nil];
    [self.navigationController pushViewController:glVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)toStore:(id)sender {
//    
//    NSLog(@"toMyStore");
//    MyStoreViewController *myStore = [[MyStoreViewController alloc] initWithNibName:@"MyStoreViewController" bundle:nil];
//    [self.navigationController pushViewController:myStore animated:YES];
//}

//=========== UI公共

-(UIImageView*)addImage:(NSString*)imageStr toSuperView:(UIButton *)btn size:(CGSize)size{
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageStr ]];
    [btn addSubview:imageView];
    [imageView makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(btn.centerY).offset(-2);
        make.centerX.equalTo(btn).offset(0);
        make.size.mas_equalTo(size);
        
    }];
    
    [self addlabelToSuperView:btn text:imageStr textColor:[UtilityHelper colorWithHexString:KLableTitleColor] backgroundColor:[UIColor clearColor] fontSize:KFONTSIZEHomeTitle LineNum:0 textAlignment:NSTextAlignmentCenter];
    return imageView;
}
//btn的文字 相对btn底部 40 直接和 image 一起加上去
- (UILabel*)addlabelToSuperView:(UIButton *)superView
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
    CGSize size = CGSizeMake(100, 30);
    [label makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(superView.centerY).offset(2);
        make.centerX.equalTo(superView).offset(0);
        make.size.mas_equalTo(size);
        
    }];
    return label;
}
@end
