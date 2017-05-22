//
//  ximaDatailViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ximaDatailViewController.h"
#import "XiMaDetailViewModel.h"
#import "XiMaDetailCell.h"
#import <AVFoundation/AVFoundation.h>
#import "playView.h"
@interface ximaDatailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)XiMaDetailViewModel *vm;

@end

@implementation ximaDatailViewController

-(id)initWithId:(NSInteger)Id
{
    if (self =[super init]) {
        self.Id =Id;//这个地方。。。。。。
    }
    return self;
}
-(XiMaDetailViewModel *)vm
{
    if (_vm ==nil) {
        _vm =[[XiMaDetailViewModel alloc]initWithId:_Id];
    }
    return _vm;
}
-(UITableView *)tableview
{
    if (_tableview ==nil) {
        _tableview =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableview.delegate =self;
        _tableview.dataSource =self;
        [self.view addSubview:_tableview];
        [_tableview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
         [_tableview registerClass:[XiMaDetailCell class] forCellReuseIdentifier:@"Cell"];
        _tableview.tableFooterView =[UIView new];
        _tableview.estimatedRowHeight = UITableViewAutomaticDimension;//给一个猜测的行高，可以自行
        _tableview.header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.vm refreshDataCompletionHandle:^(NSError *error) {
                if (error)
                {
                    [self showErrorMsg:error.localizedDescription];
                }
                else
                {
                [_tableview reloadData];
                [_tableview.footer resetNoMoreData];
                }
                 [_tableview.header endRefreshing];
            }];
        }];
        _tableview.footer =[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.vm getMoreDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                     [_tableview.footer endRefreshing];
                }
                else
                {
                    [_tableview reloadData];
                    if (self.vm.isMorePage) {
                         [_tableview.footer endRefreshing];
                    }
                    else{
                        [_tableview.footer endRefreshingWithNoMoreData];//结束没有更多，结束刷新
                    }
                   
                }
                
            }];
        }];
       
        
        
        
    }
    return _tableview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   [Factory addBackItemToVC:self];
   [self.tableview.header beginRefreshing];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.vm.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XiMaDetailCell *cell =[tableView dequeueReusableCellWithIdentifier:@"Cell"];
     cell.titleLb.text =[self.vm titleForRow:indexPath.row];
    cell.sourceLb.text =[self.vm sourceForRow:indexPath.row];
   
    cell.timeLb.text =[self.vm timeForRow:indexPath.row];
    [cell.iconIV.imageView setImageWithURL:[self.vm coverURLForRow:indexPath.row]];
    cell.playCountLb.text =[self.vm playnumberForRow:indexPath.row];
    cell.favorCountLb.text =[self.vm favornumberForRow: indexPath.row];
    cell.commentCountLb.text=[self.vm commentnumberForRow:indexPath.row];
    cell.durtionLb.text =[self.vm duratonForRow:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[playView sharedInstance] palyWith:[self.vm musicURLForRow:indexPath.row]];
    
    
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 0;
}
@end
