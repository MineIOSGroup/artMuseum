//
//  SettingViewController.m
//  美术馆
//
//  Created by Young on 11/23/15.
//  Copyright © 2015 邓超. All rights reserved.
//

#import "addressManageViewController.h"
#import "SettingViewController.h"
#import "SettingCell.h"

@interface SettingViewController ()

@property (nonatomic, strong) UITableView *settingTableView;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView
{
    self.settingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 530) style:UITableViewStylePlain];
    
    self.settingTableView.delegate = self;
    self.settingTableView.dataSource = self;
    
    [self.view addSubview:self.settingTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 11;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    }
    
    if (section == 6) {
        return 20;
    }
    
    else
    {
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 100;
    }
    
    else{
        return 40;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"SettingCell";
    SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SettingCell" owner:self options:nil] lastObject];
    }
    
    if (indexPath.section == 0) {
        cell.titleLabel.text = @"头像";
        NSLayoutConstraint *constraint =
        [NSLayoutConstraint constraintWithItem:cell.descButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:75];
        [cell.descButton addConstraint:constraint];
        [cell.descButton setBackgroundImage:[UIImage imageNamed:@"iconfont-headimage"] forState:UIControlStateNormal];
//        NSLog(@"%f",cell.descButton.bounds.size.height);
    }
    
    if (indexPath.section == 1) {
        cell.titleLabel.text = @"真实名称";
        [cell.descButton setTitle:@"XXX" forState:UIControlStateNormal];
    }
    
    if (indexPath.section == 2) {
        cell.titleLabel.text = @"个性网址";
        [cell.descButton setTitle:@"至少4个字符" forState:UIControlStateNormal];
    }
    
    if (indexPath.section == 3) {
        cell.titleLabel.text = @"性别";
        [cell.descButton setTitle:@"保密" forState:UIControlStateNormal];
    }
    
    if (indexPath.section == 4) {
        cell.titleLabel.text = @"所在城市";
        [cell.descButton setTitle:@"福建厦门" forState:UIControlStateNormal];
    }
    
    if (indexPath.section == 5) {
        cell.titleLabel.text = @"收货地址";
        [cell.descButton setTitle:@"添加收货地址" forState:UIControlStateNormal];
    }
    
    if (indexPath.section == 6) {
        cell.titleLabel.text = @"手机绑定";
        [cell.descButton setTitle:@"未绑定" forState:UIControlStateNormal];
    }
    
    if (indexPath.section == 7) {
        cell.titleLabel.text = @"邮箱绑定";
        [cell.descButton setTitle:@"未绑定" forState:UIControlStateNormal];
    }
    
    if (indexPath.section == 8) {
        cell.titleLabel.text = @"院校";
        [cell.descButton setTitle:@"保密" forState:UIControlStateNormal]; 
    }
    
    if (indexPath.section == 9) {
        cell.titleLabel.text = @"用户认证";
        [cell.descButton setTitle:@"获取更多认证" forState:UIControlStateNormal];
    }
    
    if (indexPath.section == 10) {
        cell.titleLabel.text = @"同步";
        [cell.descButton setTitle:@"微博" forState:UIControlStateNormal];
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 5) {
        addressManageViewController *adressManageVC = [[addressManageViewController alloc] init];
        [self.navigationController pushViewController:adressManageVC animated:YES];
    }
}

@end
