//
//  DetailVideoViewController.m
//  KICKVideo
//
//  Created by 杜 鹏 on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DetailVideoViewController.h"

@implementation DetailVideoViewController

-(void)dealloc{
    [activityIndicatorView release];
    [detailWebview release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Detail";
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 416)];
    self.view = aView;
    [aView release];
    
    detailWebview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 416)];
    detailWebview.delegate = self;
    detailWebview.scalesPageToFit =YES;

    activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 50.0f, 50.0f)];
    [activityIndicatorView setCenter:self.view.center];
    [activityIndicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [detailWebview addSubview:activityIndicatorView];
    
    NSURL * url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [detailWebview loadRequest:request];
    
//    NSString * htmlPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"html文件名"];
//    NSURL * htmlURL = [NSURL fileURLWithPath:htmlPath];
//    NSURLRequest *htmlRequest = [NSURLRequest requestWithURL:htmlURL];
//    [detailWebview loadRequest:htmlRequest];
    
    [aView addSubview:detailWebview];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma WebviewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [activityIndicatorView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{

    [activityIndicatorView stopAnimating];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [detailWebview reload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
