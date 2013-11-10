//
//  Greeting.h
//  EtiAndChen
//
//  Created by MTG on 11/6/13.
//  Copyright (c) 2013 MTG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@class Comment;

@interface Greeting : JSONModel <NSCoding>

@property (assign, nonatomic) int Wedding_ID;
@property (assign, nonatomic) int Greeting_ID;
@property (strong, nonatomic) NSString *Text;
@property (strong, nonatomic) NSArray *Comment;
@property (strong, nonatomic) NSArray *Like;


@end
