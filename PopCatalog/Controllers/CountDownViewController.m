//
//  CountDownViewController.m
//  PopCatalog
//
//  Created by Fuda Ryusuke on 2014/08/08.
//  Copyright (c) 2014年 Fuda Ryusuke. All rights reserved.
//

#import "CountDownViewController.h"
#import <pop/POP.h>

@interface CountDownViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation CountDownViewController

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
    [self startAnimation];
}

- (void)startAnimation
{
    POPAnimatableProperty *countDownProperty =
    [POPAnimatableProperty propertyWithName:@"countDown"
                                initializer:^(POPMutableAnimatableProperty *prop){
                                    prop.readBlock = ^(UILabel *label, CGFloat values[]) {
                                        values[0] = [label.text intValue];
                                    };
                                    prop.writeBlock = ^(UILabel *label, const CGFloat values[]) {
                                        label.text = [[NSString alloc] initWithFormat:@"%d", (int)values[0]];
                                    };
                                }];
    
    POPBasicAnimation *countDownAnimation = [POPBasicAnimation new];
    countDownAnimation.property = countDownProperty;
    countDownAnimation.timingFunction =
    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    countDownAnimation.duration = 10.0f;
    countDownAnimation.fromValue = @(100);
    countDownAnimation.toValue = @(0);
    [self.myLabel pop_addAnimation:countDownAnimation forKey:@"constantAnimation"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
