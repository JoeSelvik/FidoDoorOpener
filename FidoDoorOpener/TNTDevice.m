//
//  TNTDevice.m
//  FidoDoorOpener
//
//  Created by Joe Selvik on 5/8/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTDevice.h"

@implementation TNTDevice

- (id)initWithResourceId:(NSUInteger)resourceId
               createdAt:(NSDate *)createdAt
               updatedAt:(NSDate *)updatedAt
                  online:(BOOL)online
{
    if (self = [super initWithResourceId:resourceId createdAt:createdAt updatedAt:updatedAt]) {
        _online = online;
    }
    
    return self;
}

@end
