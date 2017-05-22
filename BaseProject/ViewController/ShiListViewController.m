//
//  ShiListViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShiListViewController.h"
#import "ShiViewModel.h"
#import "ShiDetailViewController.h"

@interface ShiListViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) ShiViewModel *shiVM;
@end

@implementation ShiListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = _kind;
    _tableView.tableFooterView =[UIView new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.shiVM.rowNumber;
}
kRemoveCellSeparator

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [self.shiVM titleForRow:indexPath.row];
    cell.detailTextLabel.text = [self.shiVM authorForRow:indexPath.row];
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除此诗";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [UIAlertView bk_showAlertViewWithTitle:[self.shiVM titleForRow:indexPath.row] message:@"确定删除此诗吗?" cancelButtonTitle:@"取消" otherButtonTitles:@[@"确定"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex) {
                if ([self.shiVM removeShiForRow:indexPath.row]) {
                    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                }
            }
        }];
    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    ShiDetailViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [_tableView indexPathForCell:sender];
    vc.shi = [self.shiVM shiForRow:indexPath.row];
    vc.introShi = [self.shiVM shiIntroForRow:indexPath.row];
    vc.title = [self.shiVM titleForRow:indexPath.row];
}


- (ShiViewModel *)shiVM {
	if(_shiVM == nil) {
		_shiVM = [[ShiViewModel alloc] initWithKind:_kind];
	}
	return _shiVM;
}

@end
