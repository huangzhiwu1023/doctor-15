//
//  keyBoard.h
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface keyBoard : UIViewController
@property(nonatomic,strong)NSLayoutConstraint *layout;
@property(nonatomic,strong)UIView *v;
@property(nonatomic,strong)UIViewController *vc;

-(instancetype)initKeyboardView:(UIView *)view layout:(NSLayoutConstraint *)layout viewcontroller:(UIViewController *)vc;
@end
