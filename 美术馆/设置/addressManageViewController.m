//
//  addressManageViewController.m
//  美术馆
//
//  Created by Young on 11/24/15.
//  Copyright © 2015 邓超. All rights reserved.
//

#import "addressManageViewController.h"
#import "addressManageCell.h"

@interface addressManageViewController ()

{
    NSIndexPath *lastPath;
}
@property (strong, nonatomic) IBOutlet UIButton *addAddressButton;
@property (strong, nonatomic) IBOutlet UITableView *addressTableView;

@end

@implementation addressManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initView];
}

- (void)initView
{
    self.addressTableView.rowHeight = 60;
    self.addressTableView.estimatedRowHeight = UITableViewAutomaticDimension;
    
    self.addressTableView.delegate = self;
    self.addressTableView.dataSource = self;
    
    self.addressTableView.allowsSelection = YES;
    
    [self.view addSubview:self.addressTableView];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"addressManageCell";
    addressManageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:cellID owner:self options:nil] lastObject];
    }
    
    cell.addressLabel.text = @"address";
    cell.contactLabel.text = @"contact";
    cell.phoneLabel.text = @"135XXX";
    
    lastPath = indexPath;
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (lastPath == indexPath) {
        return ;
    }
    UITableViewCell *lastCell = [tableView cellForRowAtIndexPath:lastPath];
    lastCell.accessoryType = UITableViewCellAccessoryNone;
    
    UITableViewCell *currentCell = [tableView cellForRowAtIndexPath:indexPath];
    currentCell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    lastPath = indexPath;
    currentCell.selectionStyle = UITableViewCellSelectionStyleBlue;
}

- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
