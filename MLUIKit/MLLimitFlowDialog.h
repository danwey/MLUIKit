//
//  MLLimitFlowDialog.h
//  MacauLife
//
//  Created by xu feifeng on 2020/4/29.
//  Copyright © 2020 mem. All rights reserved.
//

#import <UIKit/UIKit.h> 

@interface MLLimitFlowDialog : UIView

+ (void)popup:(void (^)(void))dismissBlock;

@end
