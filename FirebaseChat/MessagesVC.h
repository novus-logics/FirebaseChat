//
//  MessagesVC.h
//  FirebaseChat
//
//  Created by Novus Logics on 07.02.17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSQMessagesViewController/JSQMessages.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@class User,Chat;

@interface MessagesVC : JSQMessagesViewController

@property (strong, nonatomic) User *anotherUser;
@property (strong, nonatomic) Chat *chat;

@end


