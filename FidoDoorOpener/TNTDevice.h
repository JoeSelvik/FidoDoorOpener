//
//  TNTDevice.h
//  FidoDoorOpener
//
//  Created by Joe Selvik on 5/8/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTServiceObject.h"

@interface TNTDevice : TNTServiceObject

@property (readonly, atomic) BOOL online;

- (id)initWithResourceId:(NSUInteger)resourceId
               createdAt:(NSDate *)createdAt
               updatedAt:(NSDate *)updatedAt
                  online:(BOOL)online;

@end
