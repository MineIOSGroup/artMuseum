//
//  NavigationBar+BackGroundColor.m
//  NavigationBarDemo
//
//  Created by 邓超 on 15/10/26.
//  Copyright © 2015年 邓超. All rights reserved.
//

#import "NavigationBar+BackGroundColor.h"
#import <objc/runtime.h>

@implementation UINavigationBar (BackGroundColor)

static char overlayKey;

- (UIView *)overlay
{
    return objc_getAssociatedObject(self, &overlayKey);
}

- (void)setOverlay:(UIView *)overlay
{
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.bounds) + 20)];
        self.overlay.userInteractionEnabled = NO;
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.overlay atIndex:0];
    }
    [self setShadowImage:[UIImage new]];
    self.overlay.backgroundColor = backgroundColor;
}

@end
