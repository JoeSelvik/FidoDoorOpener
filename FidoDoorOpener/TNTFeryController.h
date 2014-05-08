//
//  TNTFeryController.h
//  FidoDoorOpener
//
//  Created by Joe Selvik on 5/8/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TNTUser.h"

@interface TNTFeryController : NSObject

+ (TNTFeryController *)sharedInstance;

- (TNTUser *)currentUser;
- (NSArray *)zones;

@end
