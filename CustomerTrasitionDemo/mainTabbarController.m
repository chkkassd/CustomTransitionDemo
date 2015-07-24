//
//  mainTabbarController.m
//  CustomerTrasitionDemo
//
//  Created by 赛峰 施 on 15/7/24.
//  Copyright (c) 2015年 赛峰 施. All rights reserved.
//

#import "mainTabbarController.h"
#import "AnimatedTransitionController.h"

@interface mainTabbarController ()<UITabBarControllerDelegate>

@end

@implementation mainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
}

#pragma mark - UITabBarControllerDelegate

- (id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
            animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                              toViewController:(UIViewController *)toVC {
    AnimatedTransitionController *animatedTransitionController = [[AnimatedTransitionController alloc] init];
    animatedTransitionController.animationType = AnimationTypeTabBar;
    return animatedTransitionController;
}

@end
