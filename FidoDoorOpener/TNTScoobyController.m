//
//  TNTScoobyController.m
//  FidoDoorOpener
//
//  Created by Joe Selvik on 4/11/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTScoobyController.h"

@interface TNTScoobyController ()

//@property (strong, nonatomic) NSURLSession *session;

@end


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
    NSLog(@"Initializing Scooby Controller");
    
    _scoobyURL = [NSURL URLWithString:@"https://localhost:8000/users/"];
    
    // NSSession Config
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    // Set additional config settings here
    [sessionConfig setHTTPAdditionalHeaders:@{@"Content-Type": @"application/json"}];
    
    _session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];
    
}

- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler
{
    completionHandler(NSURLSessionAuthChallengeUseCredential, [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust]);
}







@end
