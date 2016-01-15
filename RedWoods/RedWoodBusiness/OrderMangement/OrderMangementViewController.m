//
//  OrderMangementViewController.m
//  RedWoodBusiness
//
//  Created by JunLee on 16/1/10.
//  Copyright © 2016年 Jun Li. All rights reserved.
//

#import "OrderMangementViewController.h"
#import "HttpClient.h"
#import "OrderModel.h"
#import "MJExtension.h"
#import "OrderCell.h"
#import "OrderDetailViewController.h"

@interface OrderMangementViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedcontrol;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableString *orderStatus; //必填待处理10337处理中10338已完成10339已取消10340  未付款10336

@property (nonatomic,strong)NSMutableArray *orderArray;
@end

@implementation OrderMangementViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
      _orderStatus = @"10337";
    //初始化数据
    [self getOderDataWithStatus:_orderStatus];
    
//    //初始化表格
//    [self initTableView];
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
//    _segmentedcontrol = [[UISegmentedControl alloc]initWithItems:segmentedData];
//    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]init];
//    segmentedControl.frame = CGRectMake(10.0, 20.0,300.0, 30.0);
//    
//    //这个是设置按下按钮时的颜色
//    _segmentedcontrol.tintColor = [UIColor colorWithRed:49.0 / 256.0 green:148.0 / 256.0 blue:208.0 / 256.0 alpha:1];
    self.segmentedcontrol.selectedSegmentIndex = 0;//默认选中的按钮索引
    //设置分段控件点击相应事件
    [self.segmentedcontrol addTarget:self action:@selector(doSomethingInSegment:)forControlEvents:UIControlEventValueChanged];
    
}

//取得订单数据
-(void)getOderDataWithStatus:(NSString*)oderStatus{
    
    NSMutableDictionary *paratemer = [[NSMutableDictionary alloc]init];
    [paratemer setValue:@"1"  forKey:@"pageIndex"];
    [paratemer setValue:@"10" forKey:@"pageSize"];
    [paratemer setValue:oderStatus forKey:@"status"];
    
    NSString *url = [NSString stringWithFormat:@"%@/api/OrderInfo/GetList",HTTP_HOST];
    HttpClient* _httpClient=[[HttpClient alloc]init];
    [_httpClient requestURL:url requestType:requestType_GET params:paratemer dataParameters:nil async:YES responseDataBlock:^(ResponseEntity *rEntity) {
        switch (rEntity.status)
        {
            case 0:
            {
                NSLog(@"%@",rEntity.result);
               self.orderArray = rEntity.result;
                [self.tableView reloadData];
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

-(void)doSomethingInSegment:(UISegmentedControl *)Seg
{
    NSInteger Index = Seg.selectedSegmentIndex;
    switch (Index)
    {
        case 0:
            NSLog(@"第0个被点击");
            _orderStatus = @"10337";
            break;
        case 1:
           _orderStatus = @"10338";
              NSLog(@"第1个被点击");
            break;
        case 2:
            _orderStatus = @"10339";
              NSLog(@"第2个被点击");
            break;
        case 3:
            //待付款
            _orderStatus = @"10336";
            NSLog(@"第3个被点击");
            break;
        default:
            break;
    }
    [self getOderDataWithStatus:_orderStatus]; //请求数据

}

#pragma mark - UITableViewDataSource,UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110+10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.orderArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"Cell";
    OrderCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"OrderCell" owner:self options:nil]lastObject];
        
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSDictionary *order = self.orderArray[indexPath.row];
//    cell.textLabel.text = [NSString stringWithFormat:@"%@", [order objectForKey:  @"OrderID"]];
    [cell setOrderCell:order];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSDictionary *order = self.orderArray[indexPath.row];
    
    OrderDetailViewController *oDVC = [[OrderDetailViewController alloc] initWithOrderID:order[@"OrderID"] OrderStaus:_orderStatus]; //_orderStatus点击时候给的值
    [self.navigationController pushViewController:oDVC animated:YES];
    
}
#pragma mark ===== 延迟加载
-(NSMutableArray*)orderArray{
    
    if (_orderArray == nil) {
        _orderArray = [[NSMutableArray alloc] init];
    }
    return _orderArray;
}


@end
