//
//  OrderCell.h
//  RedWoodBusiness
//
//  Created by JunLee on 16/1/11.
//  Copyright © 2016年 Jun Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *tel;
@property (weak, nonatomic) IBOutlet UILabel *adress;

-(void)setOrderCell:(NSDictionary*)dic;
@end
