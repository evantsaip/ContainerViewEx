//
//  ContainerViewController.m
//  ContainerEx
//
//  Created by lalaleelala on 5/1/16.
//  Copyright © 2016 lalaleelala. All rights reserved.
//

#import "ContainerViewController.h"
#define SegueIdentifierFirst @"embedFirst"
#define SegueIdentifierSecond @"embedSecond"
#import "EmptySegue.h"
@interface ContainerViewController ()
@property (strong,nonatomic) NSString *currentSegueIdentifier;

@end

@implementation ContainerViewController
{
    NSMutableDictionary *childVC;
    ViewControllerOne *viewControllerOne;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentSegueIdentifier = SegueIdentifierFirst;
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [self changeViewController:segue sender:sender];
}

- (void) changeViewController:(UIStoryboardSegue *)segue sender:(id)sender {
    
    [childVC setObject:segue.destinationViewController forKey:segue.destinationViewController.title];
    [self setViewConrtoller:segue.destinationViewController];
}

- (void)setViewConrtoller:(UIViewController*)targetVC {
    while ([[self childViewControllers] count] > 0) {
        [[self childViewControllers][0] removeFromParentViewController];
    }
    
    [self addChildViewController:targetVC];
    UIView* destView = targetVC.view;
    destView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    destView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:destView];
    [targetVC didMoveToParentViewController:self];
    
    //    NSLog(@"childVC count:%lu",[[self childViewControllers] count]);
}

- (void) vSelector:(id) vodContentType {
    NSString *targetVodContentType;
    if ([vodContentType isKindOfClass:[NSString class]]) {
        targetVodContentType = vodContentType;
    }
    if ([vodContentType isEqualToString:@"vcTwo"]) {
        self.currentSegueIdentifier = SegueIdentifierSecond;
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
    }
    
    if ([vodContentType isEqualToString:@"vcOne"]) {
        self.currentSegueIdentifier = SegueIdentifierFirst;
        [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
    }
}

@end
