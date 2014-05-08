//
//  TNTMachine.h
//  FidoDoorOpener
//
//  Created by Joe Selvik on 5/8/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTDevice.h"

typedef enum _TNTMachineType {
    TNTMachineTypeBandSaw,
    TNTMachineTypeTableSaw,
    TNTMachineTypeWoodLathe,
    TNTMachineTypeDrillPress,
    TNTMachineTypeTableRouter,
    TNTMachineTypeMiterSaw
} TNTMachineType;

typedef enum _TNTMachineAccessMode {
    TNTMachineAccessModeMomentary,
    TNTMachineAccessModeTemporary
} TNTMachineAccessMode;


@interface TNTMachine : TNTDevice

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) TNTMachineType type;
@property (assign, atomic) BOOL poweredOn;
@property (assign, atomic) BOOL lockedOut;
@property (assign, atomic) TNTMachineAccessMode accessMode;
@property (assign, atomic) NSUInteger powerOffTimeout;

- (id)initWithResourceId:(NSUInteger)resourceId
               createdAt:(NSDate *)createdAt
               updatedAt:(NSDate *)updatedAt
                    name:(NSString *)name
                    type:(TNTMachineType)type
               poweredOn:(BOOL)poweredOn
               lockedOut:(BOOL)lockedOut
              accessMode:(TNTMachineAccessMode)mode
         powerOffTimeout:(NSUInteger)powerOffTimeout
                  online:(BOOL)online;

@end
