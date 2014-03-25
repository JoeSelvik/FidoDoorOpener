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

- (IBAction)signupButton:(id)sender {
    // send stuff to Scooby!
}
@end
