//
//  MessageModelToServer
//  WeddingParty
//
//  Created by MTG on 6/4/13.
//  Copyright (c) 2013 MTG. All rights reserved.
//

#import "JSONModel.h"

@interface MessageModelToServer : JSONModel <NSCoding>

enum MessageTypeToServer {
    Registration,
    RetreiveLastMessages,
    RetreiveTopHits
};

@property (assign, nonatomic) enum MessageTypeToServer Type;
@property (strong, nonatomic) NSString* Email;
@property (strong, nonatomic) NSString* UserFirstName;
@property (strong, nonatomic) NSString* UserLastName;
@property (strong, nonatomic) NSString* DeviceToken;
@property (assign, nonatomic) int       WeddingID;




@end
