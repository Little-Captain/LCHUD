//
//  UIViewController+LCHUD.h
//  Version 1.0.0
//  Created by Little-Captain on 7/21/2017.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIViewController (LCHUD)

/**
 在 view 上显示提示信息

 @param view view
 @param hint 提示信息
 */
- (void)lc_showHudInView:(UIView *)view hint:(NSString *)hint;

/**
 隐藏 hud
 */
- (void)lc_hideHud;

/**
 显示 hud

 @param hint 提示信息
 */
- (void)lc_showHint:(NSString *)hint;

/**
 显示提示信息

 @param hint 提示信息
 @param yOffset 纵向偏移量
 */
- (void)lc_showHint:(NSString *)hint yOffset:(float)yOffset;

@end
NS_ASSUME_NONNULL_END
