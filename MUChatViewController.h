//
//  MUChatViewController.h
//  MatchedUp
//
//  Created by Kurt Walker on 8/16/14.
//  Copyright (c) 2014 Matched Up. All rights reserved.
//

#import "JSMessagesViewController.h"

@interface MUChatViewController : JSMessagesViewController
                <JSMessagesViewDataSource, JSMessagesViewDelegate>

@property (strong, nonatomic) PFObject *chatRoom;

@end
