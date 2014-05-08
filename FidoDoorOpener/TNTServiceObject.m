//
//  TNTServiceObject.m
//  FidoDoorOpener
//
//  Created by Joe Selvik on 5/8/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTServiceObject.h"

@implementation TNTServiceObject

- (id)initWithResourceId:(NSUInteger)resourceId createdAt:(NSDate *)createdAt updatedAt:(NSDate *)updatedAt
{
    if (self = [super init]) {
        _resourceId = resourceId;
        _createdAt = createdAt;
        _updatedAt = updatedAt;
    }
    
    return self;
}

@end
