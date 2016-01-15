//
//  GoodsListViewController.m
//  RedWoodBusiness
//
//  Created by JunLee on 16/1/15.
//  Copyright © 2016年 Jun Li. All rights reserved.
//

#import "GoodsListViewController.h"
#import "HttpClient.h"

@interface GoodsListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *totalNum;
@property (weak, nonatomic) IBOutlet UILabel *downGoodsNum;
@property (weak, nonatomic) IBOutlet UILabel *onGoodsNum;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segMent;
@property (weak, nonatomic) IBOutlet UITableView *goodsList;

@property (nonatomic,strong)NSMutableString * goodsStatus;
@property (nonatomic,strong)NSMutableArray *goodsArray;

@end

@implementation GoodsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.goodsStatus = @"10005";
    [self getGoodsListByStatus:self.goodsStatus];
    
    //设置分段控件点击相应事件
    [self.segMent addTarget:self action:@selector(doSomethingInSegment:)forControlEvents:UIControlEventValueChanged];
    self.segMent.selectedSegmentIndex = 0;
    self.goodsList.delegate = self;
    self.goodsList.dataSource = self;
    
}

-(void)doSomethingInSegment:(UISegmentedControl *)Seg
{
    //商品状态 10005:在售商品；10006：下架商品；其它值：所有商品； 默认正在售卖的商品
    
    NSInteger Index = Seg.selectedSegmentIndex;
    switch (Index)
    {
        case 0:
            RWLog(@"第0个被点击");
            self.goodsStatus = @"10005";
            break;
            
        case 1:
            RWLog(@"第1个被点击");
            self.goodsStatus = @"10006";
            break;
            
        default:
            break;
    }
    [self getGoodsListByStatus:self.goodsStatus];
    
}

//取得订单数据
-(void)getGoodsListByStatus:(NSString*)goodsStatus{
    
    //商品状态 10005:在售商品；10006：下架商品；其它值：所有商品； 默认正在售卖的商品
    //category	Int32	类别id	-1：所有分类；   0：未分类商品；    默认-1
//    maxId	Int32	最大的id	下拉刷新传第一条的id
    
    NSMutableDictionary *paratemer = [[NSMutableDictionary alloc]init];
    [paratemer setValue:@"1"  forKey:@"pageIndex"];
    [paratemer setValue:@"10" forKey:@"pageSize"];
    [paratemer setValue:self.goodsStatus forKey:@"status"];
    
    NSString *url = [NSString stringWithFormat:@"%@/api/ProductInfo/GetListByStatus",HTTP_HOST];
    HttpClient* httpClient=[[HttpClient alloc]init];
    [httpClient requestURL:url requestType:requestType_GET params:paratemer dataParameters:nil async:YES responseDataBlock:^(ResponseEntity *rEntity) {
        switch (rEntity.status)
        {
            case 0:
            {
                NSLog(@"%@",rEntity.result);
                self.goodsArray = rEntity.result;
                [self.goodsList reloadData];
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

#pragma mark - UITableViewDataSource,UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.goodsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
//        cell = [[[NSBundle mainBundle]loadNibNamed:@"OrderCell" owner:self options:nil]lastObject];
        
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSDictionary *goodsD = self.goodsArray[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [goodsD objectForKey:  @"Name"]];
//    [cell setOrderCell:order];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *order = self.goodsArray[indexPath.row];
    
//    OrderDetailViewController *oDVC = [[OrderDetailViewController alloc] initWithOrderID:order[@"OrderID"] OrderStaus:_orderStatus]; //_orderStatus点击时候给的值
//    [self.navigationController pushViewController:oDVC animated:YES];
    
}

#pragma mark -==========延迟加载
-(NSMutableString*)goodsStatus{
    
    if (_goodsStatus == nil) {
        _goodsStatus = [[NSMutableString alloc] initWithString:@""];
    }
    return _goodsStatus;
}

-(NSMutableArray*)goodsArray{
    
    if (_goodsArray == nil) {
        _goodsArray = [[NSMutableArray alloc] init];
    }
    return _goodsArray;
}

@end
