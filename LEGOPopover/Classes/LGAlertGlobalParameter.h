//
//  LGAlertGlobalParameter.h
//  LEGOPopover_Example
//
//  Created by 杨庆人 on 2019/7/2.
//  Copyright © 2019年 564008993@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGAlertGlobalParameter : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSAttributedString *detailAttributedString;
@property (nonatomic, strong) NSString *cancelString;
@property (nonatomic, strong) NSString *completString;

@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *detailColor;
@property (nonatomic, strong) UIColor *cancelColor;
@property (nonatomic, strong) UIColor *completColor;

@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIFont *detailFont;
@property (nonatomic, strong) UIFont *cancelFont;
@property (nonatomic, strong) UIFont *completFont;

@property (nonatomic, assign) CGFloat viewHeight;

+ (instancetype)defaultConfigureMake:(void(^)(LGAlertGlobalParameter *configure))make;

@end

NS_ASSUME_NONNULL_END
