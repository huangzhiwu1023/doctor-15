//
//  wenzhangViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/1.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "wenzhangViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "VideoCell.h"
#import "VideoViewModel.h"

@interface wenzhangViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) VideoViewModel *videoVM;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation wenzhangViewController
- (VideoViewModel *)videoVM{
    if (!_videoVM) {
        _videoVM=[VideoViewModel new];
    }
    return _videoVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory goback:self];
    _tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.videoVM refreshDataCompletionHandle:^(NSError *error) {
            [_tableView.header endRefreshing];
            [_tableView reloadData];
        }];
    }];
    [_tableView.header beginRefreshing];
    
    _tableView.footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.videoVM getMoreDataCompletionHandle:^(NSError *error) {
            [_tableView.footer endRefreshing];
            [_tableView reloadData];
        }];
    }];
}


#pragma mark =----UIYableview
//设置section头部高度1像素， 高度最小是1
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
//设置secion脚部高度9像素
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 9;
}
//row的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 720 *540
    CGFloat heigth= kWindowW * 540.0 / 720;
    return heigth;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.videoVM titleForRow:indexPath.section];
    cell.descLb.text = [self.videoVM descForRow:indexPath.section];
    [cell.iconBtn setBackgroundImageForState:0 withURL:[self.videoVM iconURLForRow:indexPath.section]];
    cell.videoURL=[self.videoVM videoURLForRow:indexPath.section];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.videoVM.rowNumber;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


@end
