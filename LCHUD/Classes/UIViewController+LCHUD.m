//
//  UIViewController+LCHUD.m
//  Version 1.0.0
//  Created by Little-Captain on 7/21/2017.
//

#import "UIViewController+LCHUD.h"

#import "MBProgressHUD.h"
#import <objc/runtime.h>

static const void *HttpRequestLCHUDKey = &HttpRequestLCHUDKey;
static const void *NoMoreDataLCHUDKey = &NoMoreDataLCHUDKey;

@implementation UIViewController (LCHUD)

- (void)lc_showRequestHudInView:(UIView *)view hint:(NSString *)hint {
    
    MBProgressHUD *HUD = [self httpRequestHUD] ? [self httpRequestHUD] : [[MBProgressHUD alloc] initWithView:view];
    HUD.labelText = hint;
    [view addSubview:HUD];
    [HUD show:YES];
    [self setHttpRequestHUD:HUD];
}

- (void)lc_hideRequestHud {
    
    [[self httpRequestHUD] hide:YES];
}

- (void)lc_showNoMoreHudInView:(UIView *)view hint:(NSString *)hint {
    
    MBProgressHUD *HUD = [self noMoreDataHUD] ? [self noMoreDataHUD] : [[MBProgressHUD alloc] initWithView:view];
    HUD.mode = MBProgressHUDModeText;
    HUD.labelText = hint;
    HUD.margin = 10.f;
    HUD.yOffset = 180;
    [view addSubview:HUD];
    [HUD show:YES];
    [self setNoMoreDataHUD:HUD];
}

- (void)lc_hideNoMoreHud {
    
    [[self noMoreDataHUD] hide:YES];
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

#pragma mark - private method

- (MBProgressHUD *)httpRequestHUD {
    
    return objc_getAssociatedObject(self, HttpRequestLCHUDKey);
}

- (void)setHttpRequestHUD:(MBProgressHUD *)httpRequestHUD {
    
    objc_setAssociatedObject(self, HttpRequestLCHUDKey, httpRequestHUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MBProgressHUD *)noMoreDataHUD {
    
    return objc_getAssociatedObject(self, NoMoreDataLCHUDKey);
}

- (void)setNoMoreDataHUD:(MBProgressHUD *)noMoreDataHUD {
    
    objc_setAssociatedObject(self, NoMoreDataLCHUDKey, noMoreDataHUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
