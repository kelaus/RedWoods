//
//  OrderHandleViewController.m
//  RedWoodBusiness
//
//  Created by JunLee on 16/1/13.
//  Copyright © 2016年 Jun Li. All rights reserved.
//

#import "OrderHandleViewController.h"
#import "HttpClient.h"

@interface OrderHandleViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *LogisticsNameTF;
@property (weak, nonatomic) IBOutlet UISegmentedControl *SegMent;

@property (weak, nonatomic) IBOutlet UIView *expressView;
@property (nonatomic,strong)UIView *noExpressView;
@property (weak, nonatomic) IBOutlet UITableView *expressChooseTable;

@property (nonatomic,strong)NSMutableArray *expressArray;

@end

@implementation OrderHandleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //设置分段控件点击相应事件
    [self.SegMent addTarget:self action:@selector(doSomethingInSegment:)forControlEvents:UIControlEventValueChanged];
    self.expressChooseTable.delegate = self;
    self.expressChooseTable.dataSource = self;
    
    [self postExpressInfo];
}

-(void)doSomethingInSegment:(UISegmentedControl *)Seg
{
    NSInteger Index = Seg.selectedSegmentIndex;
    switch (Index)
    {
        case 0:
            NSLog(@"第0个被点击");
//         [self.view hideActivityViewAtCenter];
            self.expressView.hidden  = NO;
            self.noExpressView.hidden = YES;
//              [ self.noExpressView removeFromSuperview] ;
//            [self.view addSubview:self.expressView];

            break;
        case 1:
         
            NSLog(@"第1个被点击");
            self.expressView.hidden  = YES;
            self.noExpressView.hidden = NO;
//            [self.view addSubview:self.noExpressView];

            break;
       
        default:
            break;
    }
  
}

//获取快递列表
-(void)postExpressInfo{
    
    NSMutableDictionary *paratemer = [[NSMutableDictionary alloc]init];
    HttpClient * _httpClient=[[HttpClient alloc]init];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@/api/ExpressInfo/Index",HTTP_HOST];
    [_httpClient requestURL:urlStr requestType:requestType_POST params:paratemer dataParameters:nil async:YES responseDataBlock:^(ResponseEntity *rEntity) {
        switch (rEntity.status)
        {
            case 0:
            {
                self.expressArray = rEntity.result;
                 NSLog(@"获取快递列表成功：%@",self.expressArray);
                    //pop页面
                  [self.expressChooseTable reloadData];
                
                //   {
//                ID = 156;
//                IsShow = 1;
//                Name = "\U4e2d\U90ae\U7269\U6d41";
//                OrderIndex = 9995;
//                PinYin = zhongyou;
//            }
                
            }
                break;
            case 1:case 2:case 3:
            {
                NSLog(@"获取快递列表失败：%ld",(long)rEntity.status);
                
            }
                break;
                
            default:
                break;
        }
    }];

}

-(void)postOrderRequest{
    
    NSMutableDictionary *paratemer = [[NSMutableDictionary alloc]init];
    
    [paratemer setValue:self.LogisticsNameStr  forKey:@"LogisticsName"];
    //    [paratemer setValue:self.orderidStr forKey:@"orderid"];
    [paratemer setValue:self.WayBillCodeStr forKey:@"WayBillCode"];
    
    HttpClient * _httpClient=[[HttpClient alloc]init];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@/api/OrderInfo/UpdateSendOrder",HTTP_HOST];
    [_httpClient requestURL:urlStr requestType:requestType_POST params:paratemer dataParameters:nil async:YES responseDataBlock:^(ResponseEntity *rEntity) {
        switch (rEntity.status)
        {
            case 0:
            {
                NSLog(@"快递订单成功：%ld",(long)rEntity.status);
                
                if (rEntity.status == 0) {
                    
                    NSString *title = NSLocalizedString(@"温馨提示", nil);
                    NSString *message = NSLocalizedString(@"快递订单成功", nil);
                    NSString *cancelButtonTitle = NSLocalizedString(@"确定", nil);
                    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                        
                        //pop页面
                        [self.navigationController popViewControllerAnimated:YES];
                    }];
                  
                    
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
                    
                    [alertController addAction:cancelAction];
                    [self presentViewController:alertController animated:YES completion:nil];
                    
                }else if(rEntity.status > 0){
                    
                }
            }
                break;
            case 1:case 2:case 3:
            {
                
                NSLog(@"快递订单失败：%ld",(long)rEntity.status);
                
            }
                break;
                
            default:
                break;
        }
    }];

    
}
// 物流提交

