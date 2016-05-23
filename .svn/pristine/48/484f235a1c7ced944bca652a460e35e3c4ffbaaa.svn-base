//
//  LoginViewController.m
//  美术馆
//
//  Created by Young on 11/17/15.
//  Copyright © 2015 邓超. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistViewController.h"
#import "PwdForgetViewController.h"
#import <ShareSDKExtension/SSEThirdPartyLoginHelper.h>
#import "WXApi.h"
#import "AppDelegate.h"
#import "DCTabBarController.h"

@interface LoginViewController ()

@property (strong, nonatomic) IBOutlet UITextField *phoneNumTextField;
@property (strong, nonatomic) IBOutlet UITextField *pwdTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)initView
{
    [_phoneNumTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    [_pwdTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
}

- (IBAction)wxLoginButtonAction:(id)sender {
    [ShareSDK getUserInfo:SSDKPlatformTypeWechat onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        if (state == SSDKResponseStateSuccess) {
            NSLog(@"dd%@",user.rawData);
            NSLog(@"rr%@",user.credential);
        }
        else
        {
            NSLog(@"%@",error);
        }
    }];
}

- (IBAction)qqLoginButtonAction:(id)sender {
    [ShareSDK getUserInfo:SSDKPlatformTypeQQ onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
        if (state == SSDKResponseStateSuccess) {
            NSLog(@"dd%@",user.rawData);
            NSLog(@"rr%@",user.credential);
        }
        else
        {
            NSLog(@"%@",error);
        }
    }];
}

- (IBAction)wbLoginButtonAction:(id)sender {
    [SSEThirdPartyLoginHelper loginByPlatform:SSDKPlatformTypeSinaWeibo
                                   onUserSync:^(SSDKUser *user, SSEUserAssociateHandler associateHandler) {
                                       associateHandler (user.uid, user, user);
                                       NSLog(@"dd%@",user.rawData);
                                       NSLog(@"rr%@",user.credential);
                                   } onLoginResult:^(SSDKResponseState state, SSEBaseUser *user, NSError *error) {
                                   }];
}

- (IBAction)registButtonAction:(id)sender {
    RegistViewController *registVC = [[RegistViewController alloc] initWithNibName:@"RegistViewController" bundle:nil];
    [self.navigationController pushViewController:registVC animated:YES];
}

- (IBAction)pwdforgetButtonAction:(id)sender {
    PwdForgetViewController *pwdforgetVC = [[PwdForgetViewController alloc] initWithNibName:@"PwdForgetViewController" bundle:nil];
    [self.navigationController pushViewController:pwdforgetVC animated:YES];
}

- (IBAction)loginButtonAction:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}

@end
