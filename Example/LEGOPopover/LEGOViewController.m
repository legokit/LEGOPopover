//
//  LEGOViewController.m
//  LEGOPopover
//
//  Created by 564008993@qq.com on 06/25/2019.
//  Copyright (c) 2019 564008993@qq.com. All rights reserved.
//

#import "LEGOViewController.h"
#import <LEGOPopover/LEGOAlertView.h>

@interface LEGOViewController ()

@end

@implementation LEGOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    LGAlertGlobalParameter *parm = [LGAlertGlobalParameter defaultConfigureMake:^(LGAlertGlobalParameter * _Nonnull configure) {
        NSString *string = @"隐藏胶卷将不会删除该胶卷内照片。在“胶卷商店”重新使用该胶卷可将胶卷重新显示";
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineSpacing = 5;
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        [attributes setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
        configure.detailAttriString = [[NSAttributedString alloc] initWithString:string attributes:attributes];
        
        configure.title = @"隐藏 LM Color 100";
        configure.cancelString = @"取消";
        configure.completString = @"隐藏胶卷";
    }];
    
    [LEGOAlertView showInVc:self param:parm completion:^(NSInteger index) {
        if (1 == index) {
            
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
