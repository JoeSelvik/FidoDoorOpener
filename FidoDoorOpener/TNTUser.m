//
//  TNTUser.m
//  FidoDoorOpener
//
//  Created by Joe Selvik on 5/8/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTUser.h"

@implementation TNTUser

- (id)initWithResourceId:(NSUInteger)resourceId
               createdAt:(NSDate *)createdAt
               updatedAt:(NSDate *)updatedAt
                   photo:(UIImage *)photo
                   email:(NSString *)email
                password:(NSString *)password
                fullName:(NSString *)fullName
                   admin:(BOOL)admin
{
    if (self = [super initWithResourceId:resourceId createdAt:createdAt updatedAt:updatedAt]) {
        _photo = photo;
        _email = email;
        _password = password;
        _fullName = fullName;
        _admin = admin;
    }
    
    return self;
}

@end