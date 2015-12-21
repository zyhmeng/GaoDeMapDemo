//
//  CustomAnnotationView.h
//  GaoDeMapDemo
//
//  Created by zyh on 15/12/21.
//  Copyright © 2015年 zyh. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
#import "CalloutView.h"

@interface CustomAnnotationView : MAAnnotationView

@property (nonatomic, strong) CalloutView *calloutView;

@end
