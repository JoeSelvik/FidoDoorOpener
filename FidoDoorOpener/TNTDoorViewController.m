//
//  TNTDoorViewController.m
//  FidoDoorOpener
//
//  Created by Joe Selvik on 5/2/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTDoorViewController.h"
#import "TNTScoobyController.h"

@interface TNTDoorViewController ()

- (IBAction)lockButtonPressed:(id)sender;
- (IBAction)unlockButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lockStatusLabel;

@end


@implementation TNTDoorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Buttons

- (IBAction)lockButtonPressed:(id)sender
{
    
}

- (IBAction)unlockButtonPressed:(id)sender
{
    TNTScoobyController *sc = [TNTScoobyController sharedInstance];
    
    // Create PUT request for Scooby
    NSURL *unlockDoorURL = [NSURL URLWithString:@"doors/1" relativeToURL:sc.scoobyURL];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:unlockDoorURL];
    [request setHTTPMethod:@"PUT"];
    
    // Create JSON data to send with PUT
    NSDictionary *unlockDoorData = [[NSDictionary alloc] initWithObjectsAndKeys:
                              @NO, @"locked",
                              nil];
    
    NSString *jsonString;
    NSError *jsonError;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:unlockDoorData options:NSJSONWritingPrettyPrinted error:&jsonError];
    
    if (!jsonData) {
        NSLog(@"Got a jsonError: %@", jsonError);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    // Send PUT request
    NSURLSessionUploadTask *uploadTask = [sc.session uploadTaskWithRequest:request
                                                                  fromData:jsonData
                                                         completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                             NSHTTPURLResponse *resp = (NSHTTPURLResponse*) response;
                                                             
                                                             if (!error && resp.statusCode == 200) {
                                                                 NSLog(@"Unlocked the door!");
                                                                 NSLog(@"Code: %ld", (long)resp.statusCode);
                                                                 
                                                                 // change text
                                                                 dispatch_async(dispatch_get_main_queue(), ^{
                                                                     self.lockStatusLabel.text = @"Unlocked";
                                                                 });
                                                                 
                                                             } else {
                                                                 NSString *errMsg = [NSString stringWithFormat:@"Could not unlock the door. Code %ld", (long)resp.statusCode];
                                                                 NSLog(errMsg);
                                                                 
                                                                 dispatch_async(dispatch_get_main_queue(), ^{
                                                                     [[[UIAlertView alloc] initWithTitle:@"Error"
                                                                                                 message:errMsg
                                                                                                delegate:nil
                                                                                       cancelButtonTitle:@"Close"
                                                                                       otherButtonTitles: nil] show];
                                                                 });
                                                             }
                                                             
                                                         }];
    
    [uploadTask resume];
}// end (IBAction)unlockButtonPressed:(id)sender




@end
