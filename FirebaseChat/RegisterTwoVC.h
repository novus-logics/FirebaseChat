//
//  RegisterTwoVC.h
//  FirebaseChat
//
//  Created by Novus Logics on 24.01.17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import <UIKit/UIKit.h>

@class User;

@protocol NavigationToNextPart <NSObject>

- (void)receiveUserModel:(User*)userModel;
@end


@interface RegisterTwoVC : UIViewController <NavigationToNextPart>

@end
