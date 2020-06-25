//
//  AppDelegate.m
//  RSSchool_Task6
//
//  Created by Roman on 6/18/20.
//  Copyright © 2020 Roman. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) ViewController* vc;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [UIWindow new];
    _vc = [ViewController new];
    self.window.rootViewController = _vc;
    [self.window makeKeyAndVisible];
    return YES;
}



@end
