//
//  Comment.m
//  EtiAndChen
//
//  Created by MTG on 11/10/13.
//  Copyright (c) 2013 MTG. All rights reserved.
//

#import "Comment.h"

@implementation Comment

@synthesize Comment_ID = _Comment_ID;
@synthesize Member_ID = _Member_ID;
@synthesize Greeting_ID = _Greeting_ID;
@synthesize Photo_ID = _Photo_ID;
@synthesize Text = _Text;

#define kCommentIDKey   @"CommentID"
#define kGreetingIDKey  @"GreetingID"
#define kTextKey        @"Text"
#define kMemberIDKey    @"MemberID"
#define kPhotoIDKey     @"PhotoID"
#define kLikeKey        @"Like"

- (void) encodeWithCoder:(NSCoder *)encoder {
    //    NSLog(@"MessageModelToServer encodeWithCoder");
    
    [encoder encodeObject:[[NSNumber alloc] initWithInt:self.Comment_ID]    forKey:kCommentIDKey];
    [encoder encodeObject:[[NSNumber alloc] initWithInt:self.Greeting_ID]     forKey:kGreetingIDKey];
    [encoder encodeObject:self.Text forKey:kTextKey];
    [encoder encodeObject:[[NSNumber alloc] initWithInt:self.Member_ID] forKey:kMemberIDKey];
    [encoder encodeObject:[[NSNumber alloc] initWithInt:self.Photo_ID] forKey:kPhotoIDKey];
    [encoder encodeObject:self.Like forKey:kLikeKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    //    NSLog(@"MessageModelToServer initWithCoder");
    NSNumber *CommentIDNumber = [decoder decodeObjectForKey:kCommentIDKey];
    NSNumber *GreetingIDNumber = [decoder decodeObjectForKey:kGreetingIDKey];
    NSString *Text = [decoder decodeObjectForKey:kTextKey];
    NSNumber *MemberIDNumber = [decoder decodeObjectForKey:kMemberIDKey];
    NSNumber *PhotoIDNumber = [decoder decodeObjectForKey:kPhotoIDKey];
    Like *Like = [decoder decodeObjectForKey:kLikeKey];
    return [self initWithCommentID:[CommentIDNumber intValue] greetingID:[GreetingIDNumber intValue] text:Text memberID:[MemberIDNumber intValue] photoID:[PhotoIDNumber intValue] like:Like];
}

- (id)initWithCommentID:(int)commentID greetingID:(int)greetingID text:(NSString *)text memberID:(int)memberID photoID:(int)photoID like:(Like *)like
{
    //    NSLog(@"MessageModelToServer initWithData");
    
    self.Comment_ID = commentID;
    self.Greeting_ID = greetingID;
    self.Text = text;
    self.Member_ID = memberID;
    self.Photo_ID = photoID;
    self.Like = like;
    return self;
}


@end
