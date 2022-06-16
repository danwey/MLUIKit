//
//  MLNotFoundAddressView.h
//  Pods
//
//  Created by 王三 on 2017/2/4.
//
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    NOTFOUNDADDRESS,     ///找不到地址404
} DISPLAYERRORTYPE;      ///顯示錯誤類型


@interface MLNotFoundAddressView : UIView


+ (MLNotFoundAddressView *)showNotFoundAddressView:(DISPLAYERRORTYPE)loadType title:(NSString *)title superView:(UIView *)superView;


+ (void)hideIndictor:(UIView *)indictor;

@end
