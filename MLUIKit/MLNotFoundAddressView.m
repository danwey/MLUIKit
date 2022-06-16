//
//  MLNotFoundAddressView.m
//  Pods
//
//  Created by 王三 on 2017/2/4.
//
//

#import "MLNotFoundAddressView.h"
#import <MLFoundation/KWCommonConfigure.h>
#import <MLFoundation/MLLocalConfigure.h>
#import <MLFoundation/NSBundle+ML.h>
 
@interface MLNotFoundAddressView()

@property (nonatomic, strong) UIImageView *imageIcon;    ///顯示圖案

@property (nonatomic, strong) UILabel *titleLabel;   //顯示內容

@end

@implementation MLNotFoundAddressView

- (instancetype)initWithFrame:(CGRect)frame superView:(UIView *)superView
{
    self = [super initWithFrame:frame];
    if (self)
    {
        if (frame.size.height == kIPHONE_HEIGHT){
            CGFloat height = isIphoneX ? kIphoneXSafeHeight :0;
            self.frame = CGRectMake(0, 64+height, frame.size.width, frame.size.height-64-height);
        }
        self.backgroundColor = kSetCOLOR(0xf4f4f4);
        [superView addSubview:self];
        
        UIImage *image = [UIImage imageNamed:@"pageview404" inBundle:[NSBundle mlhBundle:@"NetworkSDKUI" class:[self class]] compatibleWithTraitCollection:nil];//[UIImage imageNamed:@"pageview404"];
        _imageIcon = [[UIImageView alloc] initWithImage:image];
        _imageIcon.frame = CGRectMake((kIPHONE_WIDTH-image.size.width)/2, (kIPHONE_HEIGHT-image.size.height)/2-50-64, image.size.width, image.size.height);
        [self addSubview:_imageIcon];
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((kIPHONE_WIDTH-200)/2, _imageIcon.frame.size.height+_imageIcon.frame.origin.y, 200,40)];
        _titleLabel.numberOfLines = 2;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = kSetCOLOR(0x333333);
        _titleLabel.text = kERRORCODE_WITH_404;
        [self addSubview:_titleLabel];
        
    }
    return self;
}

+ (MLNotFoundAddressView *)showNotFoundAddressView:(DISPLAYERRORTYPE)loadType title:(NSString *)title superView:(UIView *)superView
{
    MLNotFoundAddressView *loadingView = [[MLNotFoundAddressView alloc] initWithFrame:superView.bounds superView:superView];
    
    if (title.length > 0 && title)
    {
        loadingView.titleLabel.text = title;
    }
    
    if (![MLNotFoundAddressView checkIsSameView:superView]) {
        loadingView.tag = 100112;
        [superView addSubview:loadingView];
    }
    return loadingView;
}

+ (BOOL)checkIsSameView:(UIView *)superView{
    NSArray *subviews = superView.subviews;
    for (id view in subviews) {
        if ([view isKindOfClass:[MLNotFoundAddressView class]]) {
            return YES;
        }
    }
    
    return NO;
}


+ (void)hideIndictor:(UIView *)indictor
{
    NSArray *subviews = indictor.subviews;
    for (id view in subviews) {
        if ([view isKindOfClass:[MLNotFoundAddressView class]]) {
            [view removeFromSuperview];
        }
    }
}

@end
