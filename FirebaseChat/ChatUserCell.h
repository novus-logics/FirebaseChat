//
//  ChatUserCell.h
//  FirebaseChat
//
//  Created by Novus Logics on 2/16/17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;

@protocol ChatEditingDelegate <NSObject>
- (void)removeUserFromChat:(User*)user;
@end

@interface ChatUserCell : UITableViewCell
- (void)setupCellForUser:(User*)user andDelegate:(id<ChatEditingDelegate>)delegate;
@end

