//
//  WUBannerView.h
//  InfiniteBannerView
//
//  Created by satanwoo on 14-2-10.
//  Copyright (c) 2014年 Ziqi Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WUBannerView : UIScrollView

+ (WUBannerView *)createBannerViewWithArrayOfImages:(NSArray *)images
                                   andArrayOfTitles:(NSArray *)titles;
- (void)bannerViewDidScroll;

@end
