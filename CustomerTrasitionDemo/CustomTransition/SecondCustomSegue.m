//
//  SecondCustomSegue.m
//  CustomerTrasitionDemo
//
//  Created by 赛峰 施 on 15/6/23.
//  Copyright (c) 2015年 赛峰 施. All rights reserved.
//

#import "SecondCustomSegue.h"

@implementation SecondCustomSegue

- (void)perform {
    UIView *firstView = [(UIViewController *)self.sourceViewController view];
    UIView *thirdView = [(UIViewController *)self.destinationViewController view];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    thirdView.frame = CGRectMake(width, 20, width - 20, height - 20);
    thirdView.transform = CGAffineTransformRotate(thirdView.transform, 0.25 * M_PI);
    [[[UIApplication sharedApplication] keyWindow] insertSubview:thirdView aboveSubview:firstView];
    
    [UIView animateWithDuration:1 animations:^{
        thirdView.frame = CGRectMake(20, 20, width - 20, height - 20);
        thirdView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self.sourceViewController presentViewController:self.destinationViewController animated:NO completion:NULL];
    }];
    
}
@end
