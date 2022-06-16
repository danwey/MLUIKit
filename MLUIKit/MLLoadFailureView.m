//
//  MLLoadFailureView.m
//  AomiWaimai
//
//  Created by 付超傑 on 16/9/23.
//  Copyright © 2016年 FuChaojie. All rights reserved.
//

#import "MLLoadFailureView.h"
#import <MLFoundation/NSBundle+ML.h>
#import <MLFoundation/KWCommonConfigure.h>
#import <MLFoundation/MLCommonAPI.h>
#import <MLFoundation/NSString+MLConverting.h>


#define kNO_NETWORK_TIPS @"網絡不給力，點擊屏幕重新加載" //網絡不給力，點擊屏幕重新加載

@interface MLLoadFailureView()

@property (nonatomic, strong) UILabel *alertLabel;

@end

@implementation MLLoadFailureView

- (instancetype)initWithFrame:(CGRect)frame addTarget:(id)target action:(SEL)action superView:(UIView *)superView
{
    
    self = [super initWithFrame:frame];
    if (self) {
        if (frame.size.height == kIPHONE_HEIGHT)
        {
            CGFloat height = isIphoneX ? kIphoneXSafeHeight :0;
            self.frame = CGRectMake(0, 64+height, frame.size.width, frame.size.height-64-height);
        }
        self.backgroundColor = kSetCOLOR(0xf4f4f4);
        [superView addSubview:self];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:target action:action];
        [self addGestureRecognizer:tapGesture];
        
        UIImageView *failureView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width/2.0f-44.5,frame.size.height/2.0f-28-50-64, 89,56)];
        failureView.image = [UIImage imageNamed:@"wifi" inBundle:[NSBundle mlhBundle:@"NetworkSDKUI" class:[self class]] compatibleWithTraitCollection:nil];
        [self addSubview:failureView];
        
        _alertLabel = [[UILabel alloc]initWithFrame:CGRectMake(kIPHONE_WIDTH/2.0f-100,failureView.frame.origin.y+66, 200, 30)];
        _alertLabel.text = kNO_NETWORK_TIPS;
        _alertLabel.textColor = [UIColor grayColor];
        _alertLabel.font = [UIFont systemFontOfSize:13];
        _alertLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_alertLabel];
        
    }
    
    return  self;
}

+ (MLLoadFailureView *)showFailViewWithTarget:(id)target action:(SEL)action superView:(UIView *)superView
{
    MLLoadFailureView *failView = [[MLLoadFailureView alloc] initWithFrame:superView.bounds addTarget:target action:action superView:superView];
    failView.alertLabel.text = kNO_NETWORK_TIPS;
    failView.tag = 12222;
    return failView;
}

+ (MLLoadFailureView *)showFailViewWithTarget:(id)target action:(SEL)action superView:(UIView *)superView code: (NSInteger)code
{
    MLLoadFailureView *failView = [[MLLoadFailureView alloc] initWithFrame:superView.bounds addTarget:target action:action superView:superView];
    failView.alertLabel.text = [NSString stringWithFormat:@"%@(%zi)", kNO_NETWORK_TIPS, code];
    failView.alertLabel.frame = CGRectMake(kIPHONE_WIDTH/2.0f-120,kIPHONE_HEIGHT/2.0f-28-50-64+66, 240, 30);
    failView.tag = 12222;
    return failView;
}

+ (void)hideFailureView:(UIView *)failureView
{
    dispatch_async(dispatch_get_main_queue(), ^{
        for (UIView * v in failureView.subviews) {
            if ([v isKindOfClass:[MLLoadFailureView class]]) {
                [v removeFromSuperview];
            }
        }
    });
}


@end
