//
//  FirstCustomSegueUnwind.m
//  CustomerTrasitionDemo
//
//  Created by 赛峰 施 on 15/6/23.
//  Copyright (c) 2015年 赛峰 施. All rights reserved.
//

#import "FirstCustomSegueUnwind.h"

@implementation FirstCustomSegueUnwind

- (void)perform {
    UIView *secondView = [(UIViewController *)self.sourceViewController view];
    UIView *firstView = [(UIViewController *)self.destinationViewController view];
    
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    firstView.frame = CGRectMake(0, -height, width, height);
    [[[UIApplication sharedApplication] keyWindow] insertSubview:firstView aboveSubview:secondView];
    
    [UIView animateWithDuration:0.5 animations:^{
        secondView.frame = CGRectOffset(secondView.frame, 0, height);
        firstView.frame = CGRectOffset(firstView.frame, 0, height);
    } completion:^(BOOL finished) {
        [self.sourceViewController dismissViewControllerAnimated:NO completion:NULL];
    }];
}
@end
