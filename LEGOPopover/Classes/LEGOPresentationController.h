//
//  LEGOPresentationController.h
//  LEGOTransitionAnimation
//
//  Created by errnull on 2018/5/17.
//  Copyright © 2018年 errnull. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LEGOPopoverMacro.h"

@interface LEGOPresentationController : UIPresentationController
@property(nonatomic,assign)CGSize           presentedSize;
@property(nonatomic,assign)CGFloat          presentedHeight;
@property(nonatomic,strong)UIColor          *coverColor;

@property(nonatomic,strong)UIView           *coverView;

@property(nonatomic,assign)LEGOPopoverType    popoverType;

@end
