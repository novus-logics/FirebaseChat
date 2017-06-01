//
//  AppDelegate.m
//  FirebaseChat
//
//  Created by Novus Logics on 16/05/17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import "AppDelegate.h"

#import "GoogleManager.h"

@import Firebase;
#import <Google/SignIn.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "FIRServerManager.h"

@implementation UIApplication (StatusOnline)

- (void)setStatusTo:(BOOL)status {
    NSString *myID = [[FIRServerManager sharedManager] getMyId];
    if (myID) {
        NSString *pathToUsersStatus = [NSString stringWithFormat:@"users/%@/online/",myID];
        FIRDatabaseReference *usersStatusRef = [[FIRDatabase database] referenceWithPath:pathToUsersStatus];
        if (status) {
            [usersStatusRef setValue:@(YES)];
        } else {
            [usersStatusRef removeValue];
        }
    }
}

@end


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //init FIR
    [FIRApp configure];
    [GoogleManager sharedManager];
    [[Twitter sharedInstance] startWithConsumerKey:@"WgwDqjKgXkNoNuHNkJxloIdlw" consumerSecret:@"e11ghm2HeCypM18eYbqYPPNQm5U6huXBIbEYSHS8V6GqmC9R3U"];
    [Fabric with:@[[Twitter class], [Crashlytics class]]];
  
    
    // for create and make visible ViewController
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *initVC;
    if ([[FIRServerManager sharedManager]isAuth]) {
        initVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"SWRevealViewController"];
    } else {
        initVC = [mainStoryboard instantiateInitialViewController];
    }
    self.window.rootViewController = initVC;
    [self.window makeKeyAndVisible];
    
    // Facebook config
    [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    
    //Google config
    NSError* configureError;
    [[GGLContext sharedInstance] configureWithError: &configureError];
    if (configureError != nil) {
        NSLog(@"Error configuring the Google context: %@", configureError);
    }
    [GIDSignIn sharedInstance].clientID = [FIRApp defaultApp].options.clientID;
    
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:(34.0/255.0) green:(34.0/255.0) blue:(34.0/255.0) alpha:1]];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:(34.0/255.0) green:(34.0/255.0) blue:(34.0/255.0) alpha:1],NSForegroundColorAttributeName,nil]];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    
    // set status offline
    [application setStatusTo:NO];
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    [FBSDKAppEvents activateApp];
    
    //set online
    if ([[FIRServerManager sharedManager]isAuth]) {
        NSString *myID = [[FIRServerManager sharedManager] getMyId];
        NSString *pathToUsersStatus = [NSString stringWithFormat:@"users/%@/online/",myID];
        
        FIRDatabaseReference *connectedRef = [[FIRDatabase database] referenceWithPath:@".info/connected"];
        FIRDatabaseReference *usersStatusRef = [[FIRDatabase database] referenceWithPath:pathToUsersStatus];
        
        [connectedRef observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot *snapshot) {
            if([snapshot.value boolValue]) {
                [usersStatusRef setValue:@(YES)];
                [usersStatusRef onDisconnectRemoveValue];
            }
            else {
                [usersStatusRef setValue:@(NO)];
            }
        }];
    }
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//iOS 8 and lower
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    if ([[FBSDKApplicationDelegate sharedInstance] application:application
                                                            openURL:url
                                                  sourceApplication:sourceApplication
                                                         annotation:annotation]) {
        return YES;
    }
    else if([[GIDSignIn sharedInstance] handleURL:url
                                sourceApplication:sourceApplication
                                       annotation:annotation]){
        return YES;
    }
    
    return NO;
}

//iOS 9 and highter
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    
    if ([[FBSDKApplicationDelegate sharedInstance] application:application
                                                            openURL:url
                                                            options:options]) {
        return YES;
    }
    else if([[GIDSignIn sharedInstance] handleURL:url
                                sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                                       annotation:options[UIApplicationOpenURLOptionsAnnotationKey]]){
        return YES;
    }
    
    return NO;
}


@end
