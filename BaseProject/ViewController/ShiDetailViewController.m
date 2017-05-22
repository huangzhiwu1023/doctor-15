//
//  ShiDetailViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShiDetailViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ShiDetailViewController ()<UITableViewDelegate, UITableViewDataSource, AVSpeechSynthesizerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightItem;
@property(nonatomic,strong) AVSpeechSynthesizer *syn;
@end

@implementation ShiDetailViewController
- (IBAction)talk:(UIBarButtonItem *)sender {
    if (kAppDelegate.isOnLine) {
        if (self.syn.speaking) {
            [self.syn stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        }else{
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                AVSpeechUtterance *utt = [AVSpeechUtterance speechUtteranceWithString:_shi];
                utt.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
                [self.syn speakUtterance:utt];
            });
        }
    }else{
        [self showErrorMsg:@"朗读需要联网"];
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.syn stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView.tableFooterView = [UIView new];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @[@"诗词赏析", @"注解"][section];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
//需要autoLayout支持，自动计算高度
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    UILabel *label = (UILabel *)[cell viewWithTag:100];
    if (indexPath.section == 0) {
        label.text = _shi;
    }else{
        label.text = _introShi;
    }
    return cell;
}

kRemoveCellSeparator

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (AVSpeechSynthesizer *)syn {
	if(_syn == nil) {
		_syn = [[AVSpeechSynthesizer alloc] init];
        _syn.delegate = self;
	}
	return _syn;
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance{
    _rightItem.title = @"停止";
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance{
    _rightItem.title = @"朗读";
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance *)utterance{
    
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance *)utterance{
    
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance{
    _rightItem.title = @"朗读";
}

@end
