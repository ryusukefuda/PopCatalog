//
//  RotationViewController.m
//  PopCatalog
//
//  Created by Fuda Ryusuke on 2014/08/07.
//  Copyright (c) 2014年 Fuda Ryusuke. All rights reserved.
//

#import "RotationViewController.h"
//#import <POP/POP.h>
#define MCANIMATE_SHORTHAND
#import <POP+MCAnimate.h>



@interface RotationViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelA;
@property (weak, nonatomic) IBOutlet UIView *viewA;

@end

@implementation RotationViewController

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
    [self rotationLabelA];
    [self rotationViewA];
}

/**
 * Use POP + MCAnimate library
 * https://github.com/matthewcheok/POP-MCAnimate
 */

- (void)rotationLabelA
{
    [ NSObject animate:^{
        self.labelA.layer.pop_duration = 3;
        self.labelA.layer.pop_easeInEaseOut.pop_rotationX = 25.0f;
    } completion:^(BOOL finished){
        self.labelA.layer.pop_duration = 3;
        self.labelA.layer.pop_easeInEaseOut.pop_rotationY = 25.0f;
    }];
    
}

- (void)rotationViewA
{
    [ NSObject animate:^{
        self.viewA.layer.pop_duration = 3;
        self.viewA.layer.pop_easeInEaseOut.pop_rotationX = 25.0f;
    } completion:^(BOOL finished){
        self.viewA.layer.pop_duration = 3;
        self.viewA.layer.pop_easeInEaseOut.pop_rotationY = 25.0f;
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
