//
//  TNTZone.h
//  FidoDoorOpener
//
//  Created by Joe Selvik on 5/8/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTServiceObject.h"

@interface TNTZone : TNTServiceObject

@property (strong, nonatomic) NSString *shortCode;
@property (strong, nonatomic) NSString *name;
@property (strong, atomic) NSArray *devices;

- (id)initWithResourceId:(NSUInteger)resourceId
               createdAt:(NSDate *)createdAt
               updatedAt:(NSDate *)updatedAt
               shortCode:(NSString *)shortCode
                    name:(NSString *)name
                 devices:(NSArray *)devices;

@end
