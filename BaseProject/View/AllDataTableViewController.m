//
//  AllDataTableViewController.m
//  testdoctor
//
//  Created by tarena on 15/10/9.
//  Copyright (c) 2015年 星海集团. All rights reserved.
//

#import "AllDataTableViewController.h"
#import "ShowResultTableViewController.h"
#import "information.h"
@interface AllDataTableViewController ()<UISearchResultsUpdating,UISearchBarDelegate>
 //创建用的展示搜索结果的
@property(nonatomic,strong)ShowResultTableViewController *showResultVc;
//创建一个搜索控制器属性
@property(nonatomic,strong)UISearchController *searchController;

//接收所有的数
@property(nonatomic,strong)NSMutableArray *allData;

@end

@implementation AllDataTableViewController

-(ShowResultTableViewController *)showResultVc
{
    if (!_showResultVc) {
        _showResultVc =[[ShowResultTableViewController alloc]init];
    }
    return _showResultVc;
}

-(UISearchController *)searchController
{
    if (!_searchController) {
        //将搜索结果的和搜索控制器绑在一起
        _searchController =[[UISearchController alloc]initWithSearchResultsController:self.showResultVc];
    }
    return _searchController;
}

-(NSArray *)allData
{
    if (!_allData) {
        _allData = [[NSMutableArray alloc]init];
    }
    return _allData;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Factory goback:self];
//    FUIButton *b =[FUIButton new];
//    b.frame =CGRectMake(0, 0, 80, 30);
//    [b setTitle:@"返回主页" forState:0];
//    [factroy SetButtonUserFlatUIKit:b];
//    [b bk_addEventHandler:^(id sender) {
//        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TBC"];
//        UIWindow *window = [UIApplication sharedApplication].keyWindow;
//        window.rootViewController =vc;
//        
//        
//    } forControlEvents:UIControlEventTouchUpInside];
//    
//    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:b];
    
    
 //设置搜索框的大小
    [self.searchController.searchBar sizeToFit];
    //类别
    self.searchController.searchBar.scopeButtonTitles = @[@"感冒",@"发烧",@"流鼻涕"];
    //当前控制器的添加
    self.tableView.tableHeaderView =self.searchController.searchBar;
    //设置搜索框控制器的代理
    self.searchController.searchResultsUpdater =self;
  
    //运行切换
    self.definesPresentationContext =YES;
    
    self.searchController.searchBar.delegate =self;
    
    //把数据给了这个数组
    NSString *filePath =[[NSBundle mainBundle]pathForResource:@"data" ofType:@"plist"];
    //拿到app的资源包
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    for (NSDictionary *dict in array) {
        information *infor = [[information alloc]init];
        [infor setValuesForKeysWithDictionary:dict];
        [self.allData addObject:infor];
    }
}



#pragma mark ---- 遵守的协议UISearchBarDelegate协议
-(void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    [self updateSearchResultsForSearchController:self.searchController];

}
#pragma mark - UISearchResultUpdating协议
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
//从委托方中获取用户在文本框中输入的文字内容
    NSString *searchText = searchController.searchBar.text;
    //从委托方中获取用户的选择的类别按钮
   // NSInteger selectedButtonIndex = searchController.searchBar.selectedScopeButtonIndex;
    //到self.alldata中一个一个对比
    NSMutableArray *resultArray = [NSMutableArray array];
    for (information *m in self.allData) {
        NSRange range = [m.illness rangeOfString:searchText];
        //如果名称匹配，且类别相同则将此产品记录到数组中
        if(range.length > 0 )
        {
            //m.***==selectedButtonIndex
            [resultArray addObject:m];
        }
    }
    // 将要展示的数据结果给 绿色的vc传过去
    self.showResultVc.resultArray = resultArray;
    
    // 更新视图显示数据
    [self.showResultVc.tableView reloadData];

}






#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.allData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    information *m = self.allData[indexPath.row];
    cell.textLabel.text =m.illness;
    
    
    return cell;
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
