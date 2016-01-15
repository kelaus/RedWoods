//
//  MyStoreViewController.m
//  RedWoodBusiness
//
//  Created by JunLee on 16/1/10.
//  Copyright © 2016年 Jun Li. All rights reserved.
//

#import "MyStoreViewController.h"
#import "HttpClient.h"
#import "UIImageView+WebCache.h"

#import "UIView+Utils.h"

@interface MyStoreViewController ()

@property (nonatomic,strong)UIView *blueView; //展位nav
@property (nonatomic,strong)UIView *backView; //容器view
@property (nonatomic,strong)UIView *baView; //展位nav

@property (nonatomic,strong)UIImageView *backImage;
@property (nonatomic,strong)UIImage *image;
@property (nonatomic,strong)NSString *storeName;


@property (nonatomic,strong)NSString *PhotoList;
@property (nonatomic,strong)NSString *BusinessName;


@property (nonatomic,strong)HttpClient *httpClient;

@end

@implementation MyStoreViewController
-(UIView*)backView{
    if (_backView == nil) {
        _backView = [[UIView alloc] init];
    }
    return  _backView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //请求我的商户信息
    [self getMyStoreInfo];
    //nav占位
    _blueView = [[UIView alloc] init];
    _blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_blueView];
    [_blueView makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.left.equalTo(self.view).offset(0);
        make.height.equalTo(@64);
    }];
    //容器view
  
     self.backView.backgroundColor = [UIColor grayColor];
    [self.view addSubview: self.backView];
    [self.backView makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_blueView.mas_bottom).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.left.equalTo(self.view).offset(0);
        make.height.equalTo(@200);
    }];
//    [self.backView layoutIfNeeded];

 
    
    UILabel* nl = [[UILabel alloc] init];
    nl.backgroundColor = [UIColor grayColor];
    [self.view addSubview:nl];
    [nl makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.backView.mas_bottom).offset(30);
        make.right.equalTo(self.view).offset(0);
        make.left.equalTo(self.view).offset(0);
        make.height.equalTo(@20);
    }];
    [nl layoutIfNeeded];
//    
    //商铺背景图片
    
    _backImage = [[UIImageView alloc] init];
    [_backView addSubview:_backImage];
    _backImage.userInteractionEnabled = YES;
    //    _backImage.layer.cornerRadius = 20.0f;
    //    _backImage.layer.borderWidth = 1;
    //    _backImage.layer.borderColor = [UIColor lightGrayColor].CGColor;
    //    _backImage.clipsToBounds = YES;
    _backImage.contentMode = UIViewContentModeScaleAspectFit;
  
    //    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImg:)];
    //    [_imgView addGestureRecognizer:tap];
    

}

-(void)viewWillAppear:(BOOL)animated{

    
    [_backImage makeConstraints:^(MASConstraintMaker *make) {
        
         make.edges.equalTo(_backView).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getMyStoreInfo{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *businessID = [userDefaults objectForKey:@"businessID"];
        
    NSString *url = [NSString stringWithFormat:@"http://bizapi.hongmubao.com/api/BusinessInfo/GetDetail/%@",businessID];
    _httpClient=[[HttpClient alloc]init];
    [_httpClient requestURL:url requestType:requestType_GET params:nil dataParameters:nil async:YES responseDataBlock:^(ResponseEntity *rEntity) {
        switch (rEntity.status)
        {
            case 0:
            {
                NSLog(@"%@",rEntity.result);
                
               _PhotoList = [rEntity.result valueForKey:@"PhotoList"]; //背景url
                _BusinessName = [rEntity.result valueForKey:@"BusinessName"]; //店铺名
                
                 [_backImage sd_setImageWithURL:[NSURL URLWithString:_PhotoList] placeholderImage:[UIImage imageNamed:@"红木宝首页logo"]];

            }
                break;
            case 1:case 2:case 3:
            {
//                 NSLog(@"%@",rEntity.result);
//                               returnDataBlock(rEntity);
            }
                break;
                
            default:
                break;
        }
    }];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
