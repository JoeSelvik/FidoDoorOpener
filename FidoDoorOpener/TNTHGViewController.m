//
//  TNTHGViewController.m
//  FidoDoorOpener
//
//  Created by Joe Selvik on 5/8/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTHGViewController.h"

@interface TNTHGViewController () <UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property(nonatomic, strong) NSMutableDictionary *devices;
@property(nonatomic, strong) NSMutableArray *zones;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) TNTFeryController *fery;

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


// This is a hack - deal with it, match with the equivilent in TNTMachineType
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


#pragma mark - UICollectionViewDatasource

// 1 - Return number of device cells
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    TNTZone *zone = [self.fery zones][section];
    NSArray *devices = zone.devices;
    
    return [devices count];
}





@end




