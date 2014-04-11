//
//  TNTScoobyController.m
//  FidoDoorOpener
//
//  Created by Joe Selvik on 4/11/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTScoobyController.h"

@implementation TNTScoobyController

+ (TNTScoobyController *)sharedInstance
{
    static TNTScoobyController *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[TNTScoobyController alloc] init];
    });
    
    return _sharedInstance;
}


// Called when user sign into the app for the first time
- (void)initScoobyCommunication
{
    // NSSession Config
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];
}

@end
