//
//  playView.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "playView.h"

@implementation playView

-(UIButton *)playBtn
{
    if (_playBtn ==nil) {
        _playBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"PalyButtonOverlayLarge@3x"] forState:UIControlStateNormal];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"btn_record_pause"] forState:UIControlStateSelected];
    }
    [self addSubview:_playBtn];
    [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];

    [_playBtn bk_addEventHandler:^(UIButton* sender) {
        if (sender.selected) {
            [_player pause];
        }
        else
        {
            [_player play];
        }
        sender.selected =!sender.selected;
    } forControlEvents:UIControlEventTouchUpInside];
        return _playBtn;
}



+(playView *)sharedInstance
{
    static playView *p =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        p =[playView new];
    });
    return p;
}
-(id)init
{
    if (self =[super init]) {
        self.playBtn.hidden =NO;
        self.backgroundColor =[UIColor orangeColor];
    }
    return self;

}


-(void)palyWith:(NSURL *)music
{
    [[AVAudioSession sharedInstance ] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    _player =[AVPlayer playerWithURL:music];
    [_player play];
    self.playBtn.selected =YES;

}
@end
