//
//  ViewController.m
//  CustomerTrasitionDemo
//
//  Created by 赛峰 施 on 15/6/23.
//  Copyright (c) 2015年 赛峰 施. All rights reserved.
//

#import "ViewController.h"
#import "FirstCustomSegueUnwind.h"
#import "forthViewController.h"
#import "fiveViewController.h"
#import "AnimatedTransitionController.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *browView;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (strong, nonatomic) AnimatedTransitionController *animatedTransitionController;

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
    
    self.animatedTransitionController = [[AnimatedTransitionController alloc] init];
}

- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier {
    if ([identifier isEqualToString:@"idFirstSegueUnwind"]) {
        return [[FirstCustomSegueUnwind alloc] initWithIdentifier:identifier source:fromViewController destination:toViewController];
    }
    
    return [super segueForUnwindingToViewController:toViewController fromViewController:fromViewController identifier:identifier];
}

- (IBAction)customPresentationPressed:(id)sender {
    //自定义模态转场
    forthViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"forthViewController"];
    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:NULL];
}

- (IBAction)customPushTransitionPressed:(id)sender {
    //自定义navigation转场
    fiveViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"fiveViewController"];
    self.navigationController.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - UIViewControllerTransitioningDelegate

- (id)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
//    AnimatedTransitionController *animatedTransitionController = [[AnimatedTransitionController alloc] init];
    self.animatedTransitionController.animationType = AnimationTypePresent;
    return self.animatedTransitionController;
}

- (id)animationControllerForDismissedController:(UIViewController *)dismissed {
//    AnimatedTransitionController *animatedTransitionController = [[AnimatedTransitionController alloc] init];
    self.animatedTransitionController.animationType = AnimationTypeDismiss;
    return self.animatedTransitionController;
}

#pragma mark - UINavigationControllerDelegate

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    self.animatedTransitionController.animationType = AnimationTypePush;
    return self.animatedTransitionController;
}
@end
