//
//  TNTServiceObject.h
//  FidoDoorOpener
//
//  Created by Joe Selvik on 5/8/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TNTServiceObject : NSObject

@property (assign, nonatomic) NSUInteger resourceId;
@property (strong, nonatomic) NSDate *createdAt;
@property (strong, atomic) NSDate* updatedAt;

- (id)initWithResourceId:(NSUInteger)id createdAt:(NSDate *)createdAt updatedAt:(NSDate *)updatedAt;

@end
