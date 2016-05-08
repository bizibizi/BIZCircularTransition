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
@property (nonatomic) CGRect initialTransitionRect;
@end


@implementation BIZCircularTransitionHandler


#pragma mark - Methods


- (void)transitionWithDestinationViewController:(UIViewController *)destinationVC initialTransitionPoint:(CGPoint)point
{
    destinationVC.transitioningDelegate = self;
    self.initialTransitionPoint = point;
}

- (void)transitionWithDestinationViewController:(UIViewController *)destinationVC initialTransitionRect:(CGRect)rect
{
    destinationVC.transitioningDelegate = self;
    self.initialTransitionRect = rect;
}


#pragma mark - UIViewControllerTransitioningDelegate


-(id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    BIZCircularTransitionAnimator *animator = [BIZCircularTransitionAnimator new];
    animator.isPresenting = YES;
    if (!CGPointEqualToPoint(self.initialTransitionPoint, CGPointZero)) {
        animator.animationCenterPoint = self.initialTransitionPoint;
    } else if (CGRectEqualToRect(self.initialTransitionRect, CGRectZero)) {
        animator.animationRect = self.initialTransitionRect;
    }
    return animator;
}

-(id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    BIZCircularTransitionAnimator *animator = [BIZCircularTransitionAnimator new];
    animator.isPresenting = NO;
    if (!CGPointEqualToPoint(self.initialTransitionPoint, CGPointZero)) {
        animator.animationCenterPoint = self.initialTransitionPoint;
        self.initialTransitionPoint = CGPointZero;
    } else if (CGRectEqualToRect(self.initialTransitionRect, CGRectZero)) {
        animator.animationRect = self.initialTransitionRect;
        self.initialTransitionRect = CGRectZero;
    }
    return animator;
}



@end
