//
//  OrderCell.m
//  RedWoodBusiness
//
//  Created by JunLee on 16/1/11.
//  Copyright © 2016年 Jun Li. All rights reserved.
//

#import "OrderCell.h"

@implementation OrderCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setOrderCell:(NSDictionary*)dic{
    
    _name.text = dic[@"Name"];
    _tel.text = dic[@"Mobile"];
    _adress.text = dic[@"Address"];
    
    
}
@end
