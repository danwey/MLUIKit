//
//  MLLoadingView.h
//  AomiWaimai
//
//  Created by 付超傑 on 16/9/23.
//  Copyright © 2016年 FuChaojie. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    LOADINGFORWAIMAI,    ///外賣加載中
    LOADINGFORGROUP,     ///非外賣加載中
} LOADINGTYPE;

@interface MLLoadingView : UIView

+ (MLLoadingView *)showLoadingViewWithLoadType:(LOADINGTYPE)loadType superView:(UIView *)superView;


+ (void)hideIndictor:(UIView *)indictor;

@end
