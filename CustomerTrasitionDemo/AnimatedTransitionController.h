//
//  AnimatedTransitionController.h
//  CustomerTrasitionDemo
//
//  Created by 赛峰 施 on 15/7/20.
//  Copyright (c) 2015年 赛峰 施. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    AnimationTypePresent,
    AnimationTypeDismiss,
    AnimationTypePush,
    AnimationTypeTabBar
}AnimationType;

@interface AnimatedTransitionController : NSObject<UIViewControllerAnimatedTransitioning>
@property (nonatomic,assign) AnimationType animationType;

@end
