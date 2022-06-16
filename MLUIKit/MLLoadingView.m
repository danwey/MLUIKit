//
//  MLLoadingView.m
//  AomiWaimai
//
//  Created by 付超傑 on 16/9/23.
//  Copyright © 2016年 FuChaojie. All rights reserved.
//

#import "MLLoadingView.h"
#import <YYImage/YYImage.h>
#import <MLFoundation/NSBundle+ML.h>
#import <MLFoundation/KWCommonConfigure.h>
#import <MLFoundation/MLCommonAPI.h>
#import <MLFoundation/MLLocalConfigure.h>
#import <MLFoundation/UIView+Layout.h>
#import <Lottie/Lottie.h>

@interface MLLoadingView()

//@property (nonatomic, strong) YYAnimatedImageView *imageIcon;    ///顯示圖案
@property (nonatomic,strong) LOTAnimationView *lotView;
@property (nonatomic, strong) UILabel *titleLabel;   //顯示內容

@end

@implementation MLLoadingView

- (instancetype)initWithFrame:(CGRect)frame Viewcontroller:(UIView *)superView
{
    self = [super initWithFrame:frame];
    if (self) {
        if (frame.size.height == kIPHONE_HEIGHT)
        {
            CGFloat height = isIphoneX ? kIphoneXSafeHeight :0;
            self.frame = CGRectMake(0, 64+height, frame.size.width, frame.size.height-64-height);
        }
        self.width = MIN(frame.size.width, kIPHONE_WIDTH);
        self.backgroundColor = kSetCOLOR(0xf4f4f4);
        [superView addSubview:self];
        
//        UIImage *image = [UIImage imageNamed:@"waimaiLoading" inBundle:[NSBundle mlhBundle:@"NetworkSDKUI" class:[self class]] compatibleWithTraitCollection:nil];//[UIImage imageNamed:@"waimaiLoading"];
        
//        _imageIcon = [[YYAnimatedImageView alloc] initWithImage:image];
//        _imageIcon.frame = CGRectMake((kIPHONE_WIDTH-80)/2, (kIPHONE_HEIGHT-80)/2-50-64, 80, 80);
//        [self addSubview:_imageIcon];
        
        _lotView = [LOTAnimationView animationNamed:@"PageLoading" inBundle:[NSBundle mlhBundle:@"NetworkSDKUI" class:[self class]]];
        _lotView.frame = CGRectMake((kIPHONE_WIDTH-80)/2, (kIPHONE_HEIGHT-80)/2-50-64, 80, 80);
        _lotView.contentMode = UIViewContentModeScaleAspectFit;
        _lotView.loopAnimation = YES;
//        _lotView.animationSpeed = 0.5;
        [self addSubview:_lotView];
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _lotView.frame.size.height+_lotView.frame.origin.y,self.width,20)];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = kSetCOLOR(0x666666);
        [self addSubview:_titleLabel];
        
    }
    return self;
}

+ (MLLoadingView *)showLoadingViewWithLoadType:(LOADINGTYPE)loadType superView:(UIView *)superView
{
    MLLoadingView *loadingView = [[MLLoadingView alloc] initWithFrame:superView.bounds Viewcontroller:superView];
    [loadingView.lotView play];
//    NSString *path = [[NSBundle mlhBundle:@"NetworkSDKUI" class:[self class]] pathForResource:@"FullScreenLoadingDynamicGraph" ofType:@"gif"];
//    NSData *data = [NSData dataWithContentsOfFile:path];
//    UIImage *gifiImage = [YYImage imageWithData:data];//[YYImage imageNamed:@"FullScreenLoadingDynamicGraph.gif"];
//    loadingView.imageIcon.image = gifiImage;
    setFrameY(loadingView.titleLabel, loadingView.lotView.frame.size.height + loadingView.lotView.frame.origin.y);
    loadingView.titleLabel.text = [@"努力加載中" stringByAppendingString:@"..."];
    if (![MLLoadingView checkIsSameView:superView]) {
        loadingView.tag = 100111;
        [superView addSubview:loadingView];
    }

    return loadingView;
}

+ (BOOL)checkIsSameView:(UIView *)superView{
    NSArray *subviews = superView.subviews;
    for (id view in subviews) {
        if ([view isKindOfClass:[MLLoadingView class]]) {
            return YES;
        }
    }
    
    return NO;
}

+ (void)hideIndictor:(UIView *)indictor{
    NSArray *subviews = indictor.subviews;
    for (id view in subviews) {
        if ([view isKindOfClass:[MLLoadingView class]]) {
            [view removeFromSuperview];
        }
    }
}


@end
