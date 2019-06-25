//
//  UIViewController+LEGOPopover.h
//  LEGOTransitionAnimation
//
//  Created by errnull on 2018/5/17.
//  Copyright © 2018年 errnull. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LEGOPopoverMacro.h"
#import "LEGOPopoverAnimator.h"

@interface UIViewController (LEGOPopover)
@property(nonatomic,strong)LEGOPopoverAnimator        *popoverAnimator;

- (void)lg_bottomPresentController:(UIViewController *)vc presentedHeight:(CGFloat)height completeHandle:(LEGOCompleteHandle)completion;

- (void)lg_centerPresentController:(UIViewController *)vc presentedSize:(CGSize)size completeHandle:(LEGOCompleteHandle)completion;


@end
