//
//  CatalogTableViewController.m
//  PopCatalog
//
//  Created by Fuda Ryusuke on 2014/08/04.
//  Copyright (c) 2014年 Fuda Ryusuke. All rights reserved.
//

#import "CatalogTableViewController.h"
#import "FadeinFadeoutViewController.h"

@interface CatalogTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *catalogTableView;

@property (nonatomic, strong) NSArray *catalogDataSource;

@end

@implementation CatalogTableViewController
{
    
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
    
    //Init
    
    self.navigationItem.title = @"Pop Catalog";
    self.catalogTableView.delegate = self;
    self.catalogTableView.dataSource = self;
    
    self.catalogDataSource = [[NSArray alloc] init];
    self.catalogDataSource = @[@"FadeIn & FadeOut",
                               @"Scale",
                               @"Slide",
                               @"Bound",
                               @"Rotation (POP-MCAnimate)",
                               @"Count Down",
                               @"Slot",
                               @"Manga"
                               ];
}

#pragma  mark Table View Data
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.catalogDataSource.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CatalogCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = self.catalogDataSource[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
            [self performSegueWithIdentifier:@"toFadeinFadeout" sender:self];
            break;
        case 1:
            [self performSegueWithIdentifier:@"toScale" sender:self];
            break;
        case 2:
            [self performSegueWithIdentifier:@"toSlide" sender:self];
            break;
        case 3:
            [self performSegueWithIdentifier:@"toBound" sender:self];
            break;
        case 4:
            [self performSegueWithIdentifier:@"toRotation" sender:self];
            break;
        case 5:
            [self performSegueWithIdentifier:@"toCountDown" sender:self];
            break;
    
        default:
            break;
    }

}


#pragma mark Memory Controll
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
