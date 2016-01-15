//
//  ChangeFeeViewController.m
//  RedWoodBusiness
//
//  Created by JunLee on 16/1/13.
//  Copyright © 2016年 Jun Li. All rights reserved.
//


#import "ChangeFeeViewController.h"
#import "HttpClient.h"

@interface ChangeFeeViewController ()


@property (nonatomic,strong)UIView* headView;
//@property (nonatomic,strong)UIView* navView;

@property (nonatomic,strong)UILabel *ddhjLbl; // @"订单合集"
@property (nonatomic,strong)UILabel *Price; // 红色价钱lbl
@property (nonatomic,strong)UILabel *fgyfLbl; //修改运费


@property (nonatomic,strong)UITextField* fgyd; //输入框



@end

@implementation ChangeFeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatUI];
}
-(void)creatUI{
    
    _headView = [[UIView alloc] init];
//    _headView.layer.borderColor = [UtilityHelper colorWithHexString:KBorderColor].CGColor;
//    _headView.layer.borderWidth = 1;
    [self.view addSubview:_headView];
    [_headView makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.top).offset(64); //距离navView 7px
        make.right.equalTo(self.view).offset(0);
        make.left.equalTo(self.view).offset(0);
        make.height.equalTo(@200);
    }];
    _ddhjLbl = [self addlabelToSuperView:_headView text:@"订单合计:" textColor:[UtilityHelper colorWithHexString:KLableTitleColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon   LineNum:1 textAlignment:NSTextAlignmentLeft];
    
    _fgyfLbl= [self addlabelToSuperView:_headView text:@"修改运费" textColor:[UtilityHelper colorWithHexString:KLableTitleColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon   LineNum:1 textAlignment:NSTextAlignmentLeft];
    
    [_ddhjLbl makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_headView).offset(15);;
        make.left.equalTo(_headView).offset(18);
        make.height.equalTo(@20);
        make.width.equalTo(@60);
    }];
    //合计费用 红色数字
     UILabel* hjLbl = [self addlabelToSuperView:_headView text:self.hjNum textColor:[UtilityHelper colorWithHexString:KLableRedColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon LineNum:1 textAlignment:NSTextAlignmentRight];//备注
    [hjLbl makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_ddhjLbl).offset(0);
        make.left.equalTo(_ddhjLbl.right).offset(2);
        make.height.equalTo(@20);
        make.width.equalTo(@130);
    }];
    
    UIView* blackView = [[UIView alloc] init];
    blackView.backgroundColor = [UtilityHelper colorWithHexString:KBorderColor];
    [_headView addSubview:blackView];
    [blackView makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_ddhjLbl.bottom).offset(15); //距离navView 7px
        make.right.equalTo(_headView).offset(0);
        make.left.equalTo(_headView).offset(0);
        make.height.equalTo(@1);
    }];
    
    [_fgyfLbl makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(blackView.bottom).offset(10);;
        make.left.equalTo(_headView).offset(13);
        make.height.equalTo(@20);
        make.width.equalTo(@100);
    }];
    
    _fgyd = [[UITextField alloc] init];
        _fgyd.layer.borderColor = [UtilityHelper colorWithHexString:KBorderColor].CGColor;
        _fgyd.layer.borderWidth = 1;
    [_headView addSubview:_fgyd];
    [_fgyd makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_fgyfLbl.bottom).offset(6);;
        make.left.equalTo(_headView).offset(12);
        make.right.equalTo(_headView).offset(-12);
        make.height.equalTo(@40);
        
    }];
    
    UIView* blackView2 = [[UIView alloc] init];
    blackView2.backgroundColor = [UtilityHelper colorWithHexString:KBorderColor];
    [_headView addSubview:blackView2];
    
    [blackView2 makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_fgyd.bottom).offset(10); //距离navView 7px
        make.right.equalTo(_headView).offset(0);
        make.left.equalTo(_headView).offset(0);
        make.height.equalTo(@1);
    }];
    
    UIButton* btn = [[UIButton alloc] init];
    btn.backgroundColor = [UtilityHelper colorWithHexString:@"#9e0c0c"];
    btn.titleLabel.text = @"修改";
    [btn  setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(changeFeePost) forControlEvents:UIControlEventTouchUpInside];
    [_headView addSubview:btn];
    
    [btn makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(blackView2.bottom).offset(30); //距离navView 7px
       make.centerX.equalTo(_headView);
         CGSize size = CGSizeMake(300, 44);
        make.size.equalTo(size);
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)changeFeePost{
    
    // 登录需要的参数
    NSString * yfStr = [NSString stringWithString:_fgyd.text] ;
    NSInteger yf = [yfStr integerValue];
    id yff =  @(yf);
    
    NSMutableDictionary *paratemer = [[NSMutableDictionary alloc]init];
    [paratemer setValue:yff  forKey:@"postage"];
    [paratemer setValue:_orderidStr forKey:@"orderid"];
    [paratemer setValue:_businessidStr forKey:@"businessid"];
    
    HttpClient * _httpClient=[[HttpClient alloc]init];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@/api/OrderInfo/UpdatePostage",HTTP_HOST];
    
    NSString *postUrlStr = [self setURL:urlStr withParameters:paratemer];
    
    [_httpClient requestURL:postUrlStr requestType:requestType_POST params:nil dataParameters:nil async:YES responseDataBlock:^(ResponseEntity *rEntity) {
        switch (rEntity.status)
        {
            case -1:
            {
                NSLog(@"修改运费失败：%ld",(long)rEntity.result);
                
            }
                break;
                
            case 0:
            {
                 NSLog(@"修改运费成功：%ld",(long)rEntity.result);
                
            }
                break;
                
            case 1:case 2:case 3:
            {
                NSLog(@"登录失败：%ld",(long)rEntity.status);
                
            }
                break;
                
            default:
                break;
        }
    }];
}

// request get请求url 拼接
-(NSString *)setURL:(NSString *)urlStr withParameters:(NSDictionary *)parameters {
    
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
    return urlStr;
}
#pragma mark -------------------------UI公用-------------------------

- (UILabel*)addlabelToSuperView:(UIView *)superView
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

@end
