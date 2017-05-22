//
//  xiaohuaViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "xiaohuaViewController.h"
#import "xiaohuaViewModel.h"
@interface testcell : UITableViewCell
@property(nonatomic,strong)UILabel *title;
@property(nonatomic,strong)UIImageView *icon;
@end
@implementation testcell
-(UILabel *)title
{
    if (_title == nil) {
        _title =[UILabel new];
    }
    [self.contentView addSubview:_title];
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.left.mas_equalTo(10);
        make.height.mas_equalTo(60);
        make.top.mas_equalTo(10);
    }];
    
    return _title;
}
-(UIImageView *)icon
{
    if (_icon == nil) {
        _icon =[UIImageView new];
        [self.contentView addSubview:_icon];
        _icon.image =[UIImage imageNamed:@"tu.jpg"];
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.title.mas_bottom).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.left.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            
        }];
    }
    return _icon;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}
@end
@interface xiaohuaViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)xiaohuaViewModel *vm;
@property(nonatomic,strong)UITableView *tableview;
@end
@implementation xiaohuaViewController
-(xiaohuaViewModel *)vm{
    
    if (_vm == nil) {
        _vm = [xiaohuaViewModel new];
    }
    return _vm;
}
-(UITableView *)tableview
{
        if (_tableview == nil) {
        _tableview =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_tableview registerClass:[testcell class] forCellReuseIdentifier:@"Cell"];
        _tableview.delegate =self;
        _tableview.dataSource =self;
        [self.view addSubview:_tableview];
        [_tableview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
        _tableview.header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.vm refreshDataCompletionHandle:^(NSError *error) {
                if (error)
                {
                    [self showErrorMsg:error.localizedDescription];
                }
                else{
                    [_tableview reloadData];
                    [_tableview.header endRefreshing];
                }
            }];
        }];
        
        _tableview.footer =[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            
            [self.vm getMoreDataCompletionHandle:^(NSError *error) {
                [_tableview reloadData];
                [_tableview.footer endRefreshing];
                
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                    [_tableview.footer endRefreshing];
                }
                else
                {
                    [_tableview reloadData];
                    if (self.vm.ismorePage) {
                        [_tableview.footer endRefreshing];
                    }else{
                        [_tableview.footer endRefreshingWithNoMoreData];
                    }
                }
             
                [_tableview.footer endRefreshing];
            }];
            
        }];
            [self.tableview.header beginRefreshing];

        
    }
    return _tableview;
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
      [self.tableview.header beginRefreshing];
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title =@"笑话短片";
    [Factory goback:self];
    [self.tableview.header beginRefreshing];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.vm.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    testcell *cell =[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.title.text =[self.vm titleForRor:indexPath.row];
    [cell.icon setImageWithURL:[self.vm URLForRow:indexPath.row]];
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return tableView.estimatedRowHeight;
}

@end
