//
//  RegistMailViewController.m
//  美术馆
//
//  Created by Young on 11/19/15.
//  Copyright © 2015 邓超. All rights reserved.
//

#import "RegistMailViewController.h"
#import "RegistViewController.h"
#import "LoginViewController.h"

@interface RegistMailViewController ()

@property (strong, nonatomic) IBOutlet UITextField *mailTextField;
@property (strong, nonatomic) IBOutlet UITextField *pwdTextField;

@end

@implementation RegistMailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_mailTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    [_pwdTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)phoneRegistButtonAction:(id)sender {
    RegistViewController *registVC = [[RegistViewController alloc] initWithNibName:@"RegistViewController" bundle:nil];
    [self.navigationController pushViewController:registVC animated:YES];
}

- (IBAction)loginButtonAction:(id)sender {
    LoginViewController *loginVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    [self.navigationController pushViewController:loginVC animated:YES];
}

@end
