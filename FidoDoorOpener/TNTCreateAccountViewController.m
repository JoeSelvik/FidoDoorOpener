//
//  TNTCreateAccountViewController.m
//  FidoDoorOpener
//
//  Created by Joe Selvik on 3/25/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTCreateAccountViewController.h"
#import "TNTScoobyController.h"

@interface TNTCreateAccountViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameInput;
@property (weak, nonatomic) IBOutlet UITextField *passwordInput;
@property (weak, nonatomic) IBOutlet UITextField *fullnameInput;
@property (weak, nonatomic) IBOutlet UITextField *emailInput;

- (IBAction)signupButton:(id)sender;

@end

@implementation TNTCreateAccountViewController

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

#pragma mark - Button Actions

// When the 'Sign Up' button is pressed send a request to Scooby to create a new User
- (IBAction)signupButton:(id)sender
{
    // Make sure all text fields have valid input
    if (![self validateUsernameInput] || ![self validatePasswordInput] || ![self validateFullnameInput] || ![self validateEmailInput]) {
        // Show an alert prompting user to fill all fields
        [[[UIAlertView alloc] initWithTitle:@"Error"
                                    message:@"Please enter something in each text field."
                                   delegate:nil
                          cancelButtonTitle:@"Close"
                          otherButtonTitles: nil] show];
        return;
    }
    
    // Put text from text fields into a dictionary
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              self.usernameInput.text, @"username",
                              self.passwordInput.text, @"password",
                              self.fullnameInput.text, @"full_name",
                              self.emailInput.text, @"email",
                              nil];
    
    NSString *jsonString;
    NSError *jsonError;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:userInfo options:NSJSONWritingPrettyPrinted error:&jsonError];
    
    if (!jsonData) {
        NSLog(@"Got a jsonError: %@", jsonError);
    } else {
        // TODO - check which encoding to use
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    
    // Send jsonString to Scooby and display the response in the NSLog
    TNTScoobyController *sc = [TNTScoobyController sharedInstance];
    
    NSURL *createUserURL = [NSURL URLWithString:@"users/" relativeToURL:sc.scoobyURL];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:createUserURL];
    [request setHTTPMethod:@"POST"];
    
    NSURLSessionUploadTask *uploadTask = [sc.session uploadTaskWithRequest:request
                                                                  fromData:jsonData
                                                         completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                             NSHTTPURLResponse *resp = (NSHTTPURLResponse*) response;
                                                             
                                                             if (!error && resp.statusCode == 201) {
                                                                 NSLog(@"Created a user!");
                                                                 NSLog(@"Code: %ld", (long)resp.statusCode);
                                                                 NSLog(@"Cookies[%lu]: %@", (unsigned long)[[sc.cookieJar cookies] count], [sc.cookieJar cookies]);
                                                                 
                                                                 dispatch_async(dispatch_get_main_queue(), ^{
                                                                     [self.navigationController popToRootViewControllerAnimated:TRUE];
                                                                 });
                                                                 
                                                             } else {
                                                                 NSLog(@"Failed creating a user, error: %@", error);
                                                                 NSLog(@"Code: %ld", (long)resp.statusCode);
                                                                 
                                                                 dispatch_async(dispatch_get_main_queue(), ^{
                                                                     [[[UIAlertView alloc] initWithTitle:@"Error"
                                                                                                 message:@"Could not create a new User."
                                                                                                delegate:nil
                                                                                       cancelButtonTitle:@"Close"
                                                                                       otherButtonTitles: nil] show];
                                                                 });
                                                            }
                                                             
                                            }];
    
    [uploadTask resume];
}

#pragma mark - Validation Methods

- (BOOL)validateUsernameInput
{
    return [self.usernameInput.text length];
}

- (BOOL)validatePasswordInput
{
    return [self.passwordInput.text length];
}

- (BOOL)validateFullnameInput
{
    return [self.fullnameInput.text length];
}

- (BOOL)validateEmailInput
{
    return [self.emailInput.text length];
}

@end
