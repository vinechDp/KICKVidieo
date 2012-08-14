//
//  CreditViewController.m
//  KICKVideo
//
//  Created by 杜 鹏 on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CreditViewController.h"

@implementation CreditViewController

-(void)dealloc{
    [creditWebview release];
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

    [self changeBackButtonItem];
    self.navigationItem.title = @"Credit";
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    aView.backgroundColor = [UIColor whiteColor];
    self.view = aView;
    [aView release];
    
    creditWebview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 416)];
    creditWebview.scalesPageToFit = YES;
    [aView addSubview:creditWebview];
    
    NSURL * url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [creditWebview loadRequest:request];
    
//    NSString * htmlPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@""];
//    NSURL * htmlURL = [NSURL fileURLWithPath:htmlPath];
//    NSURLRequest * htmlRequest = [NSURLRequest requestWithURL:htmlURL];
//    [creditWebview loadRequest:htmlRequest];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark 导航条自定义返回按钮
-(void)createBarButton:(CGSize)size imageName:(NSString*)image isLeft:(BOOL)isLeft target:(id)target event:(SEL)selector title:(NSString*)title
{
    UIView *backButtonView = [[UIView alloc] initWithFrame:CGRectMake(0,0,size.width,size.height)];
    UIButton *myBackButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
    if (title)
    {
        [myBackButton setTitle:title forState:UIControlStateNormal];
        myBackButton.titleLabel.font=[UIFont boldSystemFontOfSize:17];
    }
    [myBackButton setFrame:CGRectMake(0,0,size.width,size.height)];
    
    UIImage *sourceImage=[UIImage imageWithContentsOfFile:
                          [[NSBundle mainBundle] pathForResource:image ofType:nil]];
    
    [myBackButton setBackgroundImage:[sourceImage stretchableImageWithLeftCapWidth:size.width topCapHeight:0] forState:UIControlStateNormal];
    [myBackButton setEnabled:YES];
    [myBackButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [backButtonView addSubview:myBackButton];
    [myBackButton release];
    UIBarButtonItem* backButton = [[UIBarButtonItem alloc] initWithCustomView:backButtonView];
    if (isLeft)
    {
        self.navigationItem.leftBarButtonItem = backButton;
    }
    else
    {
        self.navigationItem.rightBarButtonItem = backButton;
    }
    [backButtonView release];
    [backButton release];
}

-(void)buttonPopViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)changeBackButtonItem
{
    [self createBarButton:CGSizeMake(36, 32) imageName:@"back1.png" isLeft:YES target:self event:@selector(buttonPopViewController) title:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
