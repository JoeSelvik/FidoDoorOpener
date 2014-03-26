//
//  TNTCreateAccountViewController.m
//  FidoDoorOpener
//
//  Created by Joe Selvik on 3/25/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTCreateAccountViewController.h"

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
    }
    
    // Put text from text fields into a dictionary
    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                              self.usernameInput.text, @"username",
                              self.passwordInput.text, @"password",
                              self.fullnameInput.text, @"full_name",
                              self.emailInput.text, @"email",
                              nil];
    
    NSString *jsonString;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:userInfo options:NSJSONWritingPrettyPrinted error:&error];
    
    if (!jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        // TODO - check which encoding to use
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSLog(@"JSON Data: %@", jsonData);
    NSLog(@"JSON String: %@", jsonString);
    
    // Send jsonString to Scooby!
    
    // Create request
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://fido-api.thenewtricks.com/latest/users/"]];
    [req setHTTPBody:jsonData];
    [req setHTTPMethod:@"POST"];
    [req addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    //[[NSURLSession alloc] ini]
    
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

//if (![self validateUserName] || ![self validateUserPhoneNumber] || ![self validateUserX500])


@end
