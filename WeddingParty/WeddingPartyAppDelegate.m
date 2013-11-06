//
//  WeddingPartyAppDelegate.m
//  WeddingParty
//
//  Created by MTG on 5/17/13.
//  Copyright (c) 2013 MTG. All rights reserved.
//

#import "WeddingPartyAppDelegate.h"
#import <FacebookSDK/FacebookSDK.h>
#import "MainPicturePageViewController.h"

NSString *const FBSessionStateChangedNotification =
@"com.wedding.party:FBSessionStateChangedNotification";

@interface WeddingPartyAppDelegate ()



@end

@implementation WeddingPartyAppDelegate

@synthesize UserFirstName = _UserFirstName;
@synthesize UserLastName = _UserLastName;
@synthesize Email = _Email;
@synthesize UserFBProfilePictureID = _UserFBProfilePictureID;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.mainViewController = (MainPicturePageViewController*)self.window.rootViewController;
    
    [FBProfilePictureView class];
    [FBLoginView class];
    
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeSound)];

    
    return YES;
}

//- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
//{
////    NSLog(@"Success to register for remote notifications. deviceToken: %@", deviceToken);
//    
//}
//
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"Failed to register for remote notifications. error: %@", error);
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return [FBSession.activeSession handleOpenURL:url];
}

- (void)sessionStateChanged:(FBSession *)session
                      state:(FBSessionState) state
                      error:(NSError *)error
{
//    switch (state) {
//        case FBSessionStateOpen:
//            if ([self.window.rootViewController isMemberOfClass:[MainPicturePageViewController class]])
//            {
//                [self.mainViewController showLoggedInView];
//            }
//            break;
//        
//        case FBSessionStateClosed:
//        case FBSessionStateClosedLoginFailed:
//            
//            [FBSession.activeSession closeAndClearTokenInformation];
//                    
//            [self.mainViewController showLoginView];
//            break;
//        default:
//            break;
//    }
    
    if (error) {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Error"
                                  message:error.localizedDescription
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }
}

- (void)openSession
{
    [FBSession openActiveSessionWithReadPermissions:nil
                                       allowLoginUI:YES
                                  completionHandler:
     ^(FBSession *session,
       FBSessionState state, NSError *error) {
         [self sessionStateChanged:session state:state error:error];
     }];
}



@end
