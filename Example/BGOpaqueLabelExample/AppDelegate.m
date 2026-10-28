//
//  AppDelegate.m
//  BGOpaqueLabelExample
//
//  Created by Ben Guild on 9/25/19.
//  Copyright © 2019 Ben Guild. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (UISceneConfiguration *)application:(UIApplication *)application
configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession
                              options:(UISceneConnectionOptions *)options {
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration"
                                          sessionRole:connectingSceneSession.role];
}

@end
