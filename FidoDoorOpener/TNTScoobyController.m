//
//  TNTScoobyController.m
//  FidoDoorOpener
//
//  Created by Joe Selvik on 4/11/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTScoobyController.h"

@interface TNTScoobyController ()

@property (strong, nonatomic) NSUserDefaults *defaults;

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
    
    //_scoobyURL = [NSURL URLWithString:@"http://localhost:8000/"];
    _scoobyURL = [NSURL URLWithString:@"https://fido-api.thenewtricks.com/latest/"];
    //_scoobyURL = [NSURL URLWithString:@"https://fido--api-thenewtricks-com-qe9xiek2q8fp.runscope.net/latest"];
    
    // NSSession Config
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    // Set additional config settings here
    [sessionConfig setHTTPAdditionalHeaders:@{@"Content-Type": @"application/json"}];
    
    _session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];
    
    _cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];
    
    // Set up phone defaults
    _defaults = [NSUserDefaults standardUserDefaults];
}

// TODO - handle this properly
- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *credential))completionHandler
{
    completionHandler(NSURLSessionAuthChallengeUseCredential, [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust]);
}


#pragma mark - Sessions

- (void)setUsername:(NSString *)username
{
    [self.defaults setObject:username forKey:@"username"];
}

- (void)setSessionId:(NSString *)sessionId
{
    [self.defaults setObject:sessionId forKey:@"sessionId"];
}

- (void)removeUsername
{
    [self.defaults removeObjectForKey:@"username"];
}

- (void)removeSessionId
{
    [self.defaults removeObjectForKey:@"sessionId"];
}


#pragma mark - User Information

- (NSString *)username
{
    return [self.defaults stringForKey:@"username"];
}

- (NSString *)sessionId
{
    return [self.defaults stringForKey:@"sessionId"];
}


@end
