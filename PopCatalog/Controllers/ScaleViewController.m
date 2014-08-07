//
//  BoundViewController.m
//  PopCatalog
//
//  Created by Fuda Ryusuke on 2014/08/04.
//  Copyright (c) 2014年 Fuda Ryusuke. All rights reserved.
//

#import "ScaleViewController.h"
#import <Pop/POP.h>

@interface ScaleViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@property POPSpringAnimation *anim;


@end

@implementation ScaleViewController
{
    int _width;
    int _height;
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
    _width = self.view.window.frame.size.width;
    _height = self.view.window.frame.size.height;
    [self scaleUp];
}

- (void)scaleUp
{
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    anim.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, _width, _height)];
    
    anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        [self scaleDown];
    };
    
    [self.myLabel pop_addAnimation:anim forKey:@"scaleUp"];
    
}

- (void)scaleDown
{
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    anim.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 180, 70)];
    
    anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        [self scaleUp];
    };
    
    [self.myLabel pop_addAnimation:anim forKey:@"scaleDown"];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    [self.myLabel pop_addAnimation:anim forKey:@"scaleUp"];
    [self.myLabel pop_addAnimation:anim forKey:@"scaleDown"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
