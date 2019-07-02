//
//  LGAlertGlobalParameter.m
//  LEGOPopover_Example
//
//  Created by 杨庆人 on 2019/7/2.
//  Copyright © 2019年 564008993@qq.com. All rights reserved.
//

#import "LGAlertGlobalParameter.h"

#define IS_IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

@implementation LGAlertGlobalParameter

+ (instancetype)defaultConfigureMake:(void(^)(LGAlertGlobalParameter *configure))make; {
    LGAlertGlobalParameter *configure = [[LGAlertGlobalParameter alloc] init];

    configure.titleColor = [UIColor colorWithRed:171 /255.0 green:142 /255.0 blue:78 /255.0 alpha:1];
    configure.detailColor = [UIColor whiteColor];
    configure.cancelColor = [UIColor colorWithWhite:1 alpha:0.5];
    configure.completColor = [UIColor colorWithRed:171 /255.0 green:142 /255.0 blue:78 /255.0 alpha:1];
    
    configure.titleFont = [UIFont systemFontOfSize:19 weight:UIFontWeightSemibold];
    configure.detailFont = [UIFont systemFontOfSize:15 weight:UIFontWeightSemibold];
    configure.cancelFont = [UIFont systemFontOfSize:17 weight:UIFontWeightRegular];
    configure.completFont = [UIFont systemFontOfSize:17 weight:UIFontWeightRegular];
    
    configure.viewHeight = 245 + (IS_IPHONE_X ? 34 : 0);
    !make ? :make(configure);
    return configure;
}



@end
