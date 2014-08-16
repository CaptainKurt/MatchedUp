//
//  MUTestUser.m
//  MatchedUp
//
//  Created by Kurt Walker on 8/16/14.
//  Copyright (c) 2014 Matched Up. All rights reserved.
//

#import "MUTestUser.h"

@implementation MUTestUser

+ (void)saveTestUserToParse
{
    PFUser *newUser = [PFUser user];
    newUser.username = @"user1";
    newUser.password = @"password1";
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSDictionary *profile = @{@"age"        : @28,
                                      @"birthday"   :@"11/22/1985",
                                      @"firstName"  : @"Julie",
                                      @"gender"     : @"female",
                                      @"location"   : @"Berlin, Germany",
                                      @"name"       : @"Julie Adams"
                                      };
            [newUser setObject:profile forKey:@"profile"];
            [newUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                UIImage *profileImage = [UIImage imageNamed:@"ProfileImage1.png"];
                NSData *imageData = UIImageJPEGRepresentation(profileImage, 0.8);
                PFFile *photoFile = [PFFile fileWithData:imageData];
                [photoFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if (succeeded) {
                        PFObject *photo = [PFObject objectWithClassName:kCCPhotoClassKey];
                        [photo setObject:newUser forKey:kCCPhotoUserKey];
                        [photo setObject:photoFile forKey:kCCPhotoPictureKey];
                        [photo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                            NSLog(@"Photo saved successfully");
                        }];
                    }
                }];
            }];
        }
    }];
}

@end
