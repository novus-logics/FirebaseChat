//
//  NewProfileVC.h
//  FirebaseChat
//
//  Created by Novus Logics on 3/13/17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface NewProfileVC : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (void)setupOwnProfile;
- (void)setupProfileForUser:(User *)user;

@end
