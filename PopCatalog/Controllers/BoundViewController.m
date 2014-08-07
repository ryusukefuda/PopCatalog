//
//  BoundViewController.m
//  PopCatalog
//
//  Created by Fuda Ryusuke on 2014/08/05.
//  Copyright (c) 2014年 Fuda Ryusuke. All rights reserved.
//

#import "BoundViewController.h"
#import <Pop/POP.h>

@interface BoundViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelA;
@property (weak, nonatomic) IBOutlet UILabel *labelB;

@end

@implementation BoundViewController

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
    [self boundAnimationA];

}

- (void)boundAnimationA
{
    POPSpringAnimation *anim = [POPSpringAnimation animation];
    anim.property = [POPAnimatableProperty propertyWithName:kPOPLayerSize];
    anim.toValue = [NSValue valueWithCGSize:CGSizeMake(180, 70)];
    anim.springBounciness = 35.0f;
    anim.springSpeed = 5.0f;
    anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        self.labelA.font = [UIFont systemFontOfSize:40.0f];
        [self boundAnimationB];
    };
    
    [self.labelA pop_addAnimation:anim forKey:@"boundA"];
}

- (void)boundAnimationB
{
    POPSpringAnimation *anim = [POPSpringAnimation animation];
    anim.property = [POPAnimatableProperty propertyWithName:kPOPLayerSize];
    anim.toValue = [NSValue valueWithCGSize:CGSizeMake(90, 35)];
    anim.springBounciness = 20.0f;
    anim.springSpeed = 3.0f;
    
    [self.labelB pop_addAnimation:anim forKey:@"boundB"];
    self.labelB.font = [UIFont systemFontOfSize:20.0f];
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
