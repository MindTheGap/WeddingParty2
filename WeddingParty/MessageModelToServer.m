//
//  MessageModel.m
//  WeddingParty
//
//  Created by MTG on 6/4/13.
//  Copyright (c) 2013 MTG. All rights reserved.
//

#import "MessageModelToServer.h"

@implementation MessageModelToServer

#define kUserFirstNameKey   @"UserFirstName"
#define kUserLastNameKey    @"UserLastName"
#define kEmailKey           @"Email"
#define kDeviceTokenKey     @"DeviceToken"
#define kWeddingIDKey       @"WeddingID"

- (void) encodeWithCoder:(NSCoder *)encoder {
//    NSLog(@"MessageModelToServer encodeWithCoder");

    [encoder encodeObject:self.UserFirstName    forKey:kUserFirstNameKey];
    [encoder encodeObject:self.UserLastName     forKey:kUserLastNameKey];
    [encoder encodeObject:self.Email            forKey:kEmailKey];
    [encoder encodeObject:self.DeviceToken      forKey:kDeviceTokenKey];
    [encoder encodeObject:[[NSNumber alloc] initWithInt:self.WeddingID] forKey:kWeddingIDKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
//    NSLog(@"MessageModelToServer initWithCoder");
    NSString *UserFirstName = [decoder decodeObjectForKey:kUserFirstNameKey];
    NSString *UserLastName = [decoder decodeObjectForKey:kUserLastNameKey];
    NSString *Email = [decoder decodeObjectForKey:kEmailKey];
    NSString *DeviceToken = [decoder decodeObjectForKey:kDeviceTokenKey];
    NSNumber *WeddingIDNumber = [decoder decodeObjectForKey:kWeddingIDKey];
    return [self initWithEmail:Email userFirstName:UserFirstName userLastName:UserLastName deviceToken:DeviceToken weddingID:[WeddingIDNumber intValue]];
}

- (id)initWithEmail:(NSString *)email userFirstName:(NSString *)userFirstName userLastName:(NSString *)userLastName deviceToken:(NSString *)deviceToken weddingID:(int)weddingID
{
//    NSLog(@"MessageModelToServer initWithData");

    self.Email = email;
    self.UserFirstName = userFirstName;
    self.UserLastName = userLastName;
    self.DeviceToken = deviceToken;
    self.WeddingID = weddingID;
    return self;
}

@end
