//
//  factroy.m
//  BaseProject
//
//  Created by tarena on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "factroy.h"

@implementation factroy
+(void)SetButtonUserFlatUIKit:(FUIButton *)button
{
    button.buttonColor = [UIColor turquoiseColor];
    button.shadowColor = [UIColor greenSeaColor];
    button.shadowHeight = 3.0f;
    button.cornerRadius = 6.0f;
    button.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [button setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
}
+(void)SetTextFieldUserFlatUIKit:(FUITextField *)TextField
{
    TextField.font = [UIFont flatFontOfSize:16];
    TextField.backgroundColor = [UIColor clearColor];
    TextField.edgeInsets = UIEdgeInsetsMake(4.0f, 15.0f, 4.0f, 15.0f);
    TextField.textFieldColor = [UIColor whiteColor];
    TextField.borderColor = [UIColor turquoiseColor];
    TextField.borderWidth = 2.0f;
    TextField.cornerRadius = 3.0f;
}


@end
