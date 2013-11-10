//
//  Like.m
//  EtiAndChen
//
//  Created by MTG on 11/10/13.
//  Copyright (c) 2013 MTG. All rights reserved.
//

#import "Like.h"

@implementation Like

@synthesize Like_ID = _Like_ID;
@synthesize Member_ID = _Member_ID;
@synthesize Comment = _Comment;
@synthesize Greeting_ID = _Greeting_ID;
@synthesize Photo_ID = _Photo_ID;

#define kCommentKey   @"Comment"
#define kGreetingIDKey  @"GreetingID"
#define kLikeIDKey      @"LikeID"
#define kMemberIDKey    @"MemberID"
#define kPhotoIDKey     @"PhotoID"

- (void) encodeWithCoder:(NSCoder *)encoder {
    //    NSLog(@"MessageModelToServer encodeWithCoder");
    
    [encoder encodeObject:self.Comment forKey:kCommentKey];
    [encoder encodeObject:[[NSNumber alloc] initWithInt:self.Greeting_ID]     forKey:kGreetingIDKey];
    [encoder encodeObject:[[NSNumber alloc] initWithInt:self.Like_ID] forKey:kLikeIDKey];
    [encoder encodeObject:[[NSNumber alloc] initWithInt:self.Member_ID] forKey:kMemberIDKey];
    [encoder encodeObject:[[NSNumber alloc] initWithInt:self.Photo_ID] forKey:kPhotoIDKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    //    NSLog(@"MessageModelToServer initWithCoder");
    Comment *Comment = [decoder decodeObjectForKey:kCommentKey];
    NSNumber *GreetingIDNumber = [decoder decodeObjectForKey:kGreetingIDKey];
    NSNumber *LikeIDNumber = [decoder decodeObjectForKey:kLikeIDKey];
    NSNumber *MemberIDNumber = [decoder decodeObjectForKey:kMemberIDKey];
    NSNumber *PhotoIDNumber = [decoder decodeObjectForKey:kPhotoIDKey];
    return [self initWithComment:Comment greetingID:[GreetingIDNumber intValue] likeID:[LikeIDNumber intValue] memberID:[MemberIDNumber intValue] photoID:[PhotoIDNumber intValue]];
}

- (id)initWithComment:(Comment *)comment greetingID:(int)greetingID likeID:(int)likeID memberID:(int)memberID photoID:(int)photoID
{
    //    NSLog(@"MessageModelToServer initWithData");
    
    self.Comment = comment;
    self.Greeting_ID = greetingID;
    self.Like_ID = likeID;
    self.Member_ID = memberID;
    self.Photo_ID = photoID;
    return self;
}


@end
