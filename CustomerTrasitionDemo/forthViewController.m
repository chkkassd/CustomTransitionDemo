//
//  forthViewController.m
//  CustomerTrasitionDemo
//
//  Created by 赛峰 施 on 15/7/23.
//  Copyright (c) 2015年 赛峰 施. All rights reserved.
//

#import "forthViewController.h"

@interface forthViewController ()

@end

@implementation forthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)pan:(UIPanGestureRecognizer *)sender {
    CGFloat progress = [sender translationInView:sender.view].x / sender.view.bounds.size.width;
    
    progress = MIN(1.0, MAX(0.0, progress));
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        [self.interactiveTran updateInteractiveTransition:progress];
    } else if (sender.state == UIGestureRecognizerStateCancelled || sender.state == UIGestureRecognizerStateEnded) {
        if (progress > 0.5) {
            [self.interactiveTran finishInteractiveTransition];
        } else {
            [self.interactiveTran cancelInteractiveTransition];
        }
        self.interactiveTran = nil;
    }
}


@end
