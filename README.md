# BIZCircularTransition 

*Wait for gif presentation, it's loading...*

![alt tag](https://github.com/bizibizi/BIZCircularTransition/blob/master/presentation.gif)


BIZCircularTransition is a round transition between UIViewControllers.


# Installation

### Manually
- Copy ```Classes``` folder to your project 

### From CocoaPods:
```objective-c
pod 'BIZCircularTransition' 
```


# Usage

- Create ```BIZCircularTransitionHandler```
```objective-c
@interface ViewController ()
@property (nonatomic, strong) BIZCircularTransitionHandler *circularTransitionHandler;
...
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.circularTransitionHandler = [[BIZCircularTransitionHandler alloc] init];
...
```
- Setup transition

if you use segue in storyboard
```objective-c
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    ViewController2 *destinationVC = [segue destinationViewController];
    CGPoint centerOfButton = [sender.superview convertPoint:sender.center toView:nil];

    [self.circularTransitionHandler transitionWithDestinationViewController:destinationVC initialTransitionPoint:centerOfButton];
...
```
or present UIViewContoller manullay 
```objective-c
- (IBAction)clickButtonAction:(UIButton *)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ViewController2 *destinationVC = [storyboard instantiateViewControllerWithIdentifier:@"vc2"];
    CGPoint centerOfButton = [sender.superview convertPoint:sender.center toView:nil];

    [self.circularTransitionHandler transitionWithDestinationViewController:destinationVC initialTransitionPoint:centerOfButton];
    [self presentViewController:destinationVC animated:YES completion:nil];
...
```


# Contact

Igor Bizi
- https://www.linkedin.com/in/igorbizi
- igorbizi@mail.ru


# License
 
The MIT License (MIT)

Copyright (c) 2015-present Igor Bizi

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