- (IBAction)postOrder:(id)sender {
  
    if ([self.LogisticsNameTF.text isEqualToString:@""]) {
        //提示需要填写快递
        RWLog(@"提示需要选快递公司self.LogisticsNameTF.text :[%@]",self.LogisticsNameTF.text);
        return;
    }else{
        self.WayBillCodeStr =[NSMutableString stringWithString:self.LogisticsNameTF.text];
        
    }
    
    if ([self.LogisticsNameStr isEqualToString:@""] && (self.LogisticsNameStr != nil) ) {
        
        //提示需要选快递公司
        RWLog(@"提示需要选快递公司 :[%@]",self.LogisticsNameStr);
        return ;
        
    }else{
        
         [self postOrderRequest];
    }
    
    
}

// 无需物流 提交
-(void)commitOrderBtn{
    
   //需要 点 “确定”才提交订单 注意设置
    self.LogisticsNameStr = @"";
    self.WayBillCodeStr = @"";
    
    //alertView
    
    NSString *title = NSLocalizedString(@"温馨提示", nil);
    NSString *message = NSLocalizedString(@"修改运费成功", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"取消", nil);
    NSString *okButtonTitle = NSLocalizedString(@"确定", nil);
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:okButtonTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
        // 提交 order接口
        [self postOrder:nil];
    }];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource,UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.expressArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
//        cell = [[[NSBundle mainBundle]loadNibNamed:@"OrderCell" owner:self options:nil]lastObject];
        
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSDictionary *expressInfoDic = self.expressArray[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [expressInfoDic objectForKey:@"Name"]];
//    [cell setOrderCell:order];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *expressInfoDic = self.expressArray[indexPath.row];
    self.LogisticsNameStr = [NSString stringWithFormat:@"%@",expressInfoDic[@"ID"]];
   
    NSLog(@"所选择的 物流公司是：%@",self.LogisticsNameStr);
    
}


// ====================== 延迟加载 ＝＝＝＝＝＝＝＝＝＝＝＝

-(NSString*)orderidStr{
    
    if (_orderidStr == nil) {
        _orderidStr = @"";
    }
    return _orderidStr;
}


-(NSMutableString*)LogisticsNameStr{
    
    if (_LogisticsNameStr == nil) {
        _LogisticsNameStr = [[NSMutableString alloc] initWithString:@""];
    }
    return _LogisticsNameStr;
}

-(NSMutableString*)WayBillCodeStr{
    
    if (_WayBillCodeStr == nil) {
        _WayBillCodeStr = [[NSMutableString alloc] initWithString:@""];
    }
    return _WayBillCodeStr;
}

-(UIView*)noExpressView{
    
    if (_noExpressView == nil) {
        _noExpressView = [[UIView alloc] init];
        [self.view addSubview: _noExpressView];
        _noExpressView.backgroundColor = [UIColor whiteColor];
        [_noExpressView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.SegMent.mas_bottom).offset(1);
            make.left.equalTo(self.view.mas_left).offset(0);
            make.right.equalTo(self.view.mas_right).offset(0);
            make.bottom.equalTo(self.view.mas_bottom).offset(0);
            
        }];
        
        UILabel *tipLbl = [UtilityHelper addlabelToSuperView:_noExpressView text:@"无需物流只需点击下面提交按钮即可" textColor:[UtilityHelper colorWithHexString:KLableTitleColor] backgroundColor:[UtilityHelper colorWithHexString:KLableBackGroudColor] fontSize:KTextFONTSIZECommon   LineNum:1 textAlignment:NSTextAlignmentCenter];
               
        [tipLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            
            CGSize size = CGSizeMake(300, 30);
            make.top.equalTo(_noExpressView.mas_top).offset(120);
            make.centerX.equalTo(_noExpressView);
            make.size.equalTo(size);
            
            
        }];
        
        UIButton *xfBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        xfBtn.backgroundColor =[UtilityHelper colorWithHexString:@"#9e0c0c"];

        [xfBtn setTitle:@"提交" forState:UIControlStateNormal];
        xfBtn.titleLabel.font=[UIFont systemFontOfSize:16];
        [xfBtn addTarget:self action:@selector(commitOrderBtn) forControlEvents:UIControlEventTouchUpInside];
        [_noExpressView addSubview:xfBtn];
        
        [xfBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            CGSize size = CGSizeMake(280, 44);
            make.top.equalTo(tipLbl.mas_bottom).offset(30);
            make.centerX.equalTo(_noExpressView);
            make.size.equalTo(size);
           
            
        }];
    }
    return _noExpressView;
}

-(UIView*)expressView{
    if (_expressView == nil) {
        _expressView = [[UIView alloc] init];
    }
    return _expressView;
}

-(NSMutableArray*)expressArray{
    
    if (_expressArray == nil) {
        _expressArray = [[NSMutableArray alloc] init];
    }
    return _expressArray;
}
// =================== UI公共

- (UIImage *) createImageWithColor:(UIColor *) color andRect:(CGRect)rect andCornerRadius:(float)radius
{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    //    addRoundedRectToPath(context, rect, radius, radius);
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


@end
