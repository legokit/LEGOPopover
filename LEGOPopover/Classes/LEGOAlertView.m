
//
//  LEGOAlertView.m
//  LEGOPopover_Example
//
//  Created by 杨庆人 on 2019/7/2.
//  Copyright © 2019年 564008993@qq.com. All rights reserved.
//

#import "LEGOAlertView.h"
#import <Masonry/Masonry.h>
#import <LEGOCoreKit/LGPrefix.h>
#import "UIViewController+LEGOPopover.h"

@interface LEGOAlertView ()
@property (nonatomic, copy) LEGOAlertCompletion completion;
@property (nonatomic, strong) LGAlertGlobalParameter *parameter;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) LEGOAlertHighlightButton *cancelButton;
@property (nonatomic, strong) LEGOAlertHighlightButton *completButton;
@end

@implementation LEGOAlertView

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = self.parameter.titleFont;
        _titleLabel.textColor = self.parameter.titleColor;
        if (self.parameter.titleAttriString) {
            _titleLabel.attributedText = self.parameter.titleAttriString;
        }
        else {
            _titleLabel.text = self.parameter.title;
        }
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.font = self.parameter.detailFont;
        _detailLabel.textColor = self.parameter.detailColor;
        _detailLabel.numberOfLines = 0;
        if (self.parameter.detailAttriString) {
            _detailLabel.attributedText = self.parameter.detailAttriString;
        }
        else {
            _detailLabel.text = self.parameter.detail;
        }
    }
    return _detailLabel;
}

- (LEGOAlertHighlightButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [LEGOAlertHighlightButton buttonWithType:UIButtonTypeCustom];
        [_cancelButton setTitle:self.parameter.cancelString forState:UIControlStateNormal];
        [_cancelButton setTitleColor:[UIColor colorWithWhite:1 alpha:0.5] forState:UIControlStateNormal];
        _cancelButton.titleLabel.font = self.parameter.cancelFont;
        [_cancelButton addTarget:self action:@selector(cancelButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

- (LEGOAlertHighlightButton *)completButton {
    if (!_completButton) {
        _completButton = [LEGOAlertHighlightButton buttonWithType:UIButtonTypeCustom];
        [_completButton setTitle:self.parameter.completString forState:UIControlStateNormal];
        [_completButton setTitleColor:self.parameter.completColor forState:UIControlStateNormal];
        _completButton.titleLabel.font = self.parameter.completFont;
        [_completButton addTarget:self action:@selector(completButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _completButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:35/255.0 green:35/255.0 blue:35/255.0 alpha:1];
    
    [self.view addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(50);
        make.left.offset(36);
    }];
    
    [self.view addSubview:self.detailLabel];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(36);
        make.right.offset(-36);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(24);
    }];
    
    [self.view addSubview:self.cancelButton];
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(36);
        make.bottom.offset(-(55 + LEGOBottomMargin));
    }];
    
    [self.view addSubview:self.completButton];
    [self.completButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-36);
        make.centerY.mas_equalTo(self.cancelButton.mas_centerY);
    }];
    
    // Do any additional setup after loading the view.
}

- (void)cancelButtonClick:(id)sender {
    !self.completion ? :self.completion(0);
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)completButtonClick:(id)sender {
    !self.completion ? :self.completion(1);
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

+ (CGFloat)viewHeight {
    return 245 + LEGOBottomMargin;
}

+ (void)showInVc:(UIViewController *)vc param:(LGAlertGlobalParameter *)param completion:(LEGOAlertCompletion)completion {
    LEGOAlertView *sheetVc = [[LEGOAlertView alloc] init];
    sheetVc.parameter = param;
    sheetVc.completion = completion;
    [vc lg_bottomPresentController:sheetVc presentedHeight:[LEGOAlertView viewHeight] completeHandle:nil];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end


@implementation LEGOAlertHighlightButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addTarget:self action:@selector(highlightButtonDidBeTouchDown:) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(highlightButtonDidBeTouchUpInside:) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchCancel | UIControlEventTouchUpOutside];
    }
    return self;
}

- (void)highlightButtonDidBeTouchDown:(UIButton *)button {
    self.alpha = 0.3f;
}

- (void)highlightButtonDidBeTouchUpInside:(UIButton *)button {
    self.alpha = 1;
}


- (void)setHighlighted:(BOOL)highlighted {
    if (self.selected) {
        [super setHighlighted:NO];
    }
    else {
        [super setHighlighted:highlighted];
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect bounds = self.bounds;
    bounds = CGRectMake(self.bounds.origin.x - 10, self.bounds.origin.y - 10, self.bounds.size.width + 2*10, self.bounds.size.height + 2*10);
    return CGRectContainsPoint(bounds, point);
}

@end
