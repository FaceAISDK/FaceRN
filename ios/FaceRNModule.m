//
//  FaceRNModule.m
//  FaceRN
//

#import "FaceRNModule.h"
#import "MyViewController.h"
#import <UIKit/UIKit.h>

@implementation FaceRNModule

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(openMYViewController) {
    dispatch_async(dispatch_get_main_queue(), ^{
        MyViewController *vc = [[MyViewController alloc] init];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;

        UIWindow *keyWindow = nil;
        for (UIWindowScene *windowScene in [UIApplication sharedApplication].connectedScenes) {
            if ([windowScene isKindOfClass:[UIWindowScene class]] && windowScene.activationState == UISceneActivationStateForegroundActive) {
                for (UIWindow *window in windowScene.windows) {
                    if (window.isKeyWindow) {
                        keyWindow = window;
                        break;
                    }
                }
            }
        }

        UIViewController *rootVC = keyWindow.rootViewController;
        if (rootVC.presentedViewController) {
            [rootVC.presentedViewController presentViewController:vc animated:YES completion:nil];
        } else {
            [rootVC presentViewController:vc animated:YES completion:nil];
        }
    });
}

@end
