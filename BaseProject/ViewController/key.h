//
//  key.h
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface key : NSObject
@property(nonatomic,strong)NSLayoutConstraint *layout;
@property(nonatomic,strong)UIView *v;
@property(nonatomic,strong)UIViewController *vc;

+(void)KeyboardView:(UIView *)view layout:(NSLayoutConstraint *)layout viewcontroller:(UIViewController *)vc;
-(instancetype)init:(UIView *)view layout:(NSLayoutConstraint *)layout viewcontroller:(UIViewController *)vc;

@end
