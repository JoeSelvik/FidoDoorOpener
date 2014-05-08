//
//  TNTFeryController.m
//  FidoDoorOpener
//
//  Created by Joe Selvik on 5/8/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTFeryController.h"

@implementation TNTFeryController

+ (TNTFeryController *)sharedInstance {
    static TNTFeryController *sharedInstance = nil;
    if (sharedInstance == nil) {
        sharedInstance = [[TNTFeryController alloc] init];
    }
    
    return sharedInstance;
}

- (TNTUser *)currentUser
{
    return [[TNTUser alloc] initWithResourceId:1 createdAt:nil updatedAt:nil
                                         email:@"cruella@thenewtricks.com" password:nil fullName:@"Cruella Deville"
                                         admin:YES];
}

- (NSArray *)zones
{
    // Devices
    TNTMachine* bandSaw = [[TNTMachine alloc] initWithResourceId:1 createdAt:nil updatedAt:nil
                                                            name:@"Band Saw 1" type:TNTMachineTypeBandSaw
                                                       poweredOn:NO lockedOut:NO accessMode:TNTMachineAccessModeMomentary powerOffTimeout:60
                                                          online:YES];
    TNTMachine* tableSaw = [[TNTMachine alloc] initWithResourceId:2 createdAt:nil updatedAt:nil
                                                             name:@"Table Saw" type:TNTMachineTypeTableSaw
                                                        poweredOn:NO lockedOut:NO accessMode:TNTMachineAccessModeMomentary powerOffTimeout:60
                                                           online:YES];
    TNTMachine* drillPress = [[TNTMachine alloc] initWithResourceId:3 createdAt:nil updatedAt:nil
                                                               name:@"Black Drill Press" type:TNTMachineTypeDrillPress
                                                          poweredOn:NO lockedOut:NO accessMode:TNTMachineAccessModeMomentary powerOffTimeout:60
                                                             online:YES];
    
    // Zones
    TNTZone *ieRoom = [[TNTZone alloc] initWithResourceId:1 createdAt:nil updatedAt:nil
                                                shortCode:@"IE" name:@"Innovative Engineers"
                                                  devices:@[bandSaw]];
    TNTZone *hknRoom = [[TNTZone alloc] initWithResourceId:2 createdAt:nil updatedAt:nil
                                                 shortCode:@"HKN" name:@"HKN Room"
                                                   devices:@[tableSaw, drillPress]];
    
    // Return the whole shebang
    return @[ieRoom, hknRoom];
}

@end
