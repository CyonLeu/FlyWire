
#Destination#

What I do is Custom camera , How to use AVCaptureDevice replace UIImagePickerController.


# Demo :

![screenshot ](https://raw.githubusercontent.com/CyonLeu/FlyWire/master/screenShot.PNG)

# How to use AVCaptureDevice


#### simple Code: ###
	self.session = [[AVCaptureSession alloc] init];
    self.deviceInput = [[AVCaptureDeviceInput alloc] initWithDevice:[self frontCamera] error:nil];
    self.stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary * outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG,AVVideoCodecKey, nil];
    [self.stillImageOutput setOutputSettings:outputSettings];
    
    if ([self.session canAddInput:self.deviceInput]) {
        [self.session addInput:self.deviceInput];
    }
    
    if ([self.session canAddOutput:self.stillImageOutput]) {
        [self.session addOutput:self.stillImageOutput];
    }
    
    if (self.previewLayer == nil) {
        self.previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
        UIView * view = self.view;
        CALayer * viewLayer = [view layer];
        [viewLayer setMasksToBounds:YES];
        
        self.previewLayer.frame = view.bounds;
        [self.previewLayer setVideoGravity:AVLayerVideoGravityResizeAspect];
        
        [viewLayer insertSublayer:self.previewLayer below:[[viewLayer sublayers] objectAtIndex:0]];
    }
    
    
### TakePhoto Code:###
 
	 - (IBAction)onTakePhotoButton:(id)sender {
    AVCaptureConnection * videoConnection = [self.stillImageOutput connectionWithMediaType:AVMediaTypeVideo];
    if (!videoConnection) {
        NSLog(@"take photo failed!");
        return;
    }
    
    [self.stillImageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        if (imageDataSampleBuffer == NULL) {
            return;
        }
        NSData * imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
        UIImage * image = [UIImage imageWithData:imageData];
        NSLog(@"image size = %@",NSStringFromCGSize(image.size));
        
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }];
}

