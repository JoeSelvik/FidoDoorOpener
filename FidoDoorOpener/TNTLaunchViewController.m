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
        
    } else {
        NSLog(@"No user signed on.");
    }
    
    
}

@end
