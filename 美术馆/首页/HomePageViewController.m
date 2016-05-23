//
//  HomePageViewController.m
//  美术馆
//
//  Created by 邓超 on 15/11/19.
//  Copyright © 2015年 邓超. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageCollectionViewCell.h"
#import "HomePageCollectionReusableView.h"
#import "NavigationBar+BackGroundColor.h"
#import "HomeButton.h"
#import "Header.h"
#import "PrePageViewController.h"
#import "ATNavigationController.h"

#define NAVBAR_CHANGE_POINT 50

@interface HomePageViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIPopoverControllerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setNavigationBar];
    
    [self firstLaunch];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"HomePageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"HomePageCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
    
    [self request];
}

- (void)request
{
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    
    [paramDic setObject:@"13917104187" forKey:@"account"];
    NSString *pwd = [Utils MD5StringWithString:@"123456"];
    [paramDic setObject:pwd forKey:@"pwd"];
    
    NSString *uuid = [Utils getUUID];
    [paramDic setObject:uuid forKey:@"deviceno"];
    [paramDic setObject:@"1" forKey:@"devicetype"];
    
    NSString *str = [NSString stringWithFormat:@"%@%@%@%@%@", @"13917104187", pwd, uuid, @"1", MD5_KEY];
    NSString *signstr = [Utils MD5StringWithString:str];
    [paramDic setObject:signstr forKey:@"signstr"];
    
    NSString *url = [NSString stringWithFormat:@"%@%@", SERVER_URL, USERLOGIN];
    [HTTPManager HTTPWithUrlPath:url withParam:paramDic withFinish:^(NSDictionary *data, NSError *error) {
        
    }];
}

/**
 *  是否第一次启动程序
 */
- (void)firstLaunch
{
    if ([Utils isFirstLaunch]) {
        PrePageViewController *preVC = [[PrePageViewController alloc] init];
        ATNavigationController *atNai = [[ATNavigationController alloc] initWithRootViewController:preVC];
        [self presentViewController:atNai animated:YES completion:nil];
    }
}

/**
 *  设置NavigationBar
 */
- (void)setNavigationBar
{
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"iconfont-camera"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(publishAction)];
    
    HomeButton *homeButton = [[NSBundle mainBundle] loadNibNamed:@"HomeButton" owner:nil options:nil].firstObject;
    homeButton.center = CGPointMake(self.navigationController.navigationBar.center.x, 20);
    [self.navigationController.navigationBar addSubview:homeButton];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor * color = [Utils colorWithHexString:@"0x999999" withAlpha:1];
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_CHANGE_POINT) {
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
        [self.navigationController.navigationBar setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomePageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
    }
    return reusableView;
}

/**
 *  发布
 */
- (void)publishAction
{
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 200)];
//    view.backgroundColor = [UIColor redColor];
//    UIViewController *vc = [[UIViewController alloc] init];
//    vc.modalPresentationStyle = UIModalPresentationPopover;
//    vc.popoverPresentationController.sourceView = view;
//    vc.popoverPresentationController.sourceRect = view.frame;
//    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
