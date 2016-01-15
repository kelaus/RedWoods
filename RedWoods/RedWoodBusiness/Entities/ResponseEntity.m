//
//  ResponseEntity.m
//  LTLCommunity
//
//  Created by 李敏 on 14-7-16.
//  Copyright (c) 2014年 xes. All rights reserved.
//

#import "ResponseEntity.h"



@implementation ResponseEntity
@synthesize error;
@synthesize status;
@synthesize errorMsg;
@synthesize result;

- (instancetype)init
{
    self = [super init];
    if (self) {
        errorMsg=[[NSString alloc]init];
    }
    return self;
}



@end
