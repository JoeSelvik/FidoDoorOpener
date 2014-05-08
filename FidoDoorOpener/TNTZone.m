//
//  TNTZone.m
//  FidoDoorOpener
//
//  Created by Joe Selvik on 5/8/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTZone.h"

@implementation TNTZone

- (id)initWithResourceId:(NSUInteger)resourceId
               createdAt:(NSDate *)createdAt
               updatedAt:(NSDate *)updatedAt
               shortCode:(NSString *)shortCode
                    name:(NSString *)name
                 devices:(NSArray *)devices
{
    if (self = [super initWithResourceId:resourceId createdAt:createdAt updatedAt:updatedAt]) {
        _shortCode = shortCode;
        _name = name;
        _devices = devices;
    }
    
    return self;
}

@end
