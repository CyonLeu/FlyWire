//
//  FWImagePickerViewController.m
//  FlyWire
//
//  Created by Liuyong on 14-12-2.
//  Copyright (c) 2014年 CyonLeu. All rights reserved.
//

#import "FWImagePickerViewController.h"

@interface FWImagePickerViewController ()

@end

@implementation FWImagePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.showsCameraControls = NO;
    self.allowsEditing = YES;
    
    UIView *overlayView = [[UIView alloc] initWithFrame:self.view.bounds];
    overlayView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.35];
    
    UIButton *takePhotoBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    takePhotoBtn.frame = CGRectMake(160, 0, 60, 44);
    [takePhotoBtn setTitle:@"拍照" forState:UIControlStateNormal];
    
    [overlayView addSubview:takePhotoBtn];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(0, 0, 60, 44);
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    
    [overlayView addSubview:cancelBtn];
    
    [takePhotoBtn addTarget:self action:@selector(onTakePhotoButton:) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn addTarget:self action:@selector(onCancelButton:) forControlEvents:UIControlEventTouchUpInside];
    
//    self.cameraOverlayView = overlayView;
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

#pragma  mark - actionEvent

- (IBAction)onTakePhotoButton:(id)sender
{
    [self takePicture];
}

- (IBAction)onCancelButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        //
    }];
}

@end
