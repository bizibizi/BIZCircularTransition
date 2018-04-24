//
//  BIZCircularTransitionAnimator.h
//  IgorBizi@mail.ru
//
//  Created by IgorBizi@mail.ru on 6/5/15.
//  Copyright (c) 2015 Igor Bizi. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BIZCircularTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>
+ (NSTimeInterval)animationDuration;

@property (nonatomic) BOOL isPresenting;
// * Use point or rect as a start position
@property (nonatomic) CGPoint animationCenterPoint;
@property (nonatomic) CGRect animationRect;
@end
