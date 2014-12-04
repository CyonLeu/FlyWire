//
//  FWCircleCenterClearView.m
//  FlyWire
//
//  Created by Liuyong on 14-12-2.
//  Copyright (c) 2014年 CyonLeu. All rights reserved.
//

#import "FWCircleCenterClearView.h"



@implementation FWCircleCenterClearView

const CGFloat CircleEdge = 10.f;

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initCommon];
    }
    
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initCommon];
    }
    
    return self;
}

- (void)initCommon
{
    self.radius = CGRectGetWidth(self.bounds) - CircleEdge;
    self.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.8];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat radius = MIN(self.radius, CGRectGetWidth(self.bounds)/2 - CircleEdge);
    CGRect innerRect = CGRectMake(self.center.x - radius, self.center.y - radius, radius * 2, radius * 2);
    
    CGContextAddEllipseInRect(context, innerRect);
    CGContextClip(context);
    CGContextClearRect(context, innerRect);
}




@end
