
//
//  friendTableViewController.m
//  testdoctor
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 星海集团. All rights reserved.
//

#import "friendTableViewController.h"
#import "chatMainViewController.h"
@interface friendTableViewController ()<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *askbutton;

@end

@implementation friendTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.askbutton.layer.cornerRadius =20;
    [self.askbutton bk_addEventHandler:^(id sender) {
        [UIAlertView bk_showAlertViewWithTitle:@"此功能尚未开通" message:@"可以点击上面对应的医生进入聊天" cancelButtonTitle:@"好" otherButtonTitles:@[@"取消"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
        }];

    } forControlEvents:UIControlEventTouchUpInside];
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   // DDLogVerbose(@"%@",indexPath);
    chatMainViewController *vc =kVCFromSb(@"CMVC", @"Main");
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

//这个方法传参的时候用
-(void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    

}
@end
