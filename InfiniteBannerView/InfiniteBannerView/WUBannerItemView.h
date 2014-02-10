//
//  WUBannerItemView.h
//  InfiniteBannerView
//
//  Created by satanwoo on 14-2-10.
//  Copyright (c) 2014年 Ziqi Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WUBannerItemView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIView *overlayView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

+ (WUBannerItemView *)createBannerItemViewWithTitle:(NSString *)title
                                             andImg:(UIImage *)img;

@end
