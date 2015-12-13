//
//  ViewController2.m
//  IgorBizi@mail.ru
//
//  Created by IgorBizi@mail.ru on 10/27/15.
//  Copyright © 2015 IgorBizi@mail.ru. All rights reserved.
//

#import "ViewController2.h"


@implementation ViewController2


- (IBAction)dismissButtonAction:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
