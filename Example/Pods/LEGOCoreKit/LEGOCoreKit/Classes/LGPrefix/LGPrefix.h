//
//  LEGOPrefix.h
//  LEGOCoreKit
//
//  Created by 杨庆人 on 2019/5/9.
//  Copyright © 2019年 564008993@qq.com. All rights reserved.
//

#ifndef LEGOPrefix_h
#define LEGOPrefix_h

// Log
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif
#define FuncLog NSLog(@"%s",__func__)

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0)
#define IS_IPHONE_6_PLUS (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0)

#define IsiPhoneXDevice ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size)) : NO)
#define IsiPhoneXSDevice ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size)) : NO)
#define IsiPhoneXSMaxDevice ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size)) : NO)
#define IsiPhoneXRDevice ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(750, 1624), [[UIScreen mainScreen] currentMode].size)) : NO)
#define IsiPhoneX ((IsiPhoneXDevice || IsiPhoneXSDevice || IsiPhoneXSMaxDevice || IsiPhoneXRDevice) ? YES : NO)

// 屏幕的参数
#define LEGOScreenWidth [[UIScreen mainScreen] bounds].size.width
#define LEGOScreenHeight [[UIScreen mainScreen] bounds].size.height
#define LEGOScreen CGRectMake(0, 0, LEGOScreenWidth, LEGOScreenHeight)

#define LEGONavMargan        (IsiPhoneX ? 40.f : 0.f)
#define LEGONavHeight        (IsiPhoneX ? 70.f : 64.f)
#define LEGOBottomMargin     (IsiPhoneX ? 34.f : 0.f)
#define LEGOViewRate         LEGOScreenWidth / 375.0
#define LEGOStatusBarHeight (CGFloat)(IsiPhoneX?(44.0):(0.0))

// view.frame
#define LEGO_VIEW_H(view)        CGRectGetHeight(view.frame)
#define LEGO_VIEW_W(view)        CGRectGetWidth(view.frame)
#define LEGO_VIEW_MIN_X(view)    CGRectGetMinX(view.frame)
#define LEGO_VIEW_MAX_X(view)    CGRectGetMaxX(view.frame)
#define LEGO_VIEW_MID_X(view)    CGRectGetMidX(view.frame)
#define LEGO_VIEW_MIN_Y(view)    CGRectGetMinY(view.frame)
#define LEGO_VIEW_MAX_Y(view)    CGRectGetMaxY(view.frame)
#define LEGO_VIEW_MID_Y(view)    CGRectGetMidY(view.frame)

// layout
#define LEGO_RectFromSize(size) CGRectMake(0,0,size.width,size.height)

// 导航按钮的宽高
#define LEGO_NAV_Item_Width 44

// 颜色
#define LEGOColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

// 语言国际化
#define LEGOLocalString(key,comment) NSLocalizedStringFromTable((key), @"Common", (comment))

// 异步GCD
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)

#endif /* LEGOPrefix_h */
