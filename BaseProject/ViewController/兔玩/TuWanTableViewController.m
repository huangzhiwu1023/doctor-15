//
//  TuWanTableViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanTableViewController.h"
#import "TuWanViewModel.h"
#import "TuwanListCell.h"
#import "TuWanTableViewController.h"
#import "TuWanImgaeCell.h"
#import "iCarousel.h"
#import "TuWanHtmlViewController.h"
@interface TuWanTableViewController ()<iCarouselDataSource,iCarouselDelegate>
@property(nonatomic,strong)TuWanViewModel *vm;

@end

@implementation TuWanTableViewController
{
//添加的成员的变量，因为不需要的懒加载的，所以不需要的属性
   iCarousel *_ic;
    UILabel *_titleLb;
   UIPageControl *_pageControl;
    NSTimer *_timer;
}
-(UIView *)headview
{
    [_timer invalidate];//关闭定时器
    //没有的的情况下
    if (![self.vm isExistIndexPic]) {
        return nil;
    }
    //头部视图的同宽的
    UIView *headview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, kWindowW/3*2)];
    //添加底部的视图
    UIView *bottomView =[[UIView alloc]init];
    bottomView.backgroundColor =kRGBColor(240, 240, 240);
    [headview addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
    _titleLb =[UILabel new];
    [bottomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _pageControl =[UIPageControl new];
    _pageControl.numberOfPages =self.vm.indexPicnumber;
    [bottomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(60);
        make.width.mas_greaterThanOrEqualTo(20);
        make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(10);
    }];
    _titleLb.text =[self.vm titleForRowInIndexPic:0];
    _pageControl.userInteractionEnabled =NO;
    //添加滚动的栏
    _ic =[iCarousel new];
    [headview addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_top).mas_equalTo(0);
    }];
    _ic.pagingEnabled =YES;
    _ic.scrollSpeed =1;
    _ic.delegate =self;
    _ic.dataSource =self;
    //只有一张图，不显示原点和不可以滚动的
    _pageControl.hidesForSinglePage =YES;
    _ic.scrollEnabled =self.vm.indexPicnumber !=1;
    _pageControl.pageIndicatorTintColor =[UIColor orangeColor];
    _pageControl.currentPageIndicatorTintColor =[UIColor grayColor];
    
    return headview;
}

-(TuWanViewModel *)vm
{
    if (_vm == nil) {
        _vm =[[TuWanViewModel alloc]initWithType:_tuwanType.integerValue];
    }
    return _vm;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[TuwanListCell class] forCellReuseIdentifier:@"Cell"];
     [self.tableView registerClass:[TuWanImgaeCell class] forCellReuseIdentifier:@"ImageCell"];
    //头部的刷新
    self.tableView.header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.vm refreshDataCompletionHandle:^(NSError *error) {
            self.tableView.tableHeaderView =[self headview];
             [self.tableView reloadData];
            [self.tableView.header endRefreshing];
        }];
    }];
   
    [self.tableView.header beginRefreshing];
    self.tableView.footer =[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.vm getMoreDataCompletionHandle:^(NSError *error) {
            self.tableView.tableHeaderView =[self headview];
            [self.tableView reloadData];
            [self.tableView.footer endRefreshing];
        }];
    }];
    if(self.vm.indexPicnumber >1)
    {
        _timer =[NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
        } repeats:YES];
        
    }

   
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.vm.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.vm containImages:indexPath.row]) {
    TuWanImgaeCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ImageCell" forIndexPath:indexPath];
        cell.titleLb.text =[self.vm titleForRowList:indexPath.row];
        cell.cliksNumLb.text =[self.vm clickForRowList:indexPath.row];
        [cell.iconV1.imageView setImageWithURL:[self.vm iconUrlSForRow:indexPath.row][0]placeholderImage:[UIImage imageNamed:@"fbb03.jpg"]];
        [cell.iconV2.imageView setImageWithURL:[self.vm iconUrlSForRow:indexPath.row][1]placeholderImage:[UIImage imageNamed:@"fbb03.jpg"]];
        [cell.iconV3.imageView setImageWithURL:[self.vm iconUrlSForRow:indexPath.row][2]placeholderImage:[UIImage imageNamed:@"fbb03.jpg"]];
        return cell;
    }
    
    TuwanListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconIV.imageView setImageWithURL:[self.vm iconForRowList:indexPath.row]placeholderImage:[UIImage imageNamed:@"fbb03.jpg"]];
     cell.titleLb.text =[self.vm titleForRowList:indexPath.row];
     cell.longTitleLb.text =[self.vm descForRowList:indexPath.row];
     cell.clicksNumLb.text =[self.vm clickForRowList:indexPath.row];
        return cell;
    
    
}

//优化的设置
kRemoveCellSeparator
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.vm isHtmlInListForRow:indexPath.row]) {
        TuWanHtmlViewController *vc =[[TuWanHtmlViewController alloc]initWithUrl:[self.vm  detailUrlForRowInList:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.vm containImages:indexPath.row]?135:90;
    
}

#pragma mark---
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.vm.indexPicnumber;
}
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view) {
        view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowH, kWindowW/3*2-35)];
        UIImageView *imageview =[UIImageView new];
        [view addSubview:imageview];
        imageview.tag =100;
        imageview.contentMode =2;
        view.clipsToBounds =YES;
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageview =(UIImageView *)[view viewWithTag:100];
    [imageview setImageWithURL:[self.vm iconForRowInindexPic:index] placeholderImage:[UIImage imageNamed:@"fbb03.jpg"]];
    return view;
    
}
//运行环的滚动的
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}
//监控当前滚动的第几个的做响应的改变的
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
  NSLog(@"%ld",carousel.currentItemIndex);
    
    _titleLb.text =[self.vm titleForRowInIndexPic:carousel.currentItemIndex];
    _pageControl.currentPage =carousel.currentItemIndex;
    
    
}

-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    if ([self.vm isHtmlInindePicForRow:index]) {
        TuWanHtmlViewController *vc =[[TuWanHtmlViewController alloc]initWithUrl:[self.vm detailUrlForRowInIndexPic:index]];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
