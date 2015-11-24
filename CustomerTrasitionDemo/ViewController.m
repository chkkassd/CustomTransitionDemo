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
#import "InteractiveTransitionController.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *browView;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (strong, nonatomic) AnimatedTransitionController *animatedTransitionController;
//@property (strong, nonatomic) InteractiveTransitionController *interactiveTransition;
@property (nonatomic,assign) int a;

@property (nonatomic,assign) CGFloat startScale;
@property (nonatomic, strong) UIPinchGestureRecognizer *pinchRecognizer;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactiveTransition;

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
    
    _pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    _a = 1;
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
//    self.interactiveTransition = [[InteractiveTransitionController alloc] initWithNavigationController:self.navigationController];
//    self.interactiveTransition.tapView = vc.view;
//    self.interactiveTransition.type = INTERACTIVE_TYPE_PUSH;
    [vc.view addGestureRecognizer:_pinchRecognizer];
    self.interactiveTransition = [[InteractiveTransitionController alloc] init];
//    self.interactiveTransition.type = INTERACTIVE_TYPE_PUSH;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)handlePinch:(UIPinchGestureRecognizer *)pinch {
    CGFloat scale = pinch.scale;
    switch (pinch.state) {
        case UIGestureRecognizerStateBegan: {
            _startScale = scale;
            NSLog(@"start:%f",scale);
            [self.navigationController popViewControllerAnimated:YES];
            break;
        }
        case UIGestureRecognizerStateChanged: {
            NSLog(@"changed:%f",scale);
            CGFloat percent = (1.0 - scale/_startScale);
            NSLog(@"opopop%f",percent);
            [self.interactiveTransition updateInteractiveTransition:(percent < 0.0) ?
             0.0 : percent];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            NSLog(@"end:%f",scale);
            CGFloat percent = (1.0 - scale/_startScale);
            BOOL cancelled = ([pinch velocity] < 5.0 && percent
                              <= 0.3);
            if (cancelled) {
                [self.interactiveTransition cancelInteractiveTransition];
            }
            else {
                [self.interactiveTransition finishInteractiveTransition];
            }
            break;
        }
        case UIGestureRecognizerStateCancelled: {
            NSLog(@"cancel:%f",scale);
            CGFloat percent = (1.0 - scale/_startScale);
            BOOL cancelled = ([pinch velocity] < 5.0 && percent
                              <= 0.3);
            if (cancelled) [self.interactiveTransition cancelInteractiveTransition];
            else [self.interactiveTransition finishInteractiveTransition];
            break;
        }
    }
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.animatedTransitionController.animationType = AnimationTypePresent;
    return self.animatedTransitionController;
}

- (id)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.animatedTransitionController.animationType = AnimationTypeDismiss;
    return self.animatedTransitionController;
}

//交互转场
//- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {
//    return nil;
//}
//
//- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
//    if ([animator isKindOfClass:[AnimatedTransitionController class]]) {
//        return self.interactiveTransition;
//    } else return nil;
//}

#pragma mark - UINavigationControllerDelegate

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        self.animatedTransitionController.animationType = AnimationTypePush;
//        self.interactiveTransition.type = INTERACTIVE_TYPE_PUSH;
    } else if (operation == UINavigationControllerOperationPop) {
        self.animatedTransitionController.animationType = AnimationTypePop;
//        self.interactiveTransition.type = INTERACTIVE_TYPE_POP;
    }
    return self.animatedTransitionController;
}

- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    if ([animationController isKindOfClass:[AnimatedTransitionController class]]) {
//        if (self.interactiveTransition.type != INTERACTIVE_TYPE_PUSH) {
//            return self.interactiveTransition;
//        } else return nil;
        ++_a;
        if (_a % 2 == 1) {
            return self.interactiveTransition;
        } else return nil;
    } else return nil;
}

@end
