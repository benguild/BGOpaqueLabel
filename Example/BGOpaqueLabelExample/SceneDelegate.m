//
//  SceneDelegate.m
//  BGOpaqueLabelExample
//
//  Created by Ben Guild on 10/28/26.
//

#import "SceneDelegate.h"

#import "ViewController.h"

@implementation SceneDelegate

- (void)scene:(UIScene *)scene
willConnectToSession:(UISceneSession *)session
      options:(UISceneConnectionOptions *)connectionOptions {
    if (![scene isKindOfClass:[UIWindowScene class]]) {
        NSAssert(NO, @"unexpected object");
        return;
    }

    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    self.window.rootViewController = [[ViewController alloc] init];

    [self.window makeKeyAndVisible];
}

@end
