//
//  CreateUserViewController.m
//  BaseProject
//
//  Created by tarena on 15/10/29.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CreateUserViewController.h"
#import "LoinVC.h"
#import <AVFoundation/AVFoundation.h>
#import "zhuceModel.h"

static NSMutableArray *array;
@interface CreateUserViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bo;

@end

@implementation CreateUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self makeyanzheng];
    
    array = [NSMutableArray array];
 
}
//产生验证码
-(void)makeyanzheng
{
    int i =arc4random() %10000;
    if (i< 1000) {
        i = i+1000;
    }
    self.yanzheng.text =[NSString stringWithFormat:@"%d",i];
}
- (IBAction)zhuce:(id)sender {
    BOOL keyIsEqual =[self.key.text isEqualToString: self.key0.text];
    BOOL yanzheng =[self.yanzheng1.text isEqualToString:self.yanzheng.text];
    if (keyIsEqual && yanzheng) {
        [UIAlertView bk_showAlertViewWithTitle:@"恭喜注册成功" message:@"欢迎使用" cancelButtonTitle:@"点击登入" otherButtonTitles:@[@"好"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
            NSString *path =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES).firstObject;
            path = [path stringByAppendingString:@"/nameAndKey1.plist"];
            NSLog(@"看看路径有没有%@",path);
            NSMutableDictionary *dic =[NSMutableDictionary dictionary];
            [dic setObject:self.name.text forKey:@"name"];
            [dic setObject:self.key.text forKey:@"key"];
            
            [array addObject:dic];
            
            [array writeToFile:path atomically:YES];
            NSLog(@"%@",array);
            NSLog(@"%@",dic);
            UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LVC"];
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            window.rootViewController =vc;
        }];
    }
    if (keyIsEqual == NO)
    {
        [UIAlertView bk_showAlertViewWithTitle:@"输入错误" message:@"两次密码输入不相同" cancelButtonTitle:@"重新输入" otherButtonTitles:@[@"好"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
            [self.key0 becomeFirstResponder];
            [self makeyanzheng];
        }];
    }
    if (yanzheng == NO) {
        [UIAlertView bk_showAlertViewWithTitle:@"输入错误" message:@"验证码输入错误" cancelButtonTitle:@"重新输入" otherButtonTitles:@[@"好"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
            [self.yanzheng becomeFirstResponder];
            [self makeyanzheng];
        }];
    }
    
}
//取消注册
- (IBAction)quxiao:(id)sender {
    [UIAlertView bk_showAlertViewWithTitle:@"是否取消" message:@"取消数据将无法保存" cancelButtonTitle:@"继续" otherButtonTitles:@[@"取消"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
        if(buttonIndex == 1){
            UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LVC"];
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            window.rootViewController =vc;
        }
          }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}




-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //添加对键盘的弹起监听
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(openKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    //添加对键盘收起的监听
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(closeKeyboard:) name:UIKeyboardWillHideNotification object:nil];
}
//键盘的开
-(void)openKeyboard:(NSNotification *)notification
{
    // 从通知的userInfo中取出键盘的高度
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 从通知的userInfo中取得动画的选项
    int option = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    // 从通知的userInfo中取得动画的时长
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    self.bo.constant = keyboardFrame.size.height -100;
    
    // 做动画来修改约束
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        [self.view   layoutIfNeeded];
        
    } completion:nil];
}
//键盘的关
-(void)closeKeyboard:(NSNotification *)notification
{
    // 从通知的userInfo中取得动画的选项
    NSInteger option = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    // 从通知的userInfo中取得动画的时长
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
   self.bo.constant = 0;
    
    // 做动画来修改约束
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
    
}
//销毁
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:UIKeyboardWillShowNotification];
    [[NSNotificationCenter defaultCenter]removeObserver:UIKeyboardWillHideNotification];
}








@end
