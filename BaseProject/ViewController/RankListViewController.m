//
//  RankListViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RankListViewController.h"
#import "XiMaCell.h"
#import "XiMaCategoryViewModel.h"
#import "ximaDatailViewController.h"
@interface RankListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)XiMaCategoryViewModel *XimaVm;
@end

@implementation RankListViewController
-(UITableView *)tableview
{
    if (_tableview ==nil) {
        _tableview =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableview.delegate =self;
        _tableview.dataSource =self;
        [_tableview registerClass:[XiMaCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableview];
        [_tableview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _tableview;
}
-(XiMaCategoryViewModel *)XimaVm
{
    if (_XimaVm == nil) {
        _XimaVm =[XiMaCategoryViewModel new];
    }
    return _XimaVm;
}
+(UINavigationController *)defaultNavi
{
    static UINavigationController *navi =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        RankListViewController *vc =[RankListViewController new];
        navi =[[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory goback:self];
    [Factory addBackItemToVC:self];
    self.title =@"在线音乐";
    self.tableview.header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.XimaVm refreshDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showSuccessMsg:error];
            }
            else{
                [self.tableview reloadData];
                
            }
            [_tableview.footer resetNoMoreData];//重制脚部 ，没有更多的数据
            [self.tableview.header endRefreshing];
        }];
    }];
    self.tableview.footer =[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.XimaVm getMoreDataCompletionHandle:^(NSError *error) {
            if (error) {
                [self showSuccessMsg:error.localizedDescription];//
                if (error.code == 999) {
                    //没有更多的了，就停止刷新
                    [self.tableview.footer endRefreshingWithNoMoreData];//
                }
            }
            else
            {
                [self.tableview reloadData];
            }
            [self.tableview.footer endRefreshing];
        }];
        
    }];
    [self.tableview.header beginRefreshing];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.XimaVm.rowNumber;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XiMaCell *cell =[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text =[self.XimaVm titleForRow:indexPath.row];
    cell.descLb.text =[self.XimaVm descForRow:indexPath.row];
    cell.numberLb.text =[self.XimaVm numberForRow:indexPath.row];
    [cell.iconIV.imageView setImageWithURL:[self.XimaVm iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"fbb03.jpg"]];
    cell.orderLb.text =@(indexPath.row +1).stringValue;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
  ximaDatailViewController *vc =[[ximaDatailViewController alloc]initWithId:[self.XimaVm albumIdForRow:indexPath.row]];
  [self.navigationController pushViewController:vc animated:YES];
    

    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{return 170/2;
}


@end
