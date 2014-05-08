//
//  TNTHGViewController.m
//  FidoDoorOpener
//
//  Created by Joe Selvik on 5/8/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTHGViewController.h"

@interface TNTHGViewController ()

@end

@implementation TNTHGViewController

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

@end



























//
//  TNTHGViewController.m
//  Fido
//
//  Created by Joe Selvik on 11/16/13.
//  Copyright (c) 2013 The New Tricks. All rights reserved.
//

//#import "TNTHGViewController.h"
//#import "TNTZoneHeaderView.h"
//#import "TNTDeviceCell.h"
//#import "TNTServiceController.h"
//#import "TNTMachineDetailViewController.h"
//
//@interface TNTHGViewController () <UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
//
//// Data structures
//@property(nonatomic, strong) NSMutableDictionary *devices;
//@property(nonatomic, strong) NSMutableArray *zones;
//
//// Collection View outlet
//@property(nonatomic, weak) IBOutlet UICollectionView *collectionView;
//
//@property (strong, nonatomic) TNTServiceController *fery;
//
//@end
//
//
//@implementation TNTHGViewController
//
//
//- (void)configure
//{
//    _fery = [TNTServiceController sharedInstance];
//}
//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//        [self configure];
//    }
//    return self;
//}
//
//// Loaded from the storyboard
//- (void)awakeFromNib
//{
//    [self configure];
//}
//
//// Do any additional setup after loading the view.
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    
//    
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//
//// This is a hack - deal with it, match with the equivilent in TNTMachineType
//- (NSString *)setMachineHeaderImage:(TNTMachineType)machineType
//{
//    switch (machineType){
//        case TNTMachineTypeBandSaw:{
//            return @"BandSaw";
//        }
//        case TNTMachineTypeDrillPress: {
//            return @"DrillPress";
//        }
//        case TNTMachineTypeTableSaw: {
//            return @"TableSaw";
//        }
//        case TNTMachineTypeWoodLathe:
//        case TNTMachineTypeTableRouter:
//        case TNTMachineTypeMiterSaw:
//        default: {
//            return @"Doge";
//        }
//    }
//}
//
//
//#pragma mark - UICollectionView Datasource
//// 1 - Returns number of device cells
//- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
//    TNTZone *zone = [self.fery zones][section];
//    NSArray *devices = zone.devices;
//    
//    return [devices count];
//}
//
//// 2 - Returns the number of zones
//- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
//    NSArray *zones = [self.fery zones];
//    
//    return [zones count];
//}
//
//// 3 - Returns a cell with the specified index path number
//- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    // Create cell instance
//    TNTDeviceCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"DeviceCell" forIndexPath:indexPath];
//    
//    // Get the data from the fery
//    TNTZone *zone = [self.fery zones][indexPath.section];
//    TNTMachine *device = zone.devices[indexPath.row];
//    
//    // Get the device's image and load it into the device image
//    NSString *imageName = [self setMachineHeaderImage:device.type];
//    UIImage *img = [UIImage imageNamed:imageName];
//    [cell setDeviceImage:img];
//    
//    // Set the device name
//    [cell setDeviceText:device.name];
//    
//    return cell;
//}
//
//// 4 - Returns either the header or footer view of searches
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    // Create ZoneHeaderView instance
//    TNTZoneHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ZoneHeaderView" forIndexPath:indexPath];
//    
//    // Get the zone from the fery
//    TNTZone *zone = [self.fery zones][indexPath.section];
//    
//    // Set the zone image
//    UIImage *headerimg1 = [UIImage imageNamed:@"gg.png"];
//    [headerView setZoneImage:headerimg1];
//    
//    // Set the zone name
//    [headerView setZoneText:zone.name];
//    [headerView setZoneInitials:zone.shortCode];
//    
//    return headerView;
//}
//
//
//
//#pragma mark - UICollectionViewDelegate
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}
//
//- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
//    // TODO: Deselect item
//}
//
//
//#pragma mark – UICollectionViewDelegateFlowLayout
//// These are delegate methods for UICollectionViewFlowLayout
//
//
//
//
////#pragma mark - Segue
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    TNTDeviceCell *cell = (TNTDeviceCell *)sender;
//    NSIndexPath *path = [self.collectionView indexPathForCell:cell];
//    
//    if ([segue.identifier isEqualToString:@"ShowDevice"]) {
//        TNTMachineDetailViewController *machineDetailViewController = segue.destinationViewController;
//        TNTZone *zone = [self.fery zones][path.section];
//        TNTMachine *device = zone.devices[path.row];
//        
//        machineDetailViewController.machine = device;
//        machineDetailViewController.title = device.name;
//        
//    }
//}
//
//
//@end
//
//
//
//
//



