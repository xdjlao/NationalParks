//
//  ModalViewController.m
//  Week2AssessmentJerryLao
//
//  Created by Jerry on 1/22/16.
//  Copyright © 2016 Jerry Lao. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString: self.siteUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    
    [self.webView loadRequest:request];
}

- (IBAction)onDismissPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        //
    }];
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [self.activityIndicator startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.activityIndicator stopAnimating];
}

@end
