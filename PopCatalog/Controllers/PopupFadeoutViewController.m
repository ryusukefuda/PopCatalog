//
//  PopuoFadeoutViewController.m
//  PopCatalog
//
//  Created by Fuda Ryusuke on 2014/08/23.
//  Copyright (c) 2014年 Fuda Ryusuke. All rights reserved.
//

#import "PopupFadeoutViewController.h"
#import <Pop/POP.h>

@interface PopupFadeoutViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation PopupFadeoutViewController

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
    [self startPopAnimation];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [_myLabel pop_removeAllAnimations];
}

- (void)startPopAnimation
{
    POPBasicAnimation *fadeAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    fadeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    fadeAnimation.fromValue = @(1.0);
    fadeAnimation.toValue = @(0.0);
    fadeAnimation.duration = 0.5;
    fadeAnimation.beginTime = 0.0;
    
    POPSpringAnimation *springAnimation = [POPSpringAnimation animation];
    springAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewCenter];
    springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2)];
    springAnimation.springBounciness = 20;
    springAnimation.springSpeed = 10;
    springAnimation.completionBlock = ^(POPAnimation *springAnimation, BOOL status){
        [_myLabel pop_addAnimation:fadeAnimation forKey:@"fadeoutAnimation"];
    };
    
    [_myLabel pop_addAnimation:springAnimation forKey:@"positionAnimation"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
