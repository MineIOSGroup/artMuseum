//
//  MyMesViewController.m
//  美术馆
//
//  Created by Young on 11/23/15.
//  Copyright © 2015 邓超. All rights reserved.
//

#import "MyMesViewController.h"

@interface MyMesViewController ()

{
    UIButton *previousButton;
}

@property (strong, nonatomic) IBOutlet UIView *SlideView;
@property (strong, nonatomic) IBOutlet UIButton *PrivateMesButton;
@property (strong, nonatomic) IBOutlet UIButton *CommentButton;
@property (strong, nonatomic) IBOutlet UIButton *LikeButton;
@property (strong, nonatomic) IBOutlet UIButton *ThankButton;
@property (strong, nonatomic) IBOutlet UIButton *AtButton;
@property (strong, nonatomic) IBOutlet UIButton *RewardButton;
@property (strong, nonatomic) IBOutlet UIButton *PayButton;
@property (strong, nonatomic) IBOutlet UIScrollView *GroundScrollView;


@end

@implementation MyMesViewController

- (void)viewDidLoad { 
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initView];
}

- (void) initView
{
    self.GroundScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 7, self.GroundScrollView.frame.size.height);
    [self ButtonAnimation:self.PrivateMesButton];
    
    [self.PrivateMesButton addTarget:self action:@selector(ButtonAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.CommentButton addTarget:self action:@selector(ButtonAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.LikeButton addTarget:self action:@selector(ButtonAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.ThankButton addTarget:self action:@selector(ButtonAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.AtButton addTarget:self action:@selector(ButtonAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.RewardButton addTarget:self action:@selector(ButtonAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.PayButton addTarget:self action:@selector(ButtonAnimation:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void) ButtonAnimation:(UIButton *)sender
{
    
    if (previousButton != nil) {
        [UIView animateWithDuration:0.3f animations:^{
            [previousButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            previousButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        }];
    }
    [UIView animateWithDuration:0.3f animations:^{
        [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        sender.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        self.SlideView.frame = CGRectMake(sender.frame.origin.x, 0, self.SlideView.frame.size.width, self.SlideView.frame.size.height);
        NSLog(@"%f,%f,%f",round(CGRectGetMaxX(sender.frame) / previousButton.frame.size.width),CGRectGetMaxX(sender.frame),previousButton.frame.size.width);
//        [self.GroundScrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width * (round(CGRectGetMaxX(sender.frame) / previousButton.frame.size.width) - 1), 0)  animated:YES];
    }];
    previousButton = sender;
}

@end
