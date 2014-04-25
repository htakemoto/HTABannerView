//
//  HTBannerView.m
//  HTBannerView
//
//  Created by Takemoto on 4/24/14.
//  Copyright (c) 2014 Takemoto. All rights reserved.
//

#import "HTABannerView.h"

@interface HTABannerView ()

@property (nonatomic, retain) ADBannerView *bannerView;
@property (nonatomic, assign) BOOL bannerIsVisible;

@property (nonatomic, retain) UIViewController *contentViewController;
@property (nonatomic, retain) UIView *contentView;

@end


@implementation HTABannerView

- (instancetype)initWithContentViewController:(UIViewController *)contentViewController
                                  ContentView:(UIView *)contentView
{
    self = [super init];
    if (self) {
        self.contentViewController = contentViewController;
        self.contentView = contentView;
        self.bannerView = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
        self.bannerView.delegate = self;
        self.bannerView.backgroundColor = [UIColor clearColor];
        [self.contentViewController.view addSubview:self.bannerView];
    }
    return self;
}

- (void)layoutAnimated:(BOOL)animated
{
    CGRect contentViewControllerFrame = self.contentViewController.view.frame;
    CGRect contentFrame = self.contentView.frame;
    CGRect bannerFrame = self.bannerView.frame;
    // iAd is enabled to display
    if (self.bannerIsVisible) {
        contentFrame.origin.y = 0;
        contentFrame.size.height = contentViewControllerFrame.size.height - bannerFrame.size.height;
        bannerFrame.origin.y = contentFrame.size.height;
    }
    // iAd is NOT enabled to display
    else {
        contentFrame.origin.y = 0;
        contentFrame.size.height = contentViewControllerFrame.size.height;
        bannerFrame.origin.y = contentFrame.size.height;
    }
    
    [UIView animateWithDuration:animated ? 0.25 : 0.0 animations:^{
        self.contentView.frame = contentFrame;
        self.bannerView.frame = bannerFrame;
    }];
}

#pragma mark - iAd ADBannerViewDelegate Methods

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!self.bannerIsVisible)
    {
        self.bannerIsVisible = YES;
        [self layoutAnimated:YES];
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (self.bannerIsVisible)
    {
        self.bannerIsVisible = NO;
        [self layoutAnimated:YES];
    }
}

@end
