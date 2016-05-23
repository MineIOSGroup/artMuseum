//
//  PwdForgetViewController.m
//  美术馆
//
//  Created by Young on 11/20/15.
//  Copyright © 2015 邓超. All rights reserved.
//

#import "PwdForgetViewController.h"
#import "RegistVerifyViewController.h"
#import "Header.h"

@interface PwdForgetViewController ()

@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;

@end

@implementation PwdForgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.phoneTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)verifyButtonAction:(id)sender {
        RegistVerifyViewController *registVC = [[RegistVerifyViewController alloc] initWithNibName:@"RegistVerifyViewController" bundle:nil];
        [self.navigationController pushViewController:registVC animated:YES];
}


@end
