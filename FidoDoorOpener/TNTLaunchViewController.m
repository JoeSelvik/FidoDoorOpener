//
//  TNTViewController.m
//  FidoDoorOpener
//
//  Created by Joe Selvik on 3/24/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTScoobyController.h"
#import "TNTLaunchViewController.h"

@interface TNTLaunchViewController ()

- (IBAction)signOut:(id)sender;

@end

@implementation TNTLaunchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Actions

- (IBAction)signOut:(id)sender
{
    TNTScoobyController *sc = [TNTScoobyController sharedInstance];
    
    NSArray *cookieArray = [sc.cookieJar cookiesForURL:sc.scoobyURL];
    
    if ([cookieArray count]) {
        // Sign out the user by deleting the cookie
        NSLog(@"cookies for url: %@", cookieArray);
        [sc.cookieJar deleteCookie:[cookieArray objectAtIndex:0]];
        
        NSLog(@"Deleted cookie");
        
        
        // Also need to sign out the user on scooby
        NSURL *createSessionURL = [NSURL URLWithString:@"sessions/" relativeToURL:sc.scoobyURL];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:createSessionURL];
        [request setHTTPMethod:@"DELETE"];
        
        NSURLSessionTask *dataTask = [sc.session dataTaskWithRequest:request
                                                   completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                       NSHTTPURLResponse *resp = (NSHTTPURLResponse*) response;
                          
                                                       if (!error && resp.statusCode == 204) {
                                                           NSLog(@"Deleted session on scooby");
                                                       } else {
                                                           dispatch_async(dispatch_get_main_queue(), ^{
                                                               [[[UIAlertView alloc] initWithTitle:@"Error"
                                                                                           message:@"Could not delete session on Scooby."
                                                                                          delegate:nil
                                                                                 cancelButtonTitle:@"Close"
                                                                                 otherButtonTitles: nil] show];
                                                           });
                                                       }
                          
                                                   }];
        
        [dataTask resume];
        
    } else {
        NSLog(@"No user signed on.");
    }
    
    
}

@end
