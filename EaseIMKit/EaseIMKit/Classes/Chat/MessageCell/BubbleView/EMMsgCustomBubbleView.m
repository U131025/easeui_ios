//
//  EMMsgCustomBubbleView.m
//  EaseIMKit
//
//  Created by 屋联-神兽 on 2023/9/24.
//  Copyright © 2023 djp. All rights reserved.
//

#import "EMMsgCustomBubbleView.h"
#import "UIImageView+EaseWebCache.h"
#import "EaseHeaders.h"

@interface EMMsgCustomBubbleView ()
{
    EaseChatViewModel *_viewModel;
}

@end

@implementation EMMsgCustomBubbleView

- (instancetype)initWithDirection:(EMMessageDirection)aDirection
                             type:(EMMessageType)aType
                        viewModel:(EaseChatViewModel *)viewModel
{
    self = [super initWithDirection:aDirection type:aType viewModel:viewModel];
    if (self) {
        _viewModel = viewModel;
        [self _setupSubviews];
    }
    
    return self;
}

- (void)_setupSubviews
{
    [self setupBubbleBackgroundImage];
    
    self.textLabel = [[UILabel alloc] init];
    self.textLabel.font = [UIFont systemFontOfSize:_viewModel.contentFontSize];
    self.textLabel.numberOfLines = 2;
    [self addSubview:self.textLabel];
    [self.textLabel Ease_makeConstraints:^(EaseConstraintMaker *make) {
        make.top.equalTo(self.ease_top).offset(10);
        make.bottom.equalTo(self.ease_bottom).offset(-10);
    }];
    self.textLabel.textColor = _viewModel.contentFontColor;
    if (self.direction == EMMessageDirectionSend) {
        [self.textLabel Ease_makeConstraints:^(EaseConstraintMaker *make) {
            make.left.equalTo(self.ease_left).offset(10);
            make.right.equalTo(self.ease_right).offset(-10);
        }];
    } else {
        [self.textLabel Ease_makeConstraints:^(EaseConstraintMaker *make) {
            make.left.equalTo(self.ease_left).offset(10);
            make.right.equalTo(self.ease_right).offset(-10);
        }];
    }
}

- (void)setModel:(EaseMessageModel *)model
{
    EMCustomMessageBody *body = (EMCustomMessageBody *)model.message.body;
        
    NSString *text = body.customExt[@"content"];
    NSMutableAttributedString *attaStr = [[NSMutableAttributedString alloc] initWithString:text];
        
    [attaStr setAttributes:@{
        NSForegroundColorAttributeName: [UIColor colorWithHexString:@"#569900"],
        NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle),
        NSUnderlineColorAttributeName: [UIColor colorWithHexString:@"#569900"]
    } range:NSMakeRange(0, text.length)];

    self.textLabel.attributedText = attaStr;
}

@end
