//
//  BIZCircularTransitionHandler.m
//  IgorBizi@mail.ru
//
//  Created by IgorBizi@mail.ru on 6/10/15.
//  Copyright (c) 2015 Igor Bizi. All rights reserved.
//

#import "BIZCircularTransitionHandler.h"
#import "BIZCircularTransitionAnimator.h"


@interface BIZCircularTransitionHandler ()
@property (nonatomic) CGPoint initialTransitionPoint;
@end


@implementation BIZCircularTransitionHandler


#pragma mark - Methods


- (void)transitionWithDestinationViewController:(UIViewController *)destinationVC initialTransitionPoint:(CGPoint)point
{
    destinationVC.transitioningDelegate = self;
    self.initialTransitionPoint = point;
}


#pragma mark - UIViewControllerTransitioningDelegate


-(id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    BIZCircularTransitionAnimator *animator = [BIZCircularTransitionAnimator new];
    animator.isPresenting = YES;
    animator.animationCenterPoint = self.initialTransitionPoint;
    return animator;
}

-(id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    BIZCircularTransitionAnimator *animator = [BIZCircularTransitionAnimator new];
    animator.isPresenting = NO;
    animator.animationCenterPoint = self.initialTransitionPoint;
    self.initialTransitionPoint = CGPointZero;
    return animator;
}



@end
