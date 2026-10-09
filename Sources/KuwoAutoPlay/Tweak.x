#import <UIKit/UIKit.h>

%hook UIScene
- (void)sceneDidBecomeActive
{
    %orig;
    NSLog(@"[KuwoAutoPlay] 🟢 Scene 已经激活，延时2.5s准备扫描UI");
    static BOOL g_hasTriggered;
    g_hasTriggered = NO;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if(g_hasTriggered) return;
        UIWindow *keyWin = self.windows.firstObject;
        if(!keyWin)
        {
            NSLog(@"[KuwoAutoPlay] ❌ 未能拿到 window");
            return;
        }

        void (^scanView)(UIView *) = ^(UIView *view)
        {
            if (g_hasTriggered) return;
            if ([view isKindOfClass:[UIControl class]])
            {
                UIControl *ctrl = (UIControl *)view;
                if(ctrl.isUserInteractionEnabled && ctrl.enabled)
                {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [ctrl sendActionsForControlEvents:UIControlEventTouchUpInside];
                        NSLog(@"[KuwoAutoPlay] ✅ 找到控件，模拟点击");
                    });
                    g_hasTriggered = YES;
                    return;
                }
            }
            for (UIView *sub in view.subviews)
            {
                scanView(sub);
                if(g_hasTriggered) return;
            }
        };
        scanView(keyWin);
    });
}
%end
