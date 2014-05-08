//
//  TNTMachine.m
//  FidoDoorOpener
//
//  Created by Joe Selvik on 5/8/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTMachine.h"

@implementation TNTMachine

- (id)initWithResourceId:(NSUInteger)resourceId
               createdAt:(NSDate *)createdAt
               updatedAt:(NSDate *)updatedAt
                    name:(NSString *)name
                    type:(TNTMachineType)type
               poweredOn:(BOOL)poweredOn
               lockedOut:(BOOL)lockedOut
              accessMode:(TNTMachineAccessMode)mode
         powerOffTimeout:(NSUInteger)powerOffTimeout
                  online:(BOOL)online
{
    if (self = [super initWithResourceId:resourceId createdAt:createdAt updatedAt:updatedAt online:online]) {
        _name = name;
        _type = type;
        _poweredOn = poweredOn;
        _lockedOut = lockedOut;
        _accessMode = mode;
        _powerOffTimeout = powerOffTimeout;
    }
    
    return self;
}


@end
