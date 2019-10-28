//
//  LEGOPopoverAnimator.h
//  LEGOTransitionAnimation
//
//  Created by errnull on 2018/5/17.
//  Copyright © 2018年 errnull. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LEGOPopoverMacro.h"

@interface LEGOPopoverAnimator : NSObject<UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate>
@property(nonatomic,assign)CGRect       presentedFrame;

+ (instancetype)popoverAnimatorWithStyle:(LEGOPopoverType )popoverType completeHandle:(LEGOCompleteHandle)completeHandle;

- (void)setCenterViewSize:(CGSize)size;
- (void)setBottomViewHeight:(CGFloat)height;
- (void)setCoverViewColor:(UIColor *)color;

@end
