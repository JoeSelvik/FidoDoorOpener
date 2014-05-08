//
//  TNTZoneHeaderView.m
//  FidoDoorOpener
//
//  Created by Joe Selvik on 5/8/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import "TNTZoneHeaderView.h"

@interface TNTZoneHeaderView ()

@property (weak, nonatomic) IBOutlet UIImageView *zoneImageView;
@property (weak, nonatomic) IBOutlet UILabel *zoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *zoneInitialss;

@end


@implementation TNTZoneHeaderView

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

#pragma mark - TNTZoneHeaderView UI methods

-(void)setZoneText:(NSString *)text {
    self.zoneLabel.text = text;
}

-(void)setZoneInitials:(NSString *)text {
    self.zoneInitialss.text = text;
}

// Sets the image for a zone view
-(void)setZoneImage:(UIImage *)img {
    self.zoneImageView.image = img;
}

@end
