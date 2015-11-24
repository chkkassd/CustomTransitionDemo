//
//  InteractiveTransitionController.h
//  CustomerTrasitionDemo
//
//  Created by 赛峰 施 on 15/11/24.
//  Copyright © 2015年 赛峰 施. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    INTERACTIVE_TYPE_PUSH,
    INTERACTIVE_TYPE_POP
}InteractiveType;

@interface InteractiveTransitionController : UIPercentDrivenInteractiveTransition
@property (nonatomic, assign) InteractiveType type;
@end
