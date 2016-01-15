//
//  UINavigationItem+CustomBackButton.m
//  LTLCommunity
//
//  Created by lb on 14-7-14.
//  Copyright (c) 2014年 xes. All rights reserved.
//

#import "UINavigationItem+CustomBackButton.h"

@implementation UINavigationItem (CustomBackButton)

-(UIBarButtonItem *)backBarButtonItem{
    return [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:nil action:NULL];
}

@end
