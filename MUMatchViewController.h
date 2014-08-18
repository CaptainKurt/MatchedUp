//
//  MUMatchViewController.h
//  MatchedUp
//
//  Created by Kurt Walker on 8/16/14.
//  Copyright (c) 2014 Matched Up. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MUMatchViewControllerDelegate <NSObject>

- (void)presentMatchesViewController;

@end

@interface MUMatchViewController : UIViewController

@property (strong, nonatomic) UIImage *matchedUserImage;
@property (weak) id <MUMatchViewControllerDelegate> delegate;

@end
