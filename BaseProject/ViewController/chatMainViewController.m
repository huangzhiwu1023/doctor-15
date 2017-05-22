//
//  chatMainViewController.m
//  testdoctor
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 星海集团. All rights reserved.
//

#import "chatMainViewController.h"
#import "message.h"
#import "chatTableViewCell.h"
@interface chatMainViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottom;
@property(nonatomic,strong)NSMutableArray *allmess;
@property(nonatomic,strong)UITextField *text;
@property (weak, nonatomic) IBOutlet UITextField *textFlied;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//为了它的行高是它内容的高
@property(nonatomic,strong)chatTableViewCell *cell;
@property(nonatomic)BOOL isme;


@end

@implementation chatMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self read];
    
      }

//2.读取内容
-(void)read
{
    self.allmess =[[NSMutableArray alloc]init];
    //从文件中读取已经有的聊天记录
    NSString *filepath = [[NSBundle mainBundle]pathForResource:@"message" ofType:@"plist"];
    //拿到app的资源包
    NSArray *array =[NSArray arrayWithContentsOfFile:filepath];
    for (NSDictionary *dict in array) {
        message *mess1 = [[message alloc]init];
        [mess1 setValuesForKeysWithDictionary:dict];
        [self.allmess addObject:mess1];
    }
    
    
}


//1.设置键盘和发送------------------------------
//1.添加观察者，键盘通知，键盘声明时候弹起和收起
-(void)viewDidAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(open:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(close:) name:UIKeyboardWillHideNotification object:nil];
    //添加就要马上写一个销毁的

}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:UIKeyboardDidShowNotification];
    [[NSNotificationCenter defaultCenter]removeObserver:UIKeyboardDidHideNotification];

}
//实现方法
-(void)open:(NSNotification *)notification
{
//将输入的框弹起，动画的
    //键盘的高
    CGRect keyBoardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey]CGRectValue];
    //键盘升起的动画时长
    NSTimeInterval duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    //使用的动画选项，因为它是要和键盘一起上下
    UIViewAnimationOptions options =[notification.userInfo[UIKeyboardAnimationCurveUserInfoKey]intValue];
    self.bottom.constant =keyBoardFrame.size.height;
    //重新加载下
    [UIView animateWithDuration:duration delay:0 options:options animations:^{
        [self.view layoutIfNeeded];
        [self scrollToTableViewLastRow];
    } completion:nil];

}

-(void)close:(NSNotification *)notification
{
    NSTimeInterval duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    //使用的动画选项，因为它是要和键盘一起上下
    UIViewAnimationOptions options =[notification.userInfo[UIKeyboardAnimationCurveUserInfoKey]intValue];
    self.bottom.constant =0;
    //重新加载下
    [UIView animateWithDuration:duration delay:0 options:options animations:^{
        [self.view layoutIfNeeded];
        [self scrollToTableViewLastRow];
    } completion:nil];



}
- (IBAction)chang:(UITextField *)sender {
    [sender resignFirstResponder];
    self.text =sender;
    if (sender.text.length == 0) {
        return;
    }
    message *mess1 = [[message alloc]init];
    mess1.content =sender.text;
    self.text.text =sender.text;
    mess1.isme = self.isme;
    [self.allmess addObject:mess1];
    sender.text =@"";
    NSIndexPath *indexpath =[NSIndexPath indexPathForItem:self.allmess.count -1
                                                inSection:0];
    //插入到表格的最后一行
    [self.tableView insertRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationBottom];
    [self scrollToTableViewLastRow];
    [self.tableView reloadData];
    
}


-(void)scrollToTableViewLastRow
{
    NSIndexPath *lastIndexPath = [NSIndexPath indexPathForRow:self.allmess.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:lastIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    
}


- (IBAction)send:(UIButton *)sender {
    
  
    [self.text resignFirstResponder];
     self.text =self.text;
    if (self.text.text.length == 0) {
        return;
    }

    message *mess1 = [[message alloc]init];
    mess1.content =self.text.text;
    mess1.isme = self.isme;
    [self.allmess addObject:mess1];
    self.text.text =@"";
    NSIndexPath *indexpath =[NSIndexPath indexPathForItem:self.allmess.count -1
                                                inSection:0];
    //插入到表格的最后一行
    [self.tableView insertRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationBottom];
    [self scrollToTableViewLastRow];
    [self.tableView reloadData];
    
}

- (IBAction)change:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.isme =sender.selected;
    
}

#pragma mark-----实现协议方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return  1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.allmess.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  self.cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    self.cell.mess = self.allmess[indexPath.row];
    return self.cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat c= self.cell.popimageview.frame.size.height + 10;
    return c;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
