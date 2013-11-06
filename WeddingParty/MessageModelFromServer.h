//
//  MessageModelFromServer.h
//  WeddingParty
//
//  Created by MTG on 6/4/13.
//  Copyright (c) 2013 MTG. All rights reserved.
//

#import "JSONModel.h"

@interface MessageModelFromServer : JSONModel <NSCoding>

enum MessageTypeFromServer {
    AOK,
    SentLastMessages,
    SentTopHits,
    Error
};

enum ErrorType {
    UserDoesNotExist,
    UserAlreadyExists,
    DetailsAreMissing
};

@property (assign, nonatomic) enum MessageTypeFromServer Type;

@property (assign, nonatomic) enum ErrorType ErrorType;

@property (strong, nonatomic) NSMutableArray *GreetingsList;

@property (strong, nonatomic) NSMutableArray *PhotosList;

@property (assign, nonatomic) NSString *Data;

@end
