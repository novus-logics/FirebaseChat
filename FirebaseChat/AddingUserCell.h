//
//  ChatUsersCell.h
//  FirebaseChat
//
//  Created by Novus Logics on 2/20/17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;

@interface AddingUserCell : UITableViewCell
- (void)setupCellForUser:(User*)userModel;

@end
