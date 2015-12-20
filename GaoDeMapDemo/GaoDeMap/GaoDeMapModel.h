//
//  GaoDeMapModel.h
//  GaoDeMapDemo
//
//  Created by zyh on 15/12/20.
//  Copyright © 2015年 zyh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GaoDeMapModel : NSObject
@property (nonatomic, assign) CGFloat locationLatitude;//纬度
@property (nonatomic, assign) CGFloat locationLongitude;//经度

@property (nonatomic, strong) UIImage *locationIcon;
@property (nonatomic, strong) NSString *locationTitle;
@property (nonatomic, strong) NSString *locationSubtitle;

@end
