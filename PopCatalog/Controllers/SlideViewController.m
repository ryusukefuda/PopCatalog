//
//  SlideViewController.m
//  PopCatalog
//
//  Created by Fuda Ryusuke on 2014/08/05.
//  Copyright (c) 2014年 Fuda Ryusuke. All rights reserved.
//

#import "SlideViewController.h"
#import <POP/POP.h>

@interface SlideViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button01;
@property (weak, nonatomic) IBOutlet UIButton *button02;
@property (weak, nonatomic) IBOutlet UIButton *button03;
@property (weak, nonatomic) IBOutlet UIButton *button04;

@end

@implementation SlideViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)button01:(id)sender
{
    POPDecayAnimation *anim = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anim.velocity = @(1000.);
    [self.button01 pop_addAnimation:anim forKey:@"slideRight"];
}

- (IBAction)button02:(id)sender
{
    POPDecayAnimation *anim = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    anim.velocity = @(-500.);
    [self.button02 pop_addAnimation:anim forKey:@"slideUp"];
}

- (IBAction)button03:(id)sender
{
    POPDecayAnimation *animX = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    animX.velocity = @(-200.);
    POPDecayAnimation *animY = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    animY.velocity = @(100.);

    
    [self.button03 pop_addAnimation:animX forKey:@"slideX"];
    [self.button03 pop_addAnimation:animY forKey:@"slideY"];
    
}

- (IBAction)button04:(id)sender
{
    POPDecayAnimation *animX = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    animX.velocity = @(400.);
    POPDecayAnimation *animY = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    animY.velocity = @(-800.);

    animX.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        NSLog(@"FadeIn animation has completed.");
        [self.button04 pop_addAnimation:animY forKey:@"slideX"];
    };
    [self.button04 pop_addAnimation:animX forKey:@"slideY"];
}

@end
