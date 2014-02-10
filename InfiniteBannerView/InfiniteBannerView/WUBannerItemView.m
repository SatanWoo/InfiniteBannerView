//
//  WUBannerItemView.m
//  InfiniteBannerView
//
//  Created by satanwoo on 14-2-10.
//  Copyright (c) 2014年 Ziqi Wu. All rights reserved.
//

#import "WUBannerItemView.h"
#define kWUBannerItemViewNibName @"WUBannerItemView"

@implementation WUBannerItemView

+ (WUBannerItemView *)createBannerItemViewWithTitle:(NSString *)title andImg:(UIImage *)img
{
    WUBannerItemView *view = [[[NSBundle mainBundle] loadNibNamed:kWUBannerItemViewNibName
                                                            owner:self options:nil] lastObject];
    
    view.titleLabel.text = title;
    view.backgroundImageView.image = img;
    
    return view;
}

@end
