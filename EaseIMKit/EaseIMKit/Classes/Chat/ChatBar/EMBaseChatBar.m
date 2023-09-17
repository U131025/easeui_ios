//
//  EMBaseChatBar.m
//  EaseIMKit
//
//  Created by 屋联-神兽 on 2023/9/17.
//  Copyright © 2023 djp. All rights reserved.
//

#import "EMBaseChatBar.h"

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
    
}

@end
