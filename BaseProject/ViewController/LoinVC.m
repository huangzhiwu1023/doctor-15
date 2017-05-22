//
//  LoinVC.m
//  BaseProject
//
//  Created by tarena on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LoinVC.h"
#import "UIImage+Exten.h"
#import "UIColor+Extension.h"
#import "CreateUserViewController.h"
#import "wanwanViewController.h"
#import "zhuceModel.h"
#import "gDViewController.h"
#import "keyBoard.h"
#import "key.h"
@interface LoinVC ()<UIAlertViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *button2;
@property (weak, nonatomic) IBOutlet UIView *vieww;
//保存数据的记住密码的
@property(nonatomic,strong)NSUserDefaults *userDefaults;
@property(nonatomic,strong)FUITextField *text;
@property(nonatomic,strong)FUITextField *key;
@property(nonatomic,strong)UIButton *touxiang;
@property(nonatomic,strong)FUIButton *loinButton;
@property(nonatomic,strong)UIButton *jizhuBtn;
@property(nonatomic,strong)UIButton *zhuceBtn;
@property(nonatomic,strong)UILabel*jizhuLb;
//创建一个注册的页面
@property(nonatomic,strong)keyBoard *vc;
@property (nonatomic,strong)NSArray *arr;
@end
@implementation LoinVC
//-(keyBoard *)vc
//{
//    if (_vc == nil) {
//        _vc =[[keyBoard alloc]initKeyboardView:self.vieww layout:self.button2 viewcontroller:self];
//    }
//    return _vc;
//}

-(FUITextField *)text
{
    if (_text == nil) {
        _text =[FUITextField new];
    }
    return _text;

}
-(FUITextField *)key
{
    if (_key == nil) {
        _key =[FUITextField new];
    }
    return _key;
    
}
-(UIButton *)touxiang
{
    if (_touxiang==nil) {
        _touxiang =[UIButton new];
    }
    return _touxiang;
}
-(FUIButton *)loinButton
{
    if (_loinButton == nil) {
        _loinButton =[FUIButton buttonWithType:UIButtonTypeCustom];
    }
    return _loinButton;
}
-(UIButton *)jizhuBtn
{
    if (_jizhuBtn ==nil) {
        _jizhuBtn =[UIButton buttonWithType:0];
    }
    return _jizhuBtn;
}
-(UIButton *)zhuceBtn
{
    if (_zhuceBtn ==nil) {
        _zhuceBtn =[UIButton buttonWithType:0];
    }
    return _zhuceBtn;
}
-(UILabel *)jizhuLb
{
    if (_jizhuLb == nil) {
        _jizhuLb =[UILabel new];
    }
    return _jizhuLb;
}
-(NSArray *)arr
{
    return [zhuceModel zhuceInfo];
}
- (void)viewDidLoad {
    [super viewDidLoad];
  //  self.vc.view.backgroundColor =[UIColor whiteColor];
    //[key KeyboardView:self.view layout:self.button2 viewcontroller:self];
    [self readData];
    [self titleImage];
    [self inputTextfiled];
    [self loinAboutButton];
    [self jizhu];
    [self zhuce];
}

