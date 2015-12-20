//
//  PaopaoViewClicked.m
//  GaoDeMapDemo
//
//  Created by zyh on 15/12/20.
//  Copyright © 2015年 zyh. All rights reserved.
//

#import "PaopaoViewClicked.h"

@interface PaopaoViewClicked ()
@property (strong, nonatomic) IBOutlet UILabel *latitudeLable;
@property (strong, nonatomic) IBOutlet UIImageView *iconImage;
@property (strong, nonatomic) IBOutlet UILabel *longitudeLable;
@property (strong, nonatomic) IBOutlet UILabel *locationTitleLable;
@property (strong, nonatomic) IBOutlet UILabel *locationSubtitleLable;

@end

@implementation PaopaoViewClicked

- (void)viewDidLoad {
    [super viewDidLoad];
    self.latitudeLable.text = [NSString stringWithFormat:@"%f",self.locationLatitude];
    self.longitudeLable.text = [NSString stringWithFormat:@"%f",self.locationLongitude];
    self.iconImage.image = self.locationIcon;
    self.locationTitleLable.text = self.locationTitle;
    self.locationSubtitleLable.text = self.locationSubtitle;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
