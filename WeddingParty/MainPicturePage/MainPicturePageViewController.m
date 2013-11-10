//
//  MainPicturePageViewController.m
//  WeddingParty
//
//  Created by MTG on 5/17/13.
//  Copyright (c) 2013 MTG. All rights reserved.
//

#import "MainPicturePageViewController.h"
#import "MainLoggedInPageViewController.h"
#import "WeddingPartyAppDelegate.h"

@interface MainPicturePageViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *mainPictureImageView;


@end

@implementation MainPicturePageViewController

- (void)handleViewFetchedUserInfo:(id<FBGraphUser>)user
                         animated:(BOOL)animated
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    UINavigationController *navController = [storyboard instantiateViewControllerWithIdentifier:@"MainLoggedInNavigationController"];
        
    WeddingPartyAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate setUserFBProfilePictureID:user.id];
    [appDelegate setUserFirstName:user.first_name];
    [appDelegate setUserLastName:user.last_name];
    [appDelegate setEmail:user[@"email"]];
    
    [self presentViewController:navController animated:animated completion:nil];


}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"MainPicturePage - ViewWillAppear");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}


- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    [self handleViewFetchedUserInfo:user animated:NO];
}



@end
