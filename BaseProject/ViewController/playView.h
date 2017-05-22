//
//  playView.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface playView : UIView
+(playView *)sharedInstance;
@property(nonatomic,strong)AVPlayer *player;
@property(nonatomic,strong)UIButton *playBtn;
-(void)palyWith:(NSURL *)music;
@end
