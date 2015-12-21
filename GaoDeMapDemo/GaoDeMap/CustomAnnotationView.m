//
//  CustomAnnotationView.m
//  GaoDeMapDemo
//
//  Created by zyh on 15/12/21.
//  Copyright © 2015年 zyh. All rights reserved.
//

#import "CustomAnnotationView.h"
#import "GaoDeMapViewController.h"



@implementation CustomAnnotationView

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    if (self.selected == selected)
    {
        return;
    }
    
    if (selected)
    {
        self.image = [UIImage imageNamed:@"start"];
        CalloutView *calloutView = [[CalloutView alloc]initWithFrame:CGRectMake(0, 0, 185, 70)];
        
        self.calloutView = calloutView;
        self.calloutView.center = CGPointMake(CGRectGetWidth(self.bounds) / 2.f ,
                                              -CGRectGetHeight(self.calloutView.bounds) / 2.f + self.calloutOffset.y);
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(calloutViewClicked)];
        [self.calloutView addGestureRecognizer:gesture];
        [self addSubview:self.calloutView];
        

    }
    else
    {
        [self.calloutView removeFromSuperview];
    }
    
    [super setSelected:selected animated:animated];
}
#pragma mark - calloutViewClicked
- (void)calloutViewClicked
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"calloutViewClickedState" object:nil];

}

@end
