//
//  AnimatedTransitionController.m
//  CustomerTrasitionDemo
//
//  Created by 赛峰 施 on 15/7/20.
//  Copyright (c) 2015年 赛峰 施. All rights reserved.
//

#import "AnimatedTransitionController.h"

@implementation AnimatedTransitionController

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    //获取容器视图的引用
    UIView *containerView = [transitionContext containerView];

    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    if (self.animationType == AnimationTypePresent || self.animationType == AnimationTypePush || self.animationType == AnimationTypeTabBar) {
        toVc.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
        toVc.view.frame = CGRectOffset(toVc.view.frame, 0, height);
       
        [containerView insertSubview:toVc.view aboveSubview:fromVc.view];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toVc.view.transform = CGAffineTransformIdentity;
            toVc.view.frame = CGRectOffset(toVc.view.frame, 0, -height);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];//完成动画后需要调用
        }];
    } else if (self.animationType == AnimationTypeDismiss || self.animationType == AnimationTypePop) {
        [containerView insertSubview:toVc.view belowSubview:fromVc.view];
        NSLog(@"dd%@",NSStringFromCGRect(toVc.view.frame));
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromVc.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
            fromVc.view.frame = CGRectOffset(fromVc.view.frame, 0, height);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

@end
