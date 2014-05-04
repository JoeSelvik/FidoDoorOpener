//
//  TNTSignInViewController.h
//  FidoDoorOpener
//
//  Created by Joe Selvik on 4/15/14.
//  Copyright (c) 2014 Joe Selvik. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TNTSignInDelegate;


@interface TNTSignInViewController : UIViewController

@property (nonatomic) id<TNTSignInDelegate> delegate;

@end


@protocol TNTSignInDelegate <NSObject>

- (void)setMyNameLabel:(NSString *)username;

@end
