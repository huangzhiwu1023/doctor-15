//
//  ViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ViewController.h"
#import "KindViewModel.h"
#import "IntroViewController.h"
#import "ShiListViewController.h"
#import "SearchShiViewModel.h"
#import "ShiDetailViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) KindViewModel *kindVM;
@property(nonatomic,strong) SearchShiViewModel *searchVM;
@end

@implementation ViewController

- (void)viewDidLoad {
    [Factory goback:self];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView.tableFooterView = [UIView new];
    [self.searchDisplayController.searchResultsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.searchDisplayController.searchResultsTableView.tableFooterView = [UIView new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView != _tableView) {
        return self.searchVM.rowNumber;
    }
    return self.kindVM.rowNumber;
}

kRemoveCellSeparator

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (tableView == _tableView) {
        UILabel *titleLb = (UILabel *)[cell.contentView viewWithTag:100];
        titleLb.text = [self.kindVM titleForRow:indexPath.row];
        
        UIButton *btn = (UIButton *)[cell.contentView viewWithTag:200];
        btn.hidden = [self.kindVM haveDetail:indexPath.row];
        btn.layer.cornerRadius = 10;
        [btn bk_addEventHandler:^(UIButton *sender) {
            IntroViewController *vc = kVCFromSb(@"IntroViewController", @"Main");
            vc.title = titleLb.text;
            vc.intro = [self.kindVM detailForRow:indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = [self.searchVM titleForRow:indexPath.row];
        cell.detailTextLabel.text = [self.searchVM authorForRow:indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView != _tableView) {
        ShiDetailViewController *vc = kVCFromSb(@"ShiDetailViewController", @"Main");
        vc.shi = [self.searchVM shiForRow:indexPath.row];
        vc.introShi = [self.searchVM shiIntroForRow:indexPath.row];
        vc.title = [self.searchVM titleForRow:indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
        [self.searchDisplayController setActive:NO animated:NO];
        self.searchDisplayController.searchBar.text = @"";
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return tableView == _tableView;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除此项";
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [UIAlertView bk_showAlertViewWithTitle:[self.kindVM titleForRow:indexPath.row] message:@"确定要删除这个诗集吗?" cancelButtonTitle:@"取消" otherButtonTitles:@[@"确定"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex) {
                if ([self.kindVM removeKindForRow:indexPath.row]) {
                    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                }
            }
        }];
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    self.searchVM.searchStr = searchBar.text;
    [self.searchDisplayController.searchResultsTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ShiListViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [_tableView indexPathForCell:sender];
    vc.kind = [self.kindVM kindForRow:indexPath.row];
}


- (KindViewModel *)kindVM {
	if(_kindVM == nil) {
		_kindVM = [[KindViewModel alloc] init];
	}
	return _kindVM;
}

- (SearchShiViewModel *)searchVM {
	if(_searchVM == nil) {
		_searchVM = [[SearchShiViewModel alloc] init];
	}
	return _searchVM;
}

@end
