//
//  EMBaseChatBar.h
//  EaseIMKit
//
//  Created by 屋联-神兽 on 2023/9/17.
//  Copyright © 2023 djp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EaseTextView.h"
#import "EaseChatViewModel.h"
#import <HyphenateChat/HyphenateChat.h>

NS_ASSUME_NONNULL_BEGIN

@protocol EMChatBarDelegate <NSObject>

@optional

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;

- (void)textViewDidChangeSelection:(UITextView *)textView;

- (void)inputViewDidChange:(EaseTextView *)aInputView;

- (void)chatBarDidShowMoreViewAction;

- (void)chatBarSendMsgAction:(NSString *)text;

- (void)chatBarSendPhotoAlbumAction;

- (NSString *)chatBarQuoteMessageShowContent:(EMChatMessage *)message;

@end

@interface EMBaseChatBar : UIView<UITextViewDelegate>

@property (nonatomic, weak) id<EMChatBarDelegate> delegate;
@property (nonatomic, strong) EaseTextView *textView;

@property (nonatomic) CGFloat version;
@property (nonatomic) CGFloat previousTextViewContentHeight;
@property (nonatomic, strong) EaseChatViewModel *viewModel;

- (instancetype)initWithViewModel:(EaseChatViewModel *)viewModel;

- (void)clearInputViewText;

- (void)inputViewAppendText:(NSString *)aText;

- (BOOL)deleteTailText;

- (void)clearMoreViewAndSelectedButton;

- (void)_setupSubviews;

@end

NS_ASSUME_NONNULL_END
