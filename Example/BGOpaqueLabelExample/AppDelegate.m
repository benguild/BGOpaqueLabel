//
//  AppDelegate.m
//  BGOpaqueLabelExample
//
//  Created by Ben Guild on 9/25/19.
//  Copyright © 2019 Ben Guild. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = [[ViewController alloc] init];

    [self.window makeKeyAndVisible];

    return YES;
}

@end
