//
//  MessageModelFromServer.m
//  WeddingParty
//
//  Created by MTG on 6/6/13.
//  Copyright (c) 2013 MTG. All rights reserved.
//

#import "MessageModelFromServer.h"

@implementation MessageModelFromServer

#define kGreetingsKey       @"Greetings"
#define kPhotosKey          @"Photos"
#define kDataKey            @"Data"
#define kTypeKey            @"Type"
#define kErrorTypeKey       @"ErrorType"

- (void) encodeWithCoder:(NSCoder *)encoder {
//    NSLog(@"MessageModelFromServer encodeWithCoder");

    [encoder encodeObject:self.GreetingsList    forKey:kGreetingsKey];
    [encoder encodeObject:self.PhotosList       forKey:kPhotosKey];
    [encoder encodeObject:self.Data             forKey:kDataKey];
    [encoder encodeObject:[[NSNumber alloc] initWithInt:self.Type]      forKey:kTypeKey];
    [encoder encodeObject:[[NSNumber alloc] initWithInt:self.ErrorType] forKey:kErrorTypeKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
//    NSLog(@"MessageModelFromServer initWithCoder");

    NSMutableArray *greetingsArray = [decoder decodeObjectForKey:kGreetingsKey];
    NSMutableArray *photosArray = [decoder decodeObjectForKey:kPhotosKey];
    NSString *data = [decoder decodeObjectForKey:kDataKey];
    NSNumber *typeNumber = [decoder decodeObjectForKey:kTypeKey];
    NSNumber *errorTypeNumber = [decoder decodeObjectForKey:kErrorTypeKey];
    return [self initWithGreetings:greetingsArray Photos:photosArray Data:data Type:(enum MessageTypeFromServer)[typeNumber intValue] ErrorType:(enum ErrorType)[errorTypeNumber intValue]];
}

- (id)initWithGreetings:(NSMutableArray *)greetingsArray Photos:(NSMutableArray *)photosArray Data:(NSString *)data Type:(enum MessageTypeFromServer)type ErrorType:(enum ErrorType)errorType
{
//    NSLog(@"MessageModelFromServer initWithMessages");

    self.GreetingsList = greetingsArray;
    self.PhotosList = photosArray;
    self.Data = data;
    self.Type = type;
    self.ErrorType = errorType;
    return self;
}

@end
