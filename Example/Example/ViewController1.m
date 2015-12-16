//
//  ViewController1.m
//  IgorBizi@mail.ru
//
//  Created by IgorBizi@mail.ru on 10/27/15.
//  Copyright © 2015 IgorBizi@mail.ru. All rights reserved.
//

#import "ViewController1.h"
#import "ViewController2.h"
#import "BIZCircularTransitionHandler.h"


@interface ViewController1 ()
@property (nonatomic, strong) BIZCircularTransitionHandler *circularTransitionHandler;
@end


@implementation ViewController1


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.circularTransitionHandler = [[BIZCircularTransitionHandler alloc] init];
}


- (IBAction)clickButtonAction:(UIButton *)sender
{
    //Present VC manually
    /*
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ViewController2 *destinationVC = [storyboard instantiateViewControllerWithIdentifier:@"vc2"];
    CGPoint centerOfButton = [sender.superview convertPoint:sender.center toView:nil];
    [self.circularTransitionHandler transitionWithDestinationViewController:destinationVC initialTransitionPoint:centerOfButton];
    [self presentViewController:destinationVC animated:YES completion:nil];
     */
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    ViewController2 *destinationVC = [segue destinationViewController];
    CGPoint centerOfButton = [sender.superview convertPoint:sender.center toView:nil];

    [self.circularTransitionHandler transitionWithDestinationViewController:destinationVC initialTransitionPoint:centerOfButton];
}


@end
