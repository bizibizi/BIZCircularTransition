//
//  BIZCircularTransitionAnimator.m
//  IgorBizi@mail.ru
//
//  Created by IgorBizi@mail.ru on 6/5/15.
//  Copyright (c) 2015 Igor Bizi. All rights reserved.
//

#import "BIZCircularTransitionAnimator.h"


@interface BIZCircularTransitionAnimator ()
@property (strong, nonatomic) UIViewController *toVC;
@property (strong, nonatomic) UIViewController *fromVC;
@property (nonatomic, strong) id transitionContext;
@end


@implementation BIZCircularTransitionAnimator


#pragma mark - Class Methods


+ (CGFloat)animationDuration
{
    return 0.8;
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {    return [[self class] animationDuration];
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    // * Lets you keep a reference to the transitionContext out of the scope of this method, so you can access it later.
    self.transitionContext = transitionContext;
    
    // * Keep a references to the VCs that have transitions
    self.fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    self.toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // * Adjust frame of destination VC, that view did not layout it's subviews for now
    self.toVC.view.frame = self.fromVC.view.frame;
    
    UIViewController *sourceViewController = nil;
    UIViewController *destinationViewController = nil;
    if (self.isPresenting) {
        sourceViewController = self.fromVC;
        destinationViewController = self.toVC;
    } else {
        sourceViewController = self.toVC;
        destinationViewController = self.fromVC;
    }
    
    // * The container view is the view in which the animation happens; the from and to view controllers are the same view controllers that take part in the animation.
    [transitionContext.containerView addSubview:sourceViewController.view];
    [transitionContext.containerView addSubview:destinationViewController.view];
    
    // * Creates two circular UIBezierPath instances; one is the size of the caller of presenting from VC, and the second has a radius large enough to cover the entire screen. The final animation will be between these two bezier paths.
    UIBezierPath *smallCircleMaskPath = [UIBezierPath bezierPathWithOvalInRect:[self rectForAnimator]];
    UIBezierPath *bigCircleMaskPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-destinationViewController.view.frame.size.height/2 - [self rectForAnimator].origin.x/2, -destinationViewController.view.frame.size.height/2 - [self rectForAnimator].origin.y/2, destinationViewController.view.frame.size.height*2, destinationViewController.view.frame.size.height*2)];
    
    UIBezierPath *circleMaskPathInitial;
    UIBezierPath *circleMaskPathFinal;
    if (self.isPresenting) {
        circleMaskPathInitial = smallCircleMaskPath;
        circleMaskPathFinal = bigCircleMaskPath;
    } else {
        circleMaskPathInitial = bigCircleMaskPath;
        circleMaskPathFinal = smallCircleMaskPath;
    }
    
    // * Creates a new CAShapeLayer to represent the circle mask. You assign its path value with the final circular path after the animation to avoid the layer snapping back after the animation completes.
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = destinationViewController.view.frame;
    maskLayer.path = circleMaskPathInitial.CGPath;
    destinationViewController.view.layer.mask = maskLayer;
    
    // * Creates a CABasicAnimation on the path key path that goes from circleMaskPathInitial to circleMaskPathFinal. You also register a delegate, as you’ll do some cleanup after the animation completes.
    NSString *pathKey = @"path";
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:pathKey];
    pathAnimation.delegate = self;
    pathAnimation.fromValue = (id)circleMaskPathInitial.CGPath;
    pathAnimation.toValue = (id)circleMaskPathFinal.CGPath;
    pathAnimation.duration = [self transitionDuration:transitionContext];
    
    // * Start animation
    maskLayer.path = circleMaskPathFinal.CGPath;
    [maskLayer addAnimation:pathAnimation forKey:pathKey];
}

// * Create rect from that circle will be drawn
- (CGRect)rectForAnimator
{
    if (CGRectEqualToRect(CGRectZero, self.animationRect)) {
        CGFloat radius = 0;
        return CGRectMake(self.animationCenterPoint.x - radius, self.animationCenterPoint.y - radius, radius*2, radius*2);
    } else {
        return self.animationRect;
    }
}


#pragma mark - CABasicAnimationDelegate


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        // * Finish transition and clean
        [self.transitionContext completeTransition:YES];
        
        self.toVC.view.layer.mask = nil;
        self.fromVC.view.layer.mask = nil;
        self.toVC = nil;
        self.fromVC = nil;
        self.transitionContext = nil;
    }
}



@end
