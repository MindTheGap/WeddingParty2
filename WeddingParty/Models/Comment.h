//
//  Comment.h
//  EtiAndChen
//
//  Created by MTG on 11/10/13.
//  Copyright (c) 2013 MTG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Like;

@interface Comment : NSObject

@property (assign, nonatomic) int Member_ID;
@property (assign, nonatomic) int Comment_ID;
@property (assign, nonatomic) int Greeting_ID;
@property (assign, nonatomic) int Photo_ID;
@property (strong, nonatomic) Like* Like;
@property (strong, nonatomic) NSString *Text;

@end
