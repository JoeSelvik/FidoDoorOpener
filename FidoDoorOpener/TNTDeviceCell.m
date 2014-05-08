//
//  TNTDeviceCell.m
//  FidoDoorOpener
//
//  Created by Joe Selvik on 5/8/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTDeviceCell.h"

@interface TNTDeviceCell ()

@property (weak, nonatomic) IBOutlet UIImageView *deviceImageView;
@property (weak, nonatomic) IBOutlet UILabel *deviceLabel;

@end

@implementation TNTDeviceCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - Device Cell UI Methods

-(void)setDeviceText:(NSString *)text
{
    self.deviceLabel.text = text;
}

-(void)setDeviceImage:(UIImage *)img
{
    self.deviceImageView.image = img;
}


@end
