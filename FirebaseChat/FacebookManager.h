//
//  FacebookManager.h
//  FirebaseChat
//
//  Created by Novus Logics on 24.01.17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SocialAuthenticationModel;

typedef void (^SuccessLoginFB)(BOOL status, NSError* error);


@interface FacebookManager : NSObject

+(FacebookManager*) sharedManager;
- (void)loginToFacebook :(SuccessLoginFB) successBlock;

@end
