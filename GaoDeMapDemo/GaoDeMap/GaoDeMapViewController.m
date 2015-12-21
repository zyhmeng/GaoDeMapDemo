//
//  GaoDeMapViewController.m
//  GaoDeMapDemo
//
//  Created by zyh on 15/12/20.
//  Copyright © 2015年 zyh. All rights reserved.
//

#import "GaoDeMapViewController.h"
#import <MAMapKit/MAMapKit.h>
#import "PaopaoViewClicked.h"
#import "CustomAnnotationView.h"
#import "CustomPointAnnotation.h"



@interface GaoDeMapViewController ()<MAMapViewDelegate>
{
    MAMapView *_mapView;
}

@property (nonatomic, strong) MAUserLocation *userLocation;
@end

@implementation GaoDeMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"高德地图";
    [MAMapServices sharedServices].apiKey = GaoDeMapKey;
    
    _mapView = [[MAMapView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    _mapView.delegate = self;
    [self.view addSubview:_mapView];

    _mapView.showsUserLocation = YES;
    
    
    //当前位置显示在可视范围内
    MACoordinateRegion region;
    region.center.latitude = 34.782879;
    region.center.longitude = 113.726475;
    region.span.latitudeDelta = 0.08;
    region.span.longitudeDelta = 0.08;
    _mapView.region = region;
    
    //添加我的位置按钮
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 30)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.alpha = 0.9;
    UIButton *myLocation = [[UIButton alloc]initWithFrame:CGRectMake(60, 0, 100, 30)];
    [myLocation setTitle:@"我的位置" forState:UIControlStateNormal];
    [myLocation setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [myLocation addTarget:self action:@selector(myLocationClicked) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:myLocation];
    [_mapView addSubview:bgView];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(customCalloutViewClicked) name:@"calloutViewClickedState" object:nil];

}



- (void)viewDidAppear:(BOOL)animated
{
    MAPointAnnotation *annotation = [[MAPointAnnotation alloc]init];
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 34.702;
    coordinate.longitude = 113.726;
    annotation.coordinate = coordinate;
    annotation.title = @"云峰";
    annotation.subtitle = @"绿地峰会天下";
    [_mapView addAnnotation:annotation];
    CustomPointAnnotation *customPointAnnotation = [[CustomPointAnnotation alloc]init];
    CLLocationCoordinate2D customCoordinate;
    customCoordinate.latitude = 34.782879;
    customCoordinate.longitude = 113.726475;
    customPointAnnotation.coordinate = customCoordinate;
    [_mapView addAnnotation:customPointAnnotation];
}

#pragma mark - MAMapViewDelegate
- (MAAnnotationView*)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
        
        static NSString *myPinAnnotation = @"pinAnnotation";
        MAPinAnnotationView *pinAnnotation = (MAPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:myPinAnnotation];
        if (pinAnnotation == nil) {
            pinAnnotation = [[MAPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:myPinAnnotation];
        }
        //设置显示气泡的左右View
        pinAnnotation.canShowCallout = YES;
        UIView *paopaoLeftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 32, 41)];
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"man"]];
        image.center = paopaoLeftView.center;
        [paopaoLeftView addSubview:image];
        pinAnnotation.leftCalloutAccessoryView = paopaoLeftView;
        UIButton *paopaoRightView = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 32, 41)];
        
        [paopaoRightView setImage:[UIImage imageNamed:@"bnavi"] forState:UIControlStateNormal];
        
        pinAnnotation.rightCalloutAccessoryView = paopaoRightView;
        return pinAnnotation;
    }else if ([annotation isKindOfClass:[CustomPointAnnotation class]])
    {
        static NSString *customAnnotationView = @"customAnnView";
        CustomAnnotationView *customAnnView = (CustomAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:customAnnotationView];
        if (customAnnView == nil) {
            customAnnView = [[CustomAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:customAnnotationView];
            customAnnView.image = [UIImage imageNamed:@"start"];
            
            
            // 设置中心点偏移，使得标注底部中间点成为经纬度对应点
            customAnnView.centerOffset = CGPointMake(0, -18);
            
            return customAnnView;
        }
        
    }
    return nil;
}
- (void)mapView:(MAMapView *)mapView didAnnotationViewCalloutTapped:(MAAnnotationView *)view
{
    PaopaoViewClicked *paopaoVC = [[PaopaoViewClicked alloc]init];
    paopaoVC.locationLatitude = self.userLocation.location.coordinate.latitude;
    paopaoVC.locationLongitude = self.userLocation.location.coordinate.longitude;
    paopaoVC.locationIcon = [UIImage imageNamed:@"man"];
    paopaoVC.locationTitle = @"云峰";
    paopaoVC.locationSubtitle = @"绿地峰会天下";
    [self.navigationController pushViewController:paopaoVC animated:YES];

}

#pragma mark - 位置更新
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    _userLocation = userLocation;
    updatingLocation = YES;
}

#pragma mark - 我的位置点击事件
- (void)myLocationClicked
{
    MACoordinateRegion region;
    region.center.latitude = _userLocation.location.coordinate.latitude;
    region.center.longitude = _userLocation.location.coordinate.longitude;
    region.span.latitudeDelta = 0.2;
    region.span.longitudeDelta = 0.2;
    _mapView.region = region;
}

#pragma mark - customCalloutViewClicked
- (void)customCalloutViewClicked
{
    PaopaoViewClicked *paopaoVC = [[PaopaoViewClicked alloc]init];
    paopaoVC.locationLatitude = self.userLocation.location.coordinate.latitude;
    paopaoVC.locationLongitude = self.userLocation.location.coordinate.longitude;
    paopaoVC.locationIcon = [UIImage imageNamed:@"man"];
    paopaoVC.locationTitle = @"云峰";
    paopaoVC.locationSubtitle = @"绿地峰会天下";
    [self.navigationController pushViewController:paopaoVC animated:YES];
}
@end
