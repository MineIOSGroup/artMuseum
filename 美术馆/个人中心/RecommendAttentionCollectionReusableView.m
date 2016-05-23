//
//  RecommendAttentionCollectionReusableView.m
//  美术馆
//
//  Created by 邓超 on 15/11/25.
//  Copyright © 2015年 邓超. All rights reserved.
//

#import "RecommendAttentionCollectionReusableView.h"
#import "SDCycleScrollView.h"

@interface RecommendAttentionCollectionReusableView ()
{
    UIButton *previousButton;
}

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIButton *firstButton;
@property (weak, nonatomic) IBOutlet UIView *sliderView;
@property (weak, nonatomic) IBOutlet UIView *buttonsBackView;

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@end

@implementation RecommendAttentionCollectionReusableView

- (SDCycleScrollView *)cycleScrollView
{
    if (!_cycleScrollView) {
        NSArray *imageNames = @[@"01", @"02", @"03", @"04", @"05"];
        NSMutableArray *images = [NSMutableArray array];
        for (NSString *imageName in imageNames) {
            UIImage *image = [UIImage imageNamed:imageName];
            [images addObject:image];
        }
        
        self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:self.backView.frame imagesGroup:images];
    }
    return _cycleScrollView;
}

- (void)awakeFromNib {
    // Initialization code
    
    [self addSubview:self.cycleScrollView];
    [self buttonsAction:self.firstButton];
}

- (IBAction)buttonsAction:(UIButton *)sender {
    
    if (previousButton != nil) {
        [UIView animateWithDuration:0.5 animations:^{
            previousButton.titleLabel.font = [UIFont systemFontOfSize:12];
            [previousButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        }];
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        sender.titleLabel.font = [UIFont systemFontOfSize:16];
        [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.sliderView.frame = CGRectMake(CGRectGetMinX(sender.frame), CGRectGetMaxY(sender.frame) - 2, CGRectGetWidth(sender.frame), 2);
    }];
    
    previousButton = sender;
}


@end
