//
//  TNTZoneHeaderView.h
//  FidoDoorOpener
//
//  Created by Joe Selvik on 5/8/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TNTZoneHeaderView : UICollectionReusableView

-(void)setZoneText:(NSString *)text;
-(void)setZoneInitials:(NSString *)text;
-(void)setZoneImage:(UIImage *)img;

@end
