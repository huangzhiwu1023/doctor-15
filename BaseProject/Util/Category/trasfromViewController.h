//
//  trasfromViewController.h
//  BaseProject
//
//  Created by tarena on 15/10/30.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface trasfromViewController : UIViewController
@property(nonatomic,strong)NSString *imageName;
@property(nonatomic,assign)CGRect rect;

//+(void)imageName:(NSString *)image imageBound:(CGRect *)rect completeHandle:(void(^)(NSError *error))complete;


@end
