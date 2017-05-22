//
//  key.m
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "key.h"

@implementation key
-(instancetype)init:(UIView *)view layout:(NSLayoutConstraint *)layout viewcontroller:(UIViewController *)vc
{
    if (self =[super init]) {
        self.v =view;
        self.layout =layout;
        self.vc=vc;
    }
    return self;
}
+(void)KeyboardView:(UIView *)view layout:(NSLayoutConstraint *)layout viewcontroller:(UIViewController *)vc
{
    //添加对键盘的弹起监听
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:vc selector:@selector(openKeyboard:View:layout:) name:UIKeyboardWillShowNotification object:nil];
    //添加对键盘收起的监听
    [[NSNotificationCenter defaultCenter]addObserver:vc selector:@selector(closeKeyboard:View:layout:) name:UIKeyboardWillHideNotification object:nil];
}
//键盘的开
-(void)openKeyboard:(NSNotification *)notification View:(UIView *)view layout:(NSLayoutConstraint *)layout
{
    // 从通知的userInfo中取出键盘的高度
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 从通知的userInfo中取得动画的选项
    int option = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    // 从通知的userInfo中取得动画的时长
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    layout.constant = keyboardFrame.size.height -100;
    
    // 做动画来修改约束
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        [view   layoutIfNeeded];
        
    } completion:nil];
}
//键盘的关
-(void)closeKeyboard:(NSNotification *)notification View:(UIView *)view layout:(NSLayoutConstraint *)layout
{
    // 从通知的userInfo中取得动画的选项
    NSInteger option = [notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    // 从通知的userInfo中取得动画的时长
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    layout.constant = 0;
    
    // 做动画来修改约束
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        [view layoutIfNeeded];
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


-(UIView* )getKeyboardView
{
    UIView *result = nil;
    NSArray *windowArray = [UIApplication sharedApplication].windows;
    for (UIView *temWindow in windowArray)
    {
        NSArray *viewArray = [temWindow subviews];
   
        for(UIView *temView in viewArray){
            if ([[NSString stringWithUTF8String:object_getClassName(temView)] isEqualToString:@"UIPeripheralHostView"]) {
                result = temView;
                break;
            }
            
        }
        if (result != nil) {
            break;
        }
        }
    return result;
}


@end
