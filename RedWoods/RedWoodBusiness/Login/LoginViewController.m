//
//  LoginViewController.m
//  RedWoodBusiness
//
//  Created by JunLee on 16/1/8.
//  Copyright © 2016年 Jun Li. All rights reserved.
//

#import "LoginViewController.h"
#import "HttpClient.h"
#import "ViewController.h"

@interface LoginViewController ()
@property (nonatomic,strong)HttpClient *httpClient;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginRequest:(id)sender {
    
    NSString *account = [_accountTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *passwd = [_passwdTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    // 登录需要的参数
    NSMutableDictionary *paratemer = [[NSMutableDictionary alloc]init];
    // 测试接口 & 正式接口

#ifndef HTTP_HOST_CHOOSE
    [paratemer setValue:account forKey:@"username"];
    [paratemer setValue:passwd forKey:@"password"];
#else
    [paratemer setValue:Kaccount forKey:@"username"];
    [paratemer setValue:Kpasswd forKey:@"password"];
#endif

    HttpClient * _httpClient=[[HttpClient alloc]init];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@/api/BusinessUser/login",HTTP_HOST];
   
     [_httpClient requestURL:urlStr requestType:requestType_POST params:paratemer dataParameters:nil async:YES responseDataBlock:^(ResponseEntity *rEntity) {
        switch (rEntity.status)
        {
            case 0:
            {
                [self saveUserInfo:rEntity.result];

                ViewController *vC = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
                [self.navigationController pushViewController:vC animated:YES];
            
            }
                break;
                
            case -1:{
//                 登录失败
                 NSLog(@"登录失败：%ld",(long)rEntity.status);
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

-(void)saveUserInfo:(id)result{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
//    [userDefaults setObject:@"Yes" forKey:@"isLogin"];
    
    [userDefaults setObject:[result valueForKey:@"authCode"] forKey:@"authCode"]; //除登录、找回密码等操作，其他操作需要在header添加token信息以验证用户身份。否则返回{ "status": { "code": -2, "meassage": "未登录，请登录"}}
    
     RWLog(@"authCode == head-token:%@ ",[result valueForKey:@"authCode"] );
    
    [userDefaults setObject:[result valueForKey:@"userID"] forKey:@"userID"]
    ;
    [userDefaults setObject:[result valueForKey:@"user_token"] forKey:@"user_token"];
    [userDefaults setObject:[result valueForKey:@"businessID"] forKey:@"businessID"];
   
    //                   [userDefaults setObject:[rEntity.result valueForKey:@"businessName"] forKey:@"businessName"];
    //                [userDefaults setObject:[rEntity.result valueForKey:@"powerIDs"] forKey:@"powerIDs"];
   
    //                [userDefaults setObject:[rEntity.result valueForKey:@"docount"] forKey:@"docount"];
    //                [userDefaults setObject:[rEntity.result valueForKey:@"isAdmin"] forKey:@"isAdmin"];
    //                [userDefaults setObject:[rEntity.result valueForKey:@"Latitude"] forKey:@"Latitude"];
   
    //                [userDefaults setObject:[rEntity.result valueForKey:@"Tel"] forKey:@"Tel"];
    //                [userDefaults setObject:[rEntity.result valueForKey:@"LocationName"] forKey:@"LocationName"];
    //                [userDefaults setObject:[rEntity.result valueForKey:@"address"] forKey:@"address"];
    //                 [userDefaults setObject:[rEntity.result valueForKey:@"Longitude"] forKey:@"Longitude"];
    //                 [userDefaults setObject:[rEntity.result valueForKey:@"mcode"] forKey:@"mcode"];
    //                 [userDefaults setObject:[rEntity.result valueForKey:@"businessType"] forKey:@"businessType"];
    
    //
    //                  [userDefaults setObject:[rEntity.result valueForKey:@"IsInner"] forKey:@"IsInner"];
    //                  [userDefaults setObject:[rEntity.result valueForKey:@"pendingOrderNum"] forKey:@"pendingOrderNum"];
  
    //                  [userDefaults setObject:[rEntity.result valueForKey:@"msgIdList"] forKey:@"msgIdList"];
    
    [userDefaults synchronize];
    
}

@end
