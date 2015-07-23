//
//  FirstCustomSegue.m
//  CustomerTrasitionDemo
//
//  Created by 赛峰 施 on 15/6/23.
//  Copyright (c) 2015年 赛峰 施. All rights reserved.
//

#import "FirstCustomSegue.h"

@implementation FirstCustomSegue

- (void)perform {
    UIView *firstView = [(UIViewController *)self.sourceViewController view];
    UIView *secondView = [(UIViewController *)self.destinationViewController view];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    secondView.frame = CGRectMake(0, height, width, height);
    [[[UIApplication sharedApplication] keyWindow] insertSubview:secondView aboveSubview:firstView];
    
    [UIView animateWithDuration:0.5 animations:^{
        firstView.frame = CGRectOffset(firstView.frame, 0, -height);
        secondView.frame = CGRectOffset(secondView.frame, 0, -height);
    } completion:^(BOOL finished) {
        [self.sourceViewController presentViewController:self.destinationViewController animated:NO completion:^{
        }];
    }];
}

@end
