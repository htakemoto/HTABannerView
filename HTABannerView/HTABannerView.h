//
//  HTBannerView.h
//  HTBannerView
//
//  Created by Takemoto on 4/24/14.
//  Copyright (c) 2014 Takemoto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iAd/iAd.h>

@interface HTABannerView : NSObject <ADBannerViewDelegate>

// designated initializer
- (instancetype)initWithContentViewController:(UIViewController *)contentViewController
                                  ContentView:(UIView *)contentView;

- (void)layoutAnimated:(BOOL)animated;

@end
