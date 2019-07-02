#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "LEGOAlertView.h"
#import "LEGOPopoverAnimator.h"
#import "LEGOPopoverMacro.h"
#import "LEGOPresentationController.h"
#import "LGAlertGlobalParameter.h"
#import "UIViewController+LEGOPopover.h"

FOUNDATION_EXPORT double LEGOPopoverVersionNumber;
FOUNDATION_EXPORT const unsigned char LEGOPopoverVersionString[];

