//
//  FWPhotosViewController.m
//  FlyWire
//
//  Created by Liuyong on 14-12-2.
//  Copyright (c) 2014年 CyonLeu. All rights reserved.
//

#import "FWPhotosViewController.h"
#import "FWImagePickerViewController.h"

@interface FWPhotosViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation FWPhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

#pragma mark - 系统相机

- (IBAction)onTakePhotoButton:(id)sender forEvent:(UIEvent *)event {

    FWImagePickerViewController *imagePickerController = [[FWImagePickerViewController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.delegate = self;
    
//    [self.navigationController pushViewController:imagePickerVC animated:YES];
    [self presentViewController:imagePickerController animated:YES completion:^{
        //
    }];
    
}
- (IBAction)onShowPhotosButton:(id)sender {
    
    UIImagePickerController *photoLibController = [[UIImagePickerController alloc] init];
    photoLibController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    photoLibController.delegate = self;
    
    [self presentViewController:photoLibController animated:YES completion:nil];
    
}


#pragma mark - Use AVCaptureDevice

- (IBAction)onAVTakePhotoButton:(id)sender {
//    AVCaptureDevice *captureDevice = [[AVCaptureDevice deviceWithUniqueID:<#(NSString *)#>
    
}

- (IBAction)onAVPhotosButton:(id)sender {
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    if (image) {
        self.imageView.image = image;
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"imagePickerControllerDidCancel");
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
