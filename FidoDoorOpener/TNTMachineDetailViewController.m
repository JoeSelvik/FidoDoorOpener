//
//  TNTMachineDetailViewController.m
//  FidoDoorOpener
//
//  Created by Joe Selvik on 5/8/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTFeryController.h"
#import "TNTMachineDetailHeaderCell.h"
#import "TNTMachineDetailViewController.h"

@interface TNTMachineDetailViewController ()

@property (strong, nonatomic) TNTFeryController *fery;

@end

@implementation TNTMachineDetailViewController

- (void)configure
{
    _fery = [TNTFeryController sharedInstance];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        [self configure];
    }
    return self;
}

- (void)awakeFromNib
{
    [self configure];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // This makes sure nothing goes underneith the nav bar
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)setMachineHeaderImage:(TNTMachineType)machineType
{
    switch (machineType){
        case TNTMachineTypeBandSaw:{
            return @"BandSaw";
        }
        case TNTMachineTypeDrillPress: {
            return @"DrillPress";
        }
        case TNTMachineTypeTableSaw: {
            return @"TableSaw";
        }
        case TNTMachineTypeWoodLathe:
        case TNTMachineTypeTableRouter:
        case TNTMachineTypeMiterSaw:
        default: {
            return @"Doge";
        }
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TNTUser *user = [self.fery currentUser];
    //Check if user is admin
    if (user.admin) {
        //if admin, there will be 5 rows (picture+buttons, grant access, grant temp access, status, report problem)
        return 5;
    }
    else {
        //Check for access
        //if you have access, there will be 3 (picture+buttons, status, report problem)
        if (YES) return 3; //no variable in existence yet
        //if no access, there will be 5 rows (picture+buttons, request access, request temp access, status, report problem)
        else return 5;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell...
    NSInteger row = indexPath.row;
    TNTUser *user = [self.fery currentUser];
    //Check if admin
    if (user.admin) {
        switch(row) {
            case 0:{
                //Add machine picture to MachineHeaderCell
                NSString *CellIdentifier = @"MachineHeaderCell";
                TNTMachineDetailHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                //Need to find which machine was selected and grab correct picture
                NSString *imageName = [self setMachineHeaderImage:self.machine.type];
                cell.machineDetailImage.image = [UIImage imageNamed:imageName];
                return cell;
            }
                
            case 1:{
                //fill AccessCell with "Grant Access"
                NSString *CellIdentifier = @"AccessCell";
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                cell.textLabel.text = @"Grant Access";
                return cell;
            }
                
            case 2:{
                //fill TempAccessCell with "Grant Temporary Access"
                NSString *CellIdentifier = @"TempAccessCell";
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                cell.textLabel.text = @"Grant Temporary Access";
                return cell;
            }
                
            case 3:{
                //fill StatusCell with machine status
                NSString *CellIdentifier = @"StatusCell";
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                //Find machine status and current user if necessary
                cell.textLabel.text = @"Status goes here";
                return cell;
            }
                
            case 4:{
                //fill ReportProblemCell with "Report Problem"
                NSString *CellIdentifier = @"ReportProblemCell";
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                cell.textLabel.text = @"Report Problem";
                return cell;
            }
            default:
                
                break;
        }
    }
    
    else{
        //check to see if the currentn user has access to the current machine
        if(YES){ //no variable in existence
            //if access:
            switch(row) {
                case 0:{
                    //Add machine picture to MachineHeaderCell
                    NSString *CellIdentifier = @"MachineHeaderCell";
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                    cell.textLabel.text = @"Picture here with buttons";
                    cell.imageView.image = [UIImage imageNamed:@"doge"];
                    return cell;
                }
                    //fill StatusCell with machine status
                case 1:{
                    NSString *CellIdentifier = @"StatusCell";
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                    cell.textLabel.text =@"Status goes here";
                    return cell;
                }
                    //fill ReportProblemCell with "Report Problem"
                case 2:{
                    NSString *CellIdentifier = @"ReportProblemCell";
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                    cell.textLabel.text = @"Report Problem";
                    return cell;
                }
                default:
                    break;
            }
        }
        
        else {
            //if no access:
            switch(row) {
                case 0:{
                    //Add machine picture to MachineHeaderCell
                    NSString *CellIdentifier = @"MachineHeaderCell";
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                    cell.textLabel.text = @"Picture + buttons here";
                    //Generate image for header cell
                    cell.imageView.image = [UIImage imageNamed:@"doge"];
                    
                    return cell;
                }
                    
                case 1:{
                    //fill AccessCell with "Request Access"
                    NSString *CellIdentifier = @"AccessCell";
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                    cell.textLabel.text = @"Request Access";
                    return cell;
                }
                    
                case 2:{
                    //fill TempAccessCell with "Request Temporary Access"
                    NSString *CellIdentifier = @"TempAccessCell";
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                    cell.textLabel.text = @"Request Temporary Access";
                    return cell;
                }
                    
                case 3:{
                    //fill StatusCell with machine status
                    NSString *CellIdentifier = @"StatusCell";
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                    //Find machine status and current user if necessary
                    cell.textLabel.text = @"Status is here";
                    return cell;
                }
                    
                case 4:{
                    //fill ReportProblem with "Report Problem"
                    NSString *CellIdentifier = @"ReportProblemCell";
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
                    cell.textLabel.text = @"Report Problem";
                    return cell;
                }
                    
                default:
                    break;
            }
        }
    }
    
    NSString *CellIdentifier = @"ReportProblemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = @"Error populating cells";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Set the row height for the top row to 300, the rest should be 44
    if (indexPath.row == 0)
        return 300.0;
    else
        return 44.0;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
