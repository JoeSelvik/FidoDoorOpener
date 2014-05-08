//
//  TNTUser.h
//  FidoDoorOpener
//
//  Created by Joe Selvik on 5/8/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTServiceObject.h"

@interface TNTUser : TNTServiceObject

@property (strong, nonatomic) UIImage *photo;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *fullName;
@property (assign, atomic) BOOL admin;

- (id)initWithResourceId:(NSUInteger)resourceId
               createdAt:(NSDate *)createdAt
               updatedAt:(NSDate *)updatedAt
                   photo:(UIImage *)photo
                   email:(NSString *)email
                password:(NSString *)password
                fullName:(NSString *)fullName
                   admin:(BOOL)admin;

@end

