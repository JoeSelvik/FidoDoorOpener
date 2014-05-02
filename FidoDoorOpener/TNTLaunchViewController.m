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
@property (weak, nonatomic) IBOutlet UIImageView *doge;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation TNTLaunchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    TNTScoobyController *sc = [TNTScoobyController sharedInstance];
    NSLog(@"Launch VC");
    NSLog(@"User signed in with cookies[%lu]: %@", (unsigned long)[[sc.cookieJar cookies] count], [sc.cookieJar cookies]);
    NSLog(@"Username: %@, sessionId: %@", [sc username], [sc sessionId]);
    
    // Control the Doge
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dogeTapped:)];
    _doge.userInteractionEnabled = YES;
    [_doge addGestureRecognizer:tap];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dogeTapped:(UITapGestureRecognizer *) gestureRecognizer
{
    int rand = (arc4random() % 4) + 2;
    NSString *dogeName = [NSString stringWithFormat:@"doge%d.png", rand];
    
    UIImage *image = [UIImage imageNamed:dogeName];
    [self.doge setImage:image];
}


#pragma mark - Button Actions

- (IBAction)signOut:(id)sender
{
    TNTScoobyController *sc = [TNTScoobyController sharedInstance];
    NSArray *cookieJar = [sc.cookieJar cookies];
    
    if ([cookieJar count]) {
        NSLog(@"User %@ signed in with a cookie! SessionId: %@", [sc username], [sc sessionId]);
        
        // Sign out the user by deleting the cookie
        [sc.cookieJar deleteCookie:[cookieJar objectAtIndex:0]];
        NSLog(@"Deleted cookie on local phone");
        
        // Also need to sign out the user on scooby
        NSURL *deleteSessionURL = [NSURL URLWithString:@"sessions/" relativeToURL:sc.scoobyURL];
        NSURL *deleteSingleSessionURL = [NSURL URLWithString:[sc sessionId] relativeToURL:deleteSessionURL];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:deleteSingleSessionURL];
        [request setHTTPMethod:@"DELETE"];
        
        NSURLSessionTask *dataTask = [sc.session dataTaskWithRequest:request
                                                   completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                       NSHTTPURLResponse *resp = (NSHTTPURLResponse*) response;
                                                       
                                                       if (!error && resp.statusCode == 204) {
                                                           NSLog(@"Deleted session on scooby and sessionId/username from phone defaults.");
                                                           
                                                           // Get rid of the username and sessionId in the phones user defaults
                                                           [sc removeUsername];
                                                           [sc removeSessionId];
                                                           
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
        [[[UIAlertView alloc] initWithTitle:@"Error"
                                    message:@"No user signed on!"
                                   delegate:nil
                          cancelButtonTitle:@"Close"
                          otherButtonTitles: nil] show];
    }
    
    
}

@end
