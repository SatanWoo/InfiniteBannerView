//
//  WUBannerView.m
//  InfiniteBannerView
//
//  Created by satanwoo on 14-2-10.
//  Copyright (c) 2014年 Ziqi Wu. All rights reserved.
//

#import "WUBannerView.h"
#import "WUBannerItemView.h"

@interface WUBannerView()
@property (nonatomic, strong) NSMutableArray *imgs;
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) NSInteger actualPage;
@property (nonatomic, assign) NSInteger totalPage;

- (void)configureBannerView;
- (CGFloat)calculateNextPositionForSubview;
- (void)setOriginX:(CGFloat)originX forView:(UIView *)view;
@end

#define kDefaultBannerViewWidth  320
#define kDefaultBannerViewHeight 144
#define kAutoScrollingInterval   8
@implementation WUBannerView

+ (WUBannerView *)createBannerViewWithArrayOfImages:(NSArray *)images
                                   andArrayOfTitles:(NSArray *)titles
{
    WUBannerView *view = [[WUBannerView alloc] initWithFrame:CGRectMake(0, 0, kDefaultBannerViewWidth, kDefaultBannerViewHeight)];

    view.imgs = [NSMutableArray arrayWithArray:images];
    view.titles = [NSMutableArray arrayWithArray:titles];
    
    [view configureBannerView];
    
    return view;
}

- (void)bannerViewDidScroll
{
    NSInteger page = self.contentOffset.x / CGRectGetWidth(self.bounds);
    
    if (page == 0) {
        [self setContentOffset:CGPointMake((self.totalPage - 2) * CGRectGetWidth(self.bounds), 0) animated:NO];
        page = [self.imgs count] - 1;
    } else if (page == self.totalPage - 1) {
        [self setContentOffset:CGPointMake(CGRectGetWidth(self.bounds), 0) animated:NO];
        page = 0;
    } else {
        page --;
    }
    
    self.actualPage = page;
}

#pragma mark - Private Method
- (CGFloat)calculateNextPositionForSubview
{
    if ([self.subviews count] == 0) return 0;
    
    UIView *view = [[self subviews] lastObject];
    return view.frame.origin.x + view.frame.size.width;
}

- (void)setOriginX:(CGFloat)originX forView:(UIView *)view;
{
    CGRect frame = view.frame;
    frame.origin.x = originX;
    view.frame = frame;
}

- (void)configureBannerView
{
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    
    if ([self.imgs count] == 1) {
        self.scrollEnabled = NO;
        self.totalPage = 1;
        
        WUBannerItemView *item = [WUBannerItemView createBannerItemViewWithTitle:[self.titles objectAtIndex:0]
                                                                          andImg:[self.imgs objectAtIndex:0]];
        
        [self addSubview:item];
        
    } else {
        self.scrollEnabled = YES;
        self.contentSize = CGSizeMake(CGRectGetWidth(self.bounds) * ([self.imgs count] + 2),
                                      CGRectGetHeight(self.bounds));
        
        
        WUBannerItemView *lastImagePlaceholder = [WUBannerItemView createBannerItemViewWithTitle:
                                                  [self.titles objectAtIndex:[self.titles count] - 1]
                                                                                          andImg:
                                                  [self.imgs objectAtIndex:[self.imgs count] - 1]];
        
        [self setOriginX:[self calculateNextPositionForSubview] forView:lastImagePlaceholder];
        [self addSubview:lastImagePlaceholder];
        
        for (int i = 0; i < [self.imgs count]; i++) {
            WUBannerItemView *item = [WUBannerItemView createBannerItemViewWithTitle:
                                                        [self.titles objectAtIndex:i]
                                                                              andImg:
                                                        [self.imgs objectAtIndex:i]];
            
            [self setOriginX:[self calculateNextPositionForSubview] forView:item];
            [self addSubview:item];
        }
        
        WUBannerItemView *firstImagePlaceholder = [WUBannerItemView createBannerItemViewWithTitle:
                                                                        [self.titles objectAtIndex:0]
                                                                                          andImg:
                                                                        [self.imgs objectAtIndex:0]];
        
        [self setOriginX:[self calculateNextPositionForSubview] forView:firstImagePlaceholder];
        [self addSubview:firstImagePlaceholder];
        
        [self setContentOffset:CGPointMake(CGRectGetWidth(self.bounds), 0)];
        
        self.totalPage = [self.imgs count] + 2;
    }
}

@end