-(void)titleImage//头像的设置
{
    UIImage *image = [UIImage imageWithName:@"wel.jpg"border:2 borderColor:[UIColor colorWith255Red:253 green:181 bule:53 alpha:1]];//将图切成圆
    [self.touxiang setBackgroundImage:image forState:UIControlStateNormal];
    self.touxiang.layer.cornerRadius =80;
    [self.vieww addSubview:self.touxiang];
    [self.touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-kWindowH+260);
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(160, 160));
    }];
    //点击进入相册的里面的
    [self.touxiang bk_addEventHandler:^(id sender) {
        
        //步骤2：到类的头文件中查看是否有专属的初始化方法，如没有，则new
        UIImagePickerController *pc = [UIImagePickerController new];
        pc.delegate = self;
        //开启编辑功能
        pc.allowsEditing = YES;
        //可以定义要选取的数据类型，默认只显示图片
        pc.mediaTypes=@[(NSString *) kUTTypeMovie, (NSString *)kUTTypeImage];
        //输入源选择--默认是相册
     //   pc.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:pc animated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];


}
-(void)inputTextfiled//输入框的设置
{
    [self.vieww addSubview:self.text];
    self.text.placeholder =@"用户名";
    self.text.clearsOnBeginEditing =YES;
    self.text.secureTextEntry =NO;
    
    [self.text mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.touxiang.mas_bottom).mas_equalTo(60);
        make.size.mas_equalTo(CGSizeMake(kWindowW, 50));
    }];
    [factroy SetTextFieldUserFlatUIKit:self.text];
    
    [self.vieww addSubview:self.key];
    self.key.placeholder =@"密码";
    self.key.clearsOnBeginEditing =YES;
    self.key.secureTextEntry =YES;
    
    [self.key mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.text.mas_bottom).mas_equalTo(2);
        make.size.mas_equalTo(CGSizeMake(kWindowW, 50));
    }];
    [factroy SetTextFieldUserFlatUIKit:self.key];


}
-(void)loinAboutButton//登录按钮的设置
{
    [self.loinButton setTitle:@"登录" forState:0];
    [factroy SetButtonUserFlatUIKit:self.loinButton];
    [self.vieww addSubview:self.loinButton];
    [self.loinButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(self.key.mas_bottom).mas_equalTo(50);
        make.size.mas_equalTo(CGSizeMake(150, 50));
    }];
    [self.loinButton bk_addEventHandler:^(id sender) {
        
        
        
        
        //获取Student.plist的路径
        NSString *path =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES).firstObject;
        path = [path stringByAppendingString:@"/nameAndKey1.plist"];
        NSLog(@"%@",path);
        NSArray *plistArr=[NSArray arrayWithContentsOfFile:path];
        NSLog(@"%@",plistArr);
        for (NSDictionary *dic in plistArr)
        {
            if ([self.text.text isEqualToString: dic[@"name"]]&&[self.key.text isEqualToString:  dic[@"key"]])
            {
                UITabBarController *tabar =[self.storyboard instantiateViewControllerWithIdentifier:@"TBC"];
                tabar.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
                [self presentViewController:tabar animated:YES completion:^{
                }];
//                UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DDD"];
//                UIWindow *window = [UIApplication sharedApplication].keyWindow;
//                window.rootViewController =vc;
                return ;
                
            }
        }

         if ([self.text.text isEqual: @""]||[self.key.text isEqual: @""] )
        {
            [[UIAlertView bk_showAlertViewWithTitle:@"输入错误" message:@"密码或用户名不能为空" cancelButtonTitle:@"再次输入" otherButtonTitles:@[@"好"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
                [self.text becomeFirstResponder];
            }]show];
        }
        else
        {
            [[UIAlertView bk_showAlertViewWithTitle:@"输入错误" message:@"用户名或密码输入错误" cancelButtonTitle:@"再次输入" otherButtonTitles:@[@"好"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
                [self.text becomeFirstResponder];
            }]show];
        }
       
    } forControlEvents:UIControlEventTouchUpInside];
}
-(void)jizhu//记住密码
{
    [self.vieww addSubview:self.jizhuBtn];
    [self.jizhuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(43);
        make.top.mas_equalTo(self.loinButton.mas_bottom).mas_equalTo(16);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(20);
    }];
    [self.jizhuBtn bk_addEventHandler:^(id sender) {
        [self.jizhuBtn setBackgroundImage:[UIImage imageNamed:@"cm2_list_checkbox_ok"] forState:UIControlStateSelected];
        [self.jizhuBtn setBackgroundImage:[UIImage imageNamed:@"cm2_list_checkbox"] forState:UIControlStateNormal];
        self.jizhuBtn.selected = !self.jizhuBtn.selected;
        if (self.jizhuBtn.selected == YES) {
            [self saveData];
        }
        else
        {
        }
    } forControlEvents:UIControlEventTouchUpInside];
    [self.vieww addSubview:self.jizhuLb];
    self.jizhuLb.text =@"记住密码";
    self.jizhuLb.font =[UIFont systemFontOfSize:15];
    self.jizhuLb.textColor =[UIColor grayColor];
    [self.jizhuLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.mas_equalTo(self.jizhuBtn.mas_top);
        make.size.mas_equalTo(CGSizeMake(80, 25));
        make.left.mas_equalTo(self.jizhuBtn.mas_right).mas_equalTo(7);
    }];


}
-(void)zhuce//注册
{
    [self.vieww addSubview:self.zhuceBtn];
    [self.zhuceBtn setTitle:@"新用户注册" forState:0];
    [self.zhuceBtn setTitleColor:[UIColor grayColor] forState:0];
    self.zhuceBtn.titleLabel.font =[UIFont systemFontOfSize:15];
    [self.zhuceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.mas_equalTo(self.jizhuBtn.mas_top);
        make.right.mas_equalTo(-10);
        make.size.mas_equalTo(CGSizeMake(90, 25));
    }];
    
    [self.zhuceBtn bk_addEventHandler:^(id sender) {
         CreateUserViewController *vcc =[CreateUserViewController new];
        [self.navigationController pushViewController:vcc animated:YES];
        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"CUVC"];
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window.rootViewController =vc;
    } forControlEvents:UIControlEventTouchUpInside];
}




