//
//  LEGOPopoverAnimator.m
//  LEGOTransitionAnimation
//
//  Created by errnull on 2018/5/17.
//  Copyright © 2018年 errnull. All rights reserved.
//

#import "LEGOPopoverAnimator.h"
#import "LEGOPopoverMacro.h"
#import "LEGOPresentationController.h"

#define kAnimationDuration 0.3

@interface LEGOPopoverAnimator()
{
    BOOL                       _isPresented;
    CGSize                     _presentedSize;
}
@property(nonatomic,copy)  LEGOCompleteHandle           completeHandle;
@property(nonatomic,assign)LEGOPopoverType              popoverType;
@property(nonatomic,assign)CGFloat                    presentedHeight;

@property(nonatomic,strong)UIColor          *coverColor;

@property(nonatomic,strong)LEGOPresentationController  *presentationController;

@end

@implementation LEGOPopoverAnimator

+ (instancetype)popoverAnimatorWithStyle:(LEGOPopoverType )popoverType completeHandle:(LEGOCompleteHandle)completeHandle{
    LEGOPopoverAnimator *popoverAnimator = [[LEGOPopoverAnimator alloc] init];
    popoverAnimator.popoverType = popoverType;
    popoverAnimator.completeHandle = completeHandle;
    return popoverAnimator;
}

#pragma mark - <UIViewControllerTransitioningDelegatere>
- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source{
    LEGOPresentationController *presentation = [[LEGOPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    presentation.popoverType = self.popoverType;
    if (_popoverType == LEGOPopoverTypeAlert) {
        presentation.presentedSize = _presentedSize;
    }else{
        presentation.presentedHeight = _presentedHeight;
    }
    presentation.coverColor = _coverColor;
    self.presentationController = presentation;
    return presentation;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    _isPresented = YES;
    !self.completeHandle?:self.completeHandle(_isPresented);
    return self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    _isPresented = NO;
    !self.completeHandle? :self.completeHandle(_isPresented);
    return self;
}

#pragma mark - <UIViewControllerAnimatedTransitioning>
- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return kAnimationDuration;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    _isPresented?[self animationForPresentedView:transitionContext]:[self animationForDismissedView:transitionContext];
}

#pragma mark - animationMethod
// Presented
- (void)animationForPresentedView:(nonnull id<UIViewControllerContextTransitioning>)transitionContext{
    UIView *presentedView = [transitionContext viewForKey:UITransitionContextToViewKey];
    [transitionContext.containerView addSubview:presentedView];
    self.presentationController.coverView.alpha = 0.0f;
    // 设置阴影
    transitionContext.containerView.layer.shadowColor = [UIColor blackColor].CGColor;
    transitionContext.containerView.layer.shadowOffset = CGSizeMake(0, 5);
    transitionContext.containerView.layer.shadowOpacity = 0.5f;
    transitionContext.containerView.layer.shadowRadius = 10.0f;
    
    WeakSelf(weakSelf)
    if (self.popoverType == LEGOPopoverTypeAlert) {
        presentedView.alpha = 0.0f;
        presentedView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        // 动画弹出
        [UIView animateWithDuration:kAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            weakSelf.presentationController.coverView.alpha = 1.0f;
            presentedView.alpha = 1.0f;
            presentedView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }else{
        presentedView.transform = CGAffineTransformMakeTranslation(0, _presentedHeight);
        [UIView animateWithDuration:kAnimationDuration animations:^{
            weakSelf.presentationController.coverView.alpha = 1.0f;
            presentedView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    
}
// Dismissed
- (void)animationForDismissedView:(nonnull id<UIViewControllerContextTransitioning>)transitionContext{
    UIView *presentedView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    WeakSelf(weakSelf)
    if (self.popoverType == LEGOPopoverTypeAlert) {
        // 消失
        [UIView animateWithDuration:kAnimationDuration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            weakSelf.presentationController.coverView.alpha = 0.0f;
            presentedView.alpha = 0.0f;
        } completion:^(BOOL finished) {
            [presentedView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }else{
        [UIView animateWithDuration:kAnimationDuration animations:^{
            weakSelf.presentationController.coverView.alpha = 0.0f;
            presentedView.transform = CGAffineTransformMakeTranslation(0, weakSelf.presentedHeight);
        } completion:^(BOOL finished) {
            [presentedView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }
}

#pragma mark - Setting
- (void)setBottomViewHeight:(CGFloat)height{
    _presentedHeight = height;
}

- (void)setCenterViewSize:(CGSize)size{
    _presentedSize = size;
}

- (void)setCoverViewColor:(UIColor *)color {
    _coverColor = color;
}

@end
