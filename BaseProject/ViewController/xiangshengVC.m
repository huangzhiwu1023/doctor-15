//
//  xiangshengVC.m
//  BaseProject
//
//  Created by tarena on 15/11/1.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "xiangshengVC.h"
#import "GuoViewModel.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@interface xiangshengVC()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) GuoViewModel *guoVM;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation xiangshengVC
-(GuoViewModel *)guoVM{
    if (!_guoVM) {
        _guoVM=[GuoViewModel new];
    }
    return _guoVM;
}

- (void)viewDidLoad {
    [Factory goback:self];
    self.view.backgroundColor =[UIColor orangeColor];
    [super viewDidLoad];
    _tableview.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.guoVM refreshDataCompletionHandle:^(NSError *error) {
            [_tableview reloadData];
            [_tableview.header endRefreshing];
        }];
    }];
    [_tableview.header beginRefreshing];
    
    _tableview.footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.guoVM getMoreDataCompletionHanld:^(NSError *error) {
            [_tableview reloadData];
            [_tableview.footer endRefreshing];
        }];
    }];

}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:NO];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.guoVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    UIImageView *iconIV=(UIImageView *)[cell.contentView viewWithTag:100];
    UILabel *label=(UILabel *)[cell.contentView viewWithTag:200];
    [iconIV setImageWithURL:[self.guoVM imageURLForRow:indexPath.row]];
   label.text=[self.guoVM titleForRow:indexPath.row];
    return cell;
}

kRemoveCellSeparator
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //添加后台播放模式,需要在plist文件中添加background modes
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    
    AVPlayerViewController *vc=[AVPlayerViewController new];
    AVPlayer *player=[AVPlayer playerWithURL:[self.guoVM audioURLForRow:indexPath.row]];
    vc.player = player;
    [self presentViewController:vc animated:YES completion:nil];
    [vc.player play];  //弹出之后 自动播放
}


@end
