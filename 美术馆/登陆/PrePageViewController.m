//
//  PrePageViewController.m
//  美术馆
//
//  Created by Young on 11/20/15.
//  Copyright © 2015 邓超. All rights reserved.
//

#import "PrePageViewController.h"
#import "RegistViewController.h"
#import "NavigationBar+BackGroundColor.h"

@interface PrePageViewController ()

@end

@implementation PrePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)sellerButtonAction:(id)sender {
    RegistViewController *registVC = [[RegistViewController alloc] initWithNibName:@"RegistViewController" bundle:nil];
    [self.navigationController pushViewController:registVC animated:YES];
}

- (IBAction)buyerButtonAction:(id)sender {
    RegistViewController *registVC = [[RegistViewController alloc] initWithNibName:@"RegistViewController" bundle:nil];
    [self.navigationController pushViewController:registVC animated:YES];
}

- (IBAction)leapButtonAction:(id)sender {
}
@end
