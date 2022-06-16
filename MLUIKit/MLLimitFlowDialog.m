//
//  MLLimitFlowDialog.m
//  MacauLife
//
//  Created by xu feifeng on 2020/4/29.
//  Copyright © 2020 mem. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "MLLimitFlowDialog.h"
#import <MLFoundation/NSBundle+ML.h>
#import <MLFoundation/NSString+MLConverting.h>
#import <MLFoundation/MLLocalConfigure.h>

@interface MLLimitFlowDialog()

@property (nonatomic, retain) UIView *containerView;
@property (nonatomic, strong) void (^dismissBlock)(void);
@property (nonatomic, strong, readonly) UILabel *desLabel;
@property (nonatomic, strong, readonly) UIButton *confirmButton;

@end


@implementation MLLimitFlowDialog

+ (void)popup:(void (^)(void))dismissBlock {
    UIView *contentView = [[[NSBundle mlhBundle:@"NetworkSDKUI" class:[self class]] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    MLLimitFlowDialog *alertView = [[MLLimitFlowDialog alloc] init];
    alertView.dismissBlock = dismissBlock;
    [alertView show:contentView];
}

- (id)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        [self.confirmButton setTitle:@"知道了" forState:UIControlStateNormal];
        self.desLabel.text = @"人太多，忙不過來啦，請稍等一下！";
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    NSCParameterAssert(self.desLabel);
    NSCParameterAssert(self.confirmButton);
    
    [self.confirmButton setTitle:@"知道了" forState:UIControlStateNormal];
    self.desLabel.text = @"人太多，忙不過來啦，請稍等一下！";
}

- (void)show:(UIView *)contentView {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGSize dialogSize = contentView.frame.size;
    [self setFrame:CGRectMake(0, 0, screenSize.width, screenSize.height)];
    if (!self.containerView) {
        self.containerView = [[UIView alloc] initWithFrame:CGRectMake((screenSize.width - dialogSize.width) / 2, (screenSize.height - dialogSize.height) / 2, dialogSize.width, dialogSize.height)];
        self.containerView.layer.cornerRadius = 12.f;
        self.containerView.layer.masksToBounds = YES;
        [self addSubview:self.containerView];
    }
    [self.containerView addSubview:contentView];
    UIWindow * window =[[[UIApplication sharedApplication] windows] firstObject];
    for (UIView *view in window.subviews) {
        if ([view isKindOfClass:[MLLimitFlowDialog class]]) {
            [view removeFromSuperview];
        }
    }
    [window addSubview:self];
    [UIView animateWithDuration:0.2f animations:^{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4f];
        self.containerView.layer.opacity = 1.0f;
        self.containerView.layer.transform = CATransform3DMakeScale(1, 1, 1);
    } completion:nil];
}

- (IBAction)close:(id)sender {
    CATransform3D currentTransform = self.containerView.layer.transform;
    self.containerView.layer.opacity = 1.0f;
    [UIView animateWithDuration:0.2f animations:^{
        self.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.0f];
        self.containerView.layer.transform = CATransform3DConcat(currentTransform, CATransform3DMakeScale(0.6f, 0.6f, 1.0));
        self.containerView.layer.opacity = 0.0f;
    } completion:^(BOOL finished) {
        for (UIView *v in [self subviews]) {
            v.hidden = YES;
            [v removeFromSuperview];
        }
        self.hidden = YES;
        [self removeFromSuperview];
        if (self.dismissBlock) {
            self.dismissBlock();
        }
    }];
}

#pragma mark - getter
- (UIButton *)confirmButton
{
    UIButton *btn = [self viewWithTag:100];
    return btn;
}

- (UILabel *)desLabel
{
    UILabel *label = [self viewWithTag:200];
    return label;
}

@end
