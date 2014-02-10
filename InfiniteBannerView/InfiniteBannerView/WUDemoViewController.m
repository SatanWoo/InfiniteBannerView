//
//  WUDemoViewController.m
//  InfiniteBannerView
//
//  Created by satanwoo on 14-2-10.
//  Copyright (c) 2014年 Ziqi Wu. All rights reserved.
//

#import "WUDemoViewController.h"
#import "WUBannerView.h"

#define kWUDemoViewControllerNibName @"WUDemoViewController"

@interface WUDemoViewController () <UIScrollViewDelegate>
@property (strong, nonatomic) WUBannerView *bannerView;
@end

@implementation WUDemoViewController

+ (WUDemoViewController *)createDemoViewController
{
    WUDemoViewController *vc = [[WUDemoViewController alloc] initWithNibName:kWUDemoViewControllerNibName bundle:nil];
    return vc;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *imgs = [NSArray arrayWithObjects:
                      [UIImage imageNamed:@"1.jpg"],
                      [UIImage imageNamed:@"2.jpg"],
                      [UIImage imageNamed:@"3.jpg"],
                      [UIImage imageNamed:@"4.jpg"],
                      [UIImage imageNamed:@"5.jpg"],
                    nil];
    
    NSArray *titles = [NSArray arrayWithObjects:
                       [NSString stringWithFormat:@"图片1真好看"],
                       [NSString stringWithFormat:@"图片2真好看"],
                       [NSString stringWithFormat:@"图片3真好看"],
                       [NSString stringWithFormat:@"图片4真好看"],
                       [NSString stringWithFormat:@"图片5真好看"],
                       nil];
    
    self.bannerView = [WUBannerView createBannerViewWithArrayOfImages:imgs andArrayOfTitles:titles];
    self.bannerView.delegate = self;
    [self.view addSubview:self.bannerView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self.bannerView bannerViewDidScroll];
}

@end
