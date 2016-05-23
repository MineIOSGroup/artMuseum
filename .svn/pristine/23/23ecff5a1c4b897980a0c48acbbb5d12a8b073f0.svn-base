//
//  RegistViewController.m
//  美术馆
//
//  Created by Young on 11/19/15.
//  Copyright © 2015 邓超. All rights reserved.
//

#import "RegistViewController.h"
#import "LoginViewController.h"
#import "RegistMailViewController.h"
#import <SMS_SDK/SMSSDK.h>

@interface RegistViewController ()

@property (strong, nonatomic) IBOutlet UITextField *phoneTextField;
@property (strong, nonatomic) IBOutlet UITextField *verifyTextField;
@property (strong, nonatomic) IBOutlet UITextField *pwdTextField;

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)codeReceiveButtonAction:(id)sender {
    
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS
     //这个参数可以选择是通过发送验证码还是语言来获取验证码
                            phoneNumber:_phoneTextField.text
                                   zone:@"86"
                       customIdentifier:nil //自定义短信模板标识
                                 result:^(NSError *error)
     {
         
         if (!error)
         {
             UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"发送成功", nil)
                                                             message:nil
                                                            delegate:self
                                                   cancelButtonTitle:NSLocalizedString(@"ok", nil)
                                                   otherButtonTitles:nil, nil];
             [alert show];
             
         }
         else
         {
             
             UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"验证失败", nil)
                                                             message:[NSString stringWithFormat:@"%@",[error.userInfo objectForKey:@"getVerificationCode"]]
                                                            delegate:self
                                                   cancelButtonTitle:NSLocalizedString(@"ok", nil)
                                                   otherButtonTitles:nil, nil];
             [alert show];
             
         }
         
     }];
}

- (IBAction)verifyButtonAction:(id)sender {
    if (_verifyTextField.text) {
        [SMSSDK  commitVerificationCode:self.verifyTextField.text
         //传获取到的区号
                            phoneNumber:_phoneTextField.text
                                   zone:@"86"
                                 result:^(NSError *error)
         {
             
             if (!error)
             {
                 if (_pwdTextField.text) {
                     
                 }
                 else
                 {
                     UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"请输入密码"
                                                                     message:nil
                                                                    delegate:self
                                                           cancelButtonTitle:@"ok"
                                                           otherButtonTitles:nil];
                     [alert show];
                 }
             }
             else
             {
                 UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"验证码输入错误"
                                                                 message:nil
                                                                delegate:self
                                                       cancelButtonTitle:@"ok"
                                                       otherButtonTitles:nil];
                 [alert show];
             }
             
         }];
    }
    else
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"请输入验证码"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"ok"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)loginButtonAction:(id)sender {
    LoginViewController *loginVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    [self.navigationController pushViewController:loginVC animated:YES];
    
}
- (IBAction)mailRegistButtonAction:(id)sender {
    RegistMailViewController *registmailVC = [[RegistMailViewController alloc] initWithNibName:@"RegistMailViewController" bundle:nil];
    [self.navigationController pushViewController:registmailVC animated:YES];
}

@end
