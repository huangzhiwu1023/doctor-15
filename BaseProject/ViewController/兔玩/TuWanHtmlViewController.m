//
//  TuWanHtmlViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanHtmlViewController.h"

@interface TuWanHtmlViewController ()<UIWebViewDelegate>
@property(strong,nonatomic)UIWebView *webview;

@end

@implementation TuWanHtmlViewController
-(UIWebView *)webview
{
    if (_webview == nil) {
        _webview =[UIWebView new];
        [_webview loadRequest:[NSURLRequest requestWithURL:_url]];
        _webview.delegate =self;
    }
    return _webview;

}
-(id)initWithUrl:(NSURL *)url
{
    if (self =[super init]) {
        self.url =url;
    }
    return self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.webview];
    [self.webview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [Factory addBackItemToVC:self];
    
    
    // Do any additional setup after loading the view.
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self showProgress];//xuanzhuantishi旋转提示
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self hideProgress];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self hideProgress];
}





@end
