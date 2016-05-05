//
//  BaseViewController.h
//  ContainerEx
//
//  Created by lalaleelala on 4/29/16.
//  Copyright © 2016 lalaleelala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SliderMenuTableViewCell.h"
@interface BaseViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *sliderMenuTableView;
@property (strong, nonatomic) IBOutlet UIButton *sliderMenuBtn;

- (IBAction)toVC1:(id)sender;
- (IBAction)toVC2:(id)sender;



@end
