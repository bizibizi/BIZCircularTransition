//
//  BIZCircularTransitionHandler.h
//  IgorBizi@mail.ru
//
//  Created by IgorBizi@mail.ru on 6/10/15.
//  Copyright (c) 2015 Igor Bizi. All rights reserved.
//

#import <UIKit/UIKit.h>


// * Class holds implementation of UIViewControllerTransitioningDelegate, that needed to have custom transition
// * To use custom transition need to call transitionWithDestinationViewController:initialTransitionPoint: before presenting ViewContoller (for example from prepareForSegue:sender: method)
@interface BIZCircularTransitionHandler : NSObject <UIViewControllerTransitioningDelegate>
- (void)transitionWithDestinationViewController:(UIViewController *)destinationVC initialTransitionPoint:(CGPoint)point animationDuration:(CGFloat)animationDuration;
- (void)transitionWithDestinationViewController:(UIViewController *)destinationVC initialTransitionRect:(CGRect)rect animationDuration:(CGFloat)animationDuration;
@end
