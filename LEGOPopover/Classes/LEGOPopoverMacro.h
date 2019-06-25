//
//  LEGOPopoverMacro.h
//  LEGOTransitionAnimation
//
//  Created by errnull on 2018/5/17.
//  Copyright © 2018年 errnull. All rights reserved.
//

#ifndef LEGOPopoverMacro_h
#define LEGOPopoverMacro_h

#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;

typedef void(^LEGOCompleteHandle)(BOOL presented);

typedef NS_ENUM(NSUInteger, LEGOPopoverType){
    LEGOPopoverTypeActionSheet = 1,
    LEGOPopoverTypeAlert = 2
};

#endif /* LEGOPopoverMacro_h */
