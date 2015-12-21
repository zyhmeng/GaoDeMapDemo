//
//  CalloutView.m
//  GaoDeMapDemo
//
//  Created by zyh on 15/12/21.
//  Copyright © 2015年 zyh. All rights reserved.
//

#import "CalloutView.h"

@implementation CalloutView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSArray *nibView = [[NSBundle mainBundle]loadNibNamed:@"CalloutView" owner:self options:nil];
        UIView *calloutView = [nibView objectAtIndex:0];
        [calloutView setFrame:CGRectMake(0, 0, 185, 70)];
        calloutView.layer.cornerRadius = 30;
        [self addSubview:calloutView];
    }
    return self;
}

@end
