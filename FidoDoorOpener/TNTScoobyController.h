//
//  TNTScoobyController.h
//  FidoDoorOpener
//
//  Created by Joe Selvik on 4/11/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TNTScoobyControllerDelegate <NSObject>

@optional

@end


@interface TNTScoobyController : NSObject

@property NSURL *scoobyURLString;
@property (strong, nonatomic) NSURLSession *session;

+ (TNTScoobyController *)sharedInstance;
- (void)initScoobyCommunication;

@end
