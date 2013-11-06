//
//  Greeting.m
//  EtiAndChen
//
//  Created by MTG on 11/6/13.
//  Copyright (c) 2013 MTG. All rights reserved.
//

#import "Greeting.h"

@implementation Greeting

#define kWeddingIDKey   @"WeddingID"
#define kGreetingIDKey  @"GreetingID"
#define kTextKey        @"Text"

- (void) encodeWithCoder:(NSCoder *)encoder {
    //    NSLog(@"MessageModelToServer encodeWithCoder");
    
    [encoder encodeObject:[[NSNumber alloc] initWithInt:self.WeddingID]    forKey:kWeddingIDKey];
    [encoder encodeObject:[[NSNumber alloc] initWithInt:self.GreetingID]     forKey:kGreetingIDKey];
    [encoder encodeObject:self.Text forKey:kTextKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    //    NSLog(@"MessageModelToServer initWithCoder");
    NSNumber *WeddingIDNumber = [decoder decodeObjectForKey:kWeddingIDKey];
    NSNumber *GreetingIDNumber = [decoder decodeObjectForKey:kGreetingIDKey];
    NSString *Text = [decoder decodeObjectForKey:kTextKey];
    return [self initWithWeddingID:[WeddingIDNumber intValue] greetingID:[GreetingIDNumber intValue] text:Text];
}

- (id)initWithWeddingID:(int)weddingID greetingID:(int)greetingID text:(NSString *)text
{
    //    NSLog(@"MessageModelToServer initWithData");
    
    self.WeddingID = weddingID;
    self.GreetingID = greetingID;
    self.Text = text;
    return self;
}


@end
