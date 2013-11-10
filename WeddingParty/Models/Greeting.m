//
//  Greeting.m
//  EtiAndChen
//
//  Created by MTG on 11/6/13.
//  Copyright (c) 2013 MTG. All rights reserved.
//

#import "Greeting.h"

@implementation Greeting

@synthesize Wedding_ID = _Wedding_ID;
@synthesize Greeting_ID = _Greeting_ID;
@synthesize Text = _Text;
@synthesize Comment = _Comment;
@synthesize Like = _Like;

#define kWeddingIDKey   @"WeddingID"
#define kGreetingIDKey  @"GreetingID"
#define kTextKey        @"Text"
#define kCommentKey @"Comment"
#define kLikeKey @"Like"

- (void) encodeWithCoder:(NSCoder *)encoder {
    //    NSLog(@"MessageModelToServer encodeWithCoder");
    
    [encoder encodeObject:[[NSNumber alloc] initWithInt:self.Wedding_ID]    forKey:kWeddingIDKey];
    [encoder encodeObject:[[NSNumber alloc] initWithInt:self.Greeting_ID]     forKey:kGreetingIDKey];
    [encoder encodeObject:self.Text forKey:kTextKey];
    [encoder encodeObject:self.Comment forKey:kCommentKey];
    [encoder encodeObject:self.Like forKey:kLikeKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    //    NSLog(@"MessageModelToServer initWithCoder");
    NSNumber *WeddingIDNumber = [decoder decodeObjectForKey:kWeddingIDKey];
    NSNumber *GreetingIDNumber = [decoder decodeObjectForKey:kGreetingIDKey];
    NSString *Text = [decoder decodeObjectForKey:kTextKey];
    NSArray *Comment = [decoder decodeObjectForKey:kCommentKey];
    NSArray *Like = [decoder decodeObjectForKey:kLikeKey];
    return [self initWithWeddingID:[WeddingIDNumber intValue] greetingID:[GreetingIDNumber intValue] text:Text comment:Comment like:Like];
}

- (id)initWithWeddingID:(int)weddingID greetingID:(int)greetingID text:(NSString *)text comment:(NSArray *)comment like:(NSArray *)like
{
    //    NSLog(@"MessageModelToServer initWithData");
    
    self.Wedding_ID = weddingID;
    self.Greeting_ID = greetingID;
    self.Text = text;
    self.Comment = comment;
    self.Like = like;
    return self;
}


@end
