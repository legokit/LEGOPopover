//
//  UIViewController+LEGOPopover.m
//  LEGOTransitionAnimation
//
//  Created by errnull on 2018/5/17.
//  Copyright © 2018年 errnull. All rights reserved.
//

#import "UIViewController+LEGOPopover.h"
#import <objc/runtime.h>
#import <LEGOCoreKit/LGPrefix.h>

static const char popoverAnimatorKey;

@implementation UIViewController (LEGOPopover)

- (LEGOPopoverAnimator *)popoverAnimator{
    return objc_getAssociatedObject(self, &popoverAnimatorKey);
}
- (void)setPopoverAnimator:(LEGOPopoverAnimator *)popoverAnimator{
    objc_setAssociatedObject(self, &popoverAnimatorKey, popoverAnimator, OBJC_ASSOCIATION_RETAIN) ;
}


- (void)LEGO_bottomPresentController:(UIViewController *)vc presentedHeight:(CGFloat)height completeHandle:(LEGOCompleteHandle)completion{
    self.popoverAnimator = [LEGOPopoverAnimator popoverAnimatorWithStyle:LEGOPopoverTypeActionSheet completeHandle:completion];
    
    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.transitioningDelegate = self.popoverAnimator;
    [self.popoverAnimator setBottomViewHeight:height+LEGOBottomMargin];

    [self presentViewController:vc animated:YES completion:nil];
}

- (void)LEGO_centerPresentController:(UIViewController *)vc presentedSize:(CGSize)size completeHandle:(LEGOCompleteHandle)completion{
    self.popoverAnimator = [LEGOPopoverAnimator popoverAnimatorWithStyle:LEGOPopoverTypeAlert completeHandle:completion];
    [self.popoverAnimator setCenterViewSize:size];

    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.transitioningDelegate = self.popoverAnimator;
    
    [self presentViewController:vc animated:YES completion:nil];
}

@end
