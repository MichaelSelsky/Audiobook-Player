//
//  ABPDetailViewController.h
//  AudioBookPlayer
//
//  Created by MichaelSelsky on 5/12/14.
//  Copyright (c) 2014 MichaelSelsky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABPDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
