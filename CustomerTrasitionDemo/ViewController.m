//
//  ViewController.m
//  CustomerTrasitionDemo
//
//  Created by 赛峰 施 on 15/6/23.
//  Copyright (c) 2015年 赛峰 施. All rights reserved.
//

#import "ViewController.h"
#import "FirstCustomSegueUnwind.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *browView;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@end

@implementation ViewController

- (IBAction)returnFromSegueActions:(UIStoryboardSegue *)sender {
    
}

- (void)viewDidLoad {
    self.browView.exclusiveTouch = YES;
    [UIView animateKeyframesWithDuration:5.0 delay:0 options:UIViewKeyframeAnimationOptionAutoreverse animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.2 animations:^{
            self.browView.frame = CGRectOffset(self.browView.frame, 15, 5);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.2 relativeDuration:0.2 animations:^{
            self.browView.frame = CGRectOffset(self.browView.frame, 15, -5);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.4 relativeDuration:0.2 animations:^{
            self.browView.frame = CGRectOffset(self.browView.frame, 15, 5);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.6 relativeDuration:0.2 animations:^{
            self.browView.frame = CGRectOffset(self.browView.frame, 15, -5);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.8 relativeDuration:0.2 animations:^{
            self.browView.frame = CGRectOffset(self.browView.frame, 15, 5);
        }];
    } completion:^(BOOL finished) {
        
    }];
    
    [UIView animateWithDuration:5 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseIn animations:^{
//        self.blueView.frame = CGRectOffset(self.blueView.frame, 0, 30);
        self.blueView.backgroundColor = [UIColor greenColor];
    } completion:NULL];
}

- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier {
    if ([identifier isEqualToString:@"idFirstSegueUnwind"]) {
        return [[FirstCustomSegueUnwind alloc] initWithIdentifier:identifier source:fromViewController destination:toViewController];
    }
    
    return [super segueForUnwindingToViewController:toViewController fromViewController:fromViewController identifier:identifier];
}

@end
