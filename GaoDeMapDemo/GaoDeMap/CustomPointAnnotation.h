//
//  CustomPointAnnotation.h
//  GaoDeMapDemo
//
//  Created by zyh on 15/12/21.
//  Copyright © 2015年 zyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MAMapKit/MAMapKit.h>
#import <UIKit/UIKit.h>
@interface CustomPointAnnotation : NSObject <MAAnnotation>
/**
 *  大头针的位置
 */
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
/**
 *  大头针标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  大头针的子标题
 */
@property (nonatomic, copy) NSString *subtitle;
@end
