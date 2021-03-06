//
//  UIViewController+LCHUD.h
//  Version 1.0.0
//  Created by Little-Captain on 7/21/2017.
//

#import <UIKit/UIKit.h>

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN
@interface UIViewController (LCHUD)

/**
 显示请求 hud

 @param view 容器视图
 @param hint 提示消息
 */
- (void)lc_showRequestHudInView:(UIView *)view hint:(NSString *)hint;

/**
 隐藏请求 hud
 */
- (void)lc_hideRequestHud;

/**
 显示上传进度 hud

 @param view 容器视图
 @param hint 提示消息
 */
- (void)lc_showUploadProgressHUDInView:(UIView *)view hint:(NSString *)hint;

/**
 隐藏上传进度 hud
 */
- (void)lc_hideUploadProgressHUD;

/**
 获取与当前控制器绑定的上传进度 hud

 @return hud
 */
- (MBProgressHUD *)uploadProgressHUD;

/**
 显示蒙版 hud

 @param view 容器视图
 @param hint 提示消息
 */
- (void)lc_showMaskHUDInView:(UIView *)view hint:(NSString *)hint;

/**
 隐藏蒙版 hud
 */
- (void)lc_hideMaskHUD;

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
