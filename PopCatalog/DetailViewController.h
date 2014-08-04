//
//  DetailViewController.h
//  PopCatalog
//
//  Created by Fuda Ryusuke on 2014/08/04.
//  Copyright (c) 2014年 Fuda Ryusuke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
