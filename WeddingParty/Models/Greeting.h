//
//  Greeting.h
//  EtiAndChen
//
//  Created by MTG on 11/6/13.
//  Copyright (c) 2013 MTG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface Greeting : JSONModel <NSCoding>

@property (assign, nonatomic) int WeddingID;
@property (assign, nonatomic) int GreetingID;
@property (strong, nonatomic) NSString *Text;

@end
