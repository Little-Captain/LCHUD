//
//  UIViewController+LCHUD.m
//  Version 1.0.0
//  Created by Little-Captain on 7/21/2017.
//

#import "UIViewController+LCHUD.h"

#import "MBProgressHUD.h"
#import <objc/runtime.h>

static const void *HttpRequestLCHUDKey = &HttpRequestLCHUDKey;

@implementation UIViewController (LCHUD)

- (void)lc_showHudInView:(UIView *)view hint:(NSString *)hint {
    
    MBProgressHUD *HUD = [self HUD] ? [self HUD] : [[MBProgressHUD alloc] initWithView:view];
    HUD.labelText = hint;
    [view addSubview:HUD];
    [HUD show:YES];
    [self setHUD:HUD];
}

- (void)lc_showHint:(NSString *)hint {
    
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.yOffset = 180;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

- (void)lc_showHint:(NSString *)hint yOffset:(float)yOffset {
    
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.yOffset = 180;
    hud.yOffset += yOffset;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

- (void)lc_hideHud {
    
    [[self HUD] hide:YES];
}

#pragma mark - private method

- (MBProgressHUD *)HUD {
    
    return objc_getAssociatedObject(self, HttpRequestLCHUDKey);
}

- (void)setHUD:(MBProgressHUD *)HUD {
    
    objc_setAssociatedObject(self, HttpRequestLCHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
