//
//  BaseViewController.m
//  ContainerEx
//
//  Created by lalaleelala on 4/29/16.
//  Copyright © 2016 lalaleelala. All rights reserved.
//

#import "BaseViewController.h"
#import "ContainerViewController.h"

@interface BaseViewController ()
{
    NSMutableArray *sliderMenuDataAry;
    BOOL isAnimate;
}
@property (nonatomic, strong) ContainerViewController *containerViewController;
@end
@implementation BaseViewController

- (void)viewWillAppear:(BOOL)animated {
    sliderMenuDataAry = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 20; i ++) {
        [sliderMenuDataAry addObject:[NSString stringWithFormat:@"%d",i]];
    }
    NSLog(@"%@",sliderMenuDataAry);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    isAnimate = true;
    _sliderMenuTableView.delegate = self;
    [_sliderMenuBtn addTarget:self action:@selector(callSliderMenu) forControlEvents:UIControlEventTouchUpInside];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqual:@"embedContainer"]) {
        
        self.containerViewController = segue.destinationViewController;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return sliderMenuDataAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"SliderMenuTableViewCell";

    
    SliderMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[SliderMenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell loadCell:sliderMenuDataAry[indexPath.row]];
    
    return cell;
}

-(void)callSliderMenu {
    //Starts
    if (isAnimate) {
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^
     {
         _sliderMenuTableView.frame = CGRectMake(0, _sliderMenuTableView.frame.origin.y,_sliderMenuTableView.frame.size.width, _sliderMenuTableView.frame.size.height);
         _sliderMenuTableView.backgroundColor = [UIColor whiteColor];
         [self.sliderMenuTableView layoutSubviews];
     }
                     completion:^(BOOL finished)
     {
     }];
        isAnimate = false;
    } else {
        [UIView animateWithDuration:0.3
                              delay:0.0
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^
         {
            _sliderMenuTableView.frame = CGRectMake( -_sliderMenuTableView.frame.size.width, _sliderMenuTableView.frame.origin.y,_sliderMenuTableView.frame.size.width, _sliderMenuTableView.frame.size.height);
             _sliderMenuTableView.backgroundColor = [UIColor whiteColor];
             [self.sliderMenuTableView layoutSubviews];
         }
                         completion:^(BOOL finished)
         {
         }];
        isAnimate = true;
    }
}

- (void)swapVodBtn:(id)sender {
    [self.containerViewController vSelector:sender];
}

- (IBAction)toVC1:(id)sender {
    [self.containerViewController vSelector:@"vcOne"];

}

- (IBAction)toVC2:(id)sender {
    [self.containerViewController vSelector:@"vcTwo"];

}


@end
