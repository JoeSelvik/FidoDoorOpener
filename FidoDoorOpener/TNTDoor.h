//
//  TNTDoor.h
//  FidoDoorOpener
//
//  Created by Joe Selvik on 5/8/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTDevice.h"

typedef enum _TNTDoorAccessMode {
    TNTDoorAccessModeMomentary,
    TNTDoorAccessModeTemporary
} TNTDoorAccessMode;


@interface TNTDoor : TNTDevice

@property (strong, nonatomic) NSString *name;
@property (assign, atomic) BOOL locked;
@property (assign, atomic) BOOL lockedOut;
@property (assign, atomic) TNTDoorAccessMode accessMode;
@property (assign, atomic) NSUInteger relockTimeout;
@property (readonly, atomic) BOOL shut;

- (id)initWithResourceId:(NSUInteger)resourceId
               createdAt:(NSDate *)createdAt
               updatedAt:(NSDate *)updatedAt
                    name:(NSString *)name
                  locked:(BOOL)locked
               lockedOut:(BOOL)lockedOut
              accessMode:(TNTDoorAccessMode)mode
           relockTimeout:(NSUInteger)relockTimeout
                    shut:(BOOL)shut
                  online:(BOOL)online;

@end
