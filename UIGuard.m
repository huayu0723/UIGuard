//
//  UIGuard.m
//
//  Created by Hua Zhenyu on 30/04/2017.
//
//

#import "UIGuard.h"
#import "Aspects.h"

@implementation UIGuard

+ (void)load {
    [UIViewController aspect_hookSelector:@selector(dismissViewControllerAnimated:completion:)
                              withOptions:AspectPositionBefore
                               usingBlock:^ {
                                   [UIGuard guardAssert];
                               }
                                    error:nil];
    
    [UIViewController aspect_hookSelector:@selector(presentViewController:animated:completion:)
     
                              withOptions:AspectPositionBefore
                               usingBlock:^() {
                                   [UIGuard guardAssert];
                               }
                                    error:nil];
    
    [UINavigationController aspect_hookSelector:@selector(popViewControllerAnimated:)
                                    withOptions:AspectPositionBefore
                                     usingBlock:^ {
                                         [UIGuard guardAssert];
                                     }
                                          error:nil];

    [UINavigationController aspect_hookSelector:@selector(popToRootViewControllerAnimated:)
                                    withOptions:AspectPositionBefore
                                     usingBlock:^ {
                                         [UIGuard guardAssert];
                                     }
                                          error:nil];

    [UINavigationController aspect_hookSelector:@selector(popToViewController:animated:)
                                    withOptions:AspectPositionBefore
                                     usingBlock:^ {
                                         [UIGuard guardAssert];
    }
                                          error:nil];

    [UINavigationController aspect_hookSelector:@selector(pushViewController:animated:)
                                    withOptions:AspectPositionBefore
                                     usingBlock:^ {
                                         [UIGuard guardAssert];
                                     }
                                          error:nil];
}

+ (void)guardAssert {
    BOOL isMainThread = dispatch_get_current_queue()==dispatch_get_main_queue();
    NSAssert(isMainThread, @"UI must be running in main thread");
}

@end
