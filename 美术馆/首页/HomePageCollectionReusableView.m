//
//  HomePageCollectionReusableView.m
//  美术馆
//
//  Created by 邓超 on 15/11/19.
//  Copyright © 2015年 邓超. All rights reserved.
//

#import "HomePageCollectionReusableView.h"
#import "SDCycleScrollView.h"

@interface HomePageCollectionReusableView ()

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@end

@implementation HomePageCollectionReusableView

- (SDCycleScrollView *)cycleScrollView
{
    if (!_cycleScrollView) {
        NSArray *imageNames = @[@"01", @"02", @"03", @"04", @"05"];
        NSMutableArray *images = [NSMutableArray array];
        for (NSString *imageName in imageNames) {
            UIImage *image = [UIImage imageNamed:imageName];
            [images addObject:image];
        }
        
        self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds imagesGroup:images];
    }
    return _cycleScrollView;
}


- (void)awakeFromNib {
    // Initialization code
    
    [self addSubview:self.cycleScrollView];
}


@end
