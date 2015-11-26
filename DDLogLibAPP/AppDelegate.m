//
//  AppDelegate.m
//  DDLogLibAPP
//
//  Created by huyt on 15/11/19.
//  Copyright © 2015年 infocare. All rights reserved.
//

#import "AppDelegate.h"
#import <DDLogLib/DDLogLib.h>

#import <DDLog.h>
#import <DDFileLogger.h>
#import <DDTTYLogger.h>

static int ddLogLevel	= LOG_LEVEL_INFO;

@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Override point for customization after application launch.
	
	//app 通过静态库调用
//	DDLogLib* logLib = [[DDLogLib alloc] init];
//	[logLib printABC];

	//app 直接调用
	DDLogFileManagerDefault *logFileManager = [[DDLogFileManagerDefault alloc] init];
	DDFileLogger* _fileLogger = [[DDFileLogger alloc] initWithLogFileManager:logFileManager];
	_fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
	_fileLogger.logFileManager.maximumNumberOfLogFiles = 7; // a weeks worth
	
	//#ifdef DEBUG
	[DDLog addLogger:[DDTTYLogger sharedInstance]];// this is log to xcode window.
	//#else
	[DDLog addLogger:_fileLogger];
	//#endif
	
	DDLogInfo(@"application ABC");
	
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
