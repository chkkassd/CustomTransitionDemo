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

@end

@implementation ViewController

- (IBAction)returnFromSegueActions:(UIStoryboardSegue *)sender {
    
}

- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier {
    if ([identifier isEqualToString:@"idFirstSegueUnwind"]) {
        return [[FirstCustomSegueUnwind alloc] initWithIdentifier:identifier source:fromViewController destination:toViewController];
    }
    
    return [super segueForUnwindingToViewController:toViewController fromViewController:fromViewController identifier:identifier];
}

@end
