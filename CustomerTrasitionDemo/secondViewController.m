//
//  secondViewController.m
//  CustomerTrasitionDemo
//
//  Created by 赛峰 施 on 15/6/23.
//  Copyright (c) 2015年 赛峰 施. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()

@end

@implementation secondViewController

- (IBAction)backPressed:(id)sender {
    [self performSegueWithIdentifier:@"idFirstSegueUnwind" sender:self];
}

@end
