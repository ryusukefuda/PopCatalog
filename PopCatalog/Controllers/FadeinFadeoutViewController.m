//
//  FadeinFadeoutViewController.m
//  PopCatalog
//
//  Created by Fuda Ryusuke on 2014/08/04.
//  Copyright (c) 2014年 Fuda Ryusuke. All rights reserved.
//

#import "FadeinFadeoutViewController.h"
#import <POP+MCAnimate.h>

@interface FadeinFadeoutViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation FadeinFadeoutViewController
{
    BOOL _stopAnimation;
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
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [self fadeOutAnimation];
}

- (void)viewWillDisappear:(BOOL)animated
{
    _stopAnimation = YES;
    [self.myLabel pop_removeAllAnimations];
}

#pragma mark Animation
- (void)fadeOutAnimation
{
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.fromValue = @(1.0);
    anim.toValue = @(0.0);
    anim.duration = 1.5;
    anim.beginTime = 0.0;
    anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        NSLog(@"FadeOut animation has completed.");
        if (_stopAnimation == NO) {
            [self fadeInAnimation];
        }
    };
    [self.myLabel pop_addAnimation:anim forKey:@"fadeOut"];
}

- (void)fadeInAnimation
{
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.fromValue = @(0.0);
    anim.toValue = @(1.0);
    anim.duration = 1.5;
    anim.beginTime = 0.0;
    
    anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        NSLog(@"FadeIn animation has completed.");
        if (_stopAnimation == NO) {
            [self fadeOutAnimation];
        }
    };
    [self.myLabel pop_addAnimation:anim forKey:@"fadeIn"];
}

#pragma mark Memory Management
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
