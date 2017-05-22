//
//  keyBoard.m
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "keyBoard.h"
#import "key.h"
@interface keyBoard ()

@end

@implementation keyBoard

- (void)viewDidLoad {
    [super viewDidLoad];
 
 }

-(instancetype)initKeyboardView:(UIView *)view layout:(NSLayoutConstraint *)layout viewcontroller:(UIViewController *)vc
{
    if (self =[super init] ) {
        _v = view;
        _layout =layout;
        _vc =vc;
    }
    return self;

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //添加对键盘的弹起监听
    [[NSNotificationCenter defaultCenter] addObserver:self.vc selector:@selector(openKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    //添加对键盘收起的监听
    [[NSNotificationCenter defaultCenter]addObserver:self.vc selector:@selector(closeKeyboard:) name:UIKeyboardWillHideNotification object:nil];
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
   self.layout.constant = keyboardFrame.size.height -100;
    
    // 做动画来修改约束
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        [self.v   layoutIfNeeded];
        
    } completion:nil];
}
//键盘的关
-(void)closeKeyboard:(NSNotification *)notification
{
    // 从通知的userInfo中取得动画的选项
    NSInteger option = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    // 从通知的userInfo中取得动画的时长
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
     self.layout.constant = 0;
    
    // 做动画来修改约束
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        [self.v layoutIfNeeded];
    } completion:nil];
    
}
//销毁
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:UIKeyboardWillShowNotification];
    [[NSNotificationCenter defaultCenter]removeObserver:UIKeyboardWillHideNotification];
}
////点击空白处关闭键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.v endEditing:YES];
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{}
@end
