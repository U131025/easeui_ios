//
//  EMBaseChatBar.m
//  EaseIMKit
//
//  Created by 屋联-神兽 on 2023/9/17.
//  Copyright © 2023 djp. All rights reserved.
//

#import "EMBaseChatBar.h"
#import "View+EaseAdditions.h"
#import "UIImage+EaseUI.h"
#import "UIColor+EaseUI.h"

#define kTextViewMinHeight 32
#define kTextViewMaxHeight 80
#define kIconwidth 22
#define kModuleMargin 10

@implementation EMBaseChatBar

- (instancetype)initWithViewModel:(EaseChatViewModel *)viewModel
{
    self = [super init];
    if (self) {
        _version = [[[UIDevice currentDevice] systemVersion] floatValue];
        _previousTextViewContentHeight = kTextViewMinHeight;
        _viewModel = viewModel;
        [self _setupSubviews];
    }
    
    return self;
}

- (void)clearInputViewText {
    self.textView.text = @"";
}

- (void)inputViewAppendText:(NSString *)aText {
    
}

- (BOOL)deleteTailText {
    return NO;
}

- (void)clearMoreViewAndSelectedButton {
    
}

- (void)_setupSubviews {
    self.backgroundColor = self.viewModel.chatBarBgColor;
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor colorWithHexString:@"#000000"];
    line.alpha = 0.1;
    [self addSubview:line];
    [line Ease_makeConstraints:^(EaseConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(@0.5);
    }];
    
}

@end
