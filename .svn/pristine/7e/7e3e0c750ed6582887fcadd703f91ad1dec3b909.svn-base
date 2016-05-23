//
//  RegistVerifyViewController.m
//  美术馆
//
//  Created by Young on 11/19/15.
//  Copyright © 2015 邓超. All rights reserved.
//

#import "RegistVerifyViewController.h"

@interface RegistVerifyViewController ()
@property (strong, nonatomic) IBOutlet UITextField *verifyTextField;
@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
@property (nonatomic, strong) NSTimer *SecondsTimer;

@end

@implementation RegistVerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_verifyTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    self.SecondsTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}

- (void)timerAction
{
    NSInteger num = [self.timerLabel.text integerValue];
    num--;
    self.timerLabel.text = [NSString stringWithFormat:@"%ld",num];
    if (num == 0) {
        [self.SecondsTimer invalidate];
        self.SecondsTimer = nil;
        self.timerLabel.text = @"0";
    }
}

- (IBAction)confirmButtonAction:(id)sender {
    
}

@end
