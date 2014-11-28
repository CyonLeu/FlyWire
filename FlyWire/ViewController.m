//
//  ViewController.m
//  FlyWire
//
//  Created by Liuyong on 14-11-28.
//  Copyright (c) 2014年 CyonLeu. All rights reserved.
//

#import "ViewController.h"
#import <Crashlytics/Crashlytics.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self testCrash];
}
- (IBAction)onCrashButton:(id)sender {
//    [self testCrash];
    [[Crashlytics sharedInstance] crash];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