//设置界面
-(NSUserDefaults *)userDefaults
{
    if (_userDefaults ==nil) {
        _userDefaults =[NSUserDefaults standardUserDefaults];
    }
    return _userDefaults;
}
//记住密码
-(void)saveData
{
    [self.userDefaults setValue:self.text.text forKey:@"name"];
    [self.userDefaults setValue:self.key.text forKey:@"key"];
    [self.userDefaults setBool:self.jizhuBtn.selected forKey:@"isSelect"];
    [self.userDefaults synchronize];
    
}
//读出密码
-(void)readData
{
    if ([self.userDefaults boolForKey:@"isSelect"]) {
        self.text.text = [self.userDefaults stringForKey:@"name"];
        self.key.text =[self.userDefaults stringForKey:@"key"];
        self.jizhuBtn.selected= [self.userDefaults boolForKey:@"isSelect"];
        [self.jizhuBtn setBackgroundImage:[UIImage imageNamed:@"cm2_list_checkbox_ok"] forState:UIControlStateSelected];
        [self.userDefaults synchronize];//为了防止系统崩溃，导致数据没保存
    }else
    {
        [self.jizhuBtn setBackgroundImage:[UIImage imageNamed:@"cm2_list_checkbox"] forState:UIControlStateNormal];
        self.text.text =@"";
        self.key.text =@"";
    }
    
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
    
    self.button2.constant = keyboardFrame.size.height -100;
    
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
    
    self.button2.constant = 0;
    
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
////点击空白处关闭键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark UIImagePickerController ---
//读取系统的图片并且的将它切成圆图
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //通过断点，查询info中的数据。确定OriginalImage 这个key中是我们想要的数据
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    //获取编辑后的图片
    image = info[UIImagePickerControllerEditedImage];
    NSInteger border =2;
    //新的画布的尺寸
    CGFloat imageWidth = image.size.width + 2* border;
    CGFloat imageHeight = image.size.height + 2*border;
    //设置与大圆相切的正方形的边
    CGFloat circleW = MIN(imageWidth, imageHeight);
    //开启图片上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(circleW, circleW), NO, 0.0);
    //画大的实心的圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, circleW, circleW)];
    //绘制
    [path fill];
    //先画的是不能剪裁的
    CGRect smallCircle = CGRectMake(border, border, circleW -2 *border, circleW -2*border);
    //绘制小圆点路径
    UIBezierPath *smallpath = [UIBezierPath bezierPathWithOvalInRect:smallCircle];
    [smallpath addClip];//小圆以外的都不能画
    //画原有的旧图
    [image drawInRect:smallCircle];
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.touxiang setBackgroundImage:newimage forState:0];
    [picker dismissViewControllerAnimated:YES completion:nil];
}
//返回的推出
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{}
@end
