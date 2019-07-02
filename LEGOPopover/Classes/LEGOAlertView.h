//
//  LEGOAlertView.h
//  LEGOPopover_Example
//
//  Created by 杨庆人 on 2019/7/2.
//  Copyright © 2019年 564008993@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LGAlertGlobalParameter.h"

typedef void(^LEGOAlertCompletion)(NSInteger index);

@interface LEGOAlertView : UIViewController

+ (void)showInVc:(UIViewController *)vc param:(LGAlertGlobalParameter *)param completion:(LEGOAlertCompletion)completion;

@end

@interface LEGOAlertHighlightButton : UIButton

@end



