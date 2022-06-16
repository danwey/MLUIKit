//
//  MLLoadFailureView.h
//  AomiWaimai
//
//  Created by 付超傑 on 16/9/23.
//  Copyright © 2016年 FuChaojie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLLoadFailureView : UIView

///顯示加載失敗視圖
+ (MLLoadFailureView *)showFailViewWithTarget:(id)target action:(SEL)action superView:(UIView *)superView;
///隱藏並清除加載失敗視圖
+ (void)hideFailureView:(UIView *)failureView;
///現實加載失敗視圖（帶錯誤碼)
+ (MLLoadFailureView *)showFailViewWithTarget:(id)target action:(SEL)action superView:(UIView *)superView code: (NSInteger)code;

@end
