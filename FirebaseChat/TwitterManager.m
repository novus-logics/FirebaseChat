//
//  TwitterManager.m
//  FirebaseChat
//
//  Created by Novus Logics on 17/05/17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import "TwitterManager.h"

@class TWTRAPIClient;
@import FirebaseAuth;
#import "FIRServerManager.h"
#import "User.h"

#import "constants.h"

@implementation TwitterManager

+(TwitterManager*) sharedManager
{
    static TwitterManager* manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[TwitterManager alloc]init];
    });
    
    return  manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (void)loginToTwitter:(SuccessLoginTW)successBlock
{
    [[Twitter sharedInstance] logInWithCompletion:^(TWTRSession * _Nullable session, NSError * _Nullable error) {
        if (session) {
            FIRAuthCredential *credential = [FIRTwitterAuthProvider credentialWithToken:session.authToken secret:session.authTokenSecret];
            [self successfulAuth:credential andUserID:session.userID successBlock:successBlock];
        }else {
            dispatch_async(dispatch_get_main_queue(), ^{
                successBlock(NO,error);
            });
        }
                
    }];
}

- (void)successfulAuth:(FIRAuthCredential*)credential andUserID:(NSString *)userID successBlock:(SuccessLoginTW)successBlock {
    
    [[FIRServerManager sharedManager] socialAuthWithCredential:credential successBlock:^(BOOL status, NSError *error) {
        if (status && !error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                successBlock(status,error);
            });
        }
        else {
            [self getTwitterInfoAndRegistration:credential andUserID:userID successBlock:successBlock];
        }
    }];
}

- (void)getTwitterInfoAndRegistration:(FIRAuthCredential*)credential andUserID:(NSString *)userID successBlock:(SuccessLoginTW)successBlock {
    
    TWTRAPIClient *client = [[TWTRAPIClient alloc] init];
    [client loadUserWithID:userID completion:^(TWTRUser *user, NSError *error) {
        if (user) {
            User *user1 = [self createUserWithResult:user];
            [[FIRServerManager sharedManager] sociaRegistrationUser:user1 withCredential:credential successBlock:successBlock];
        }
    }];
}

- (User*)createUserWithResult:(TWTRUser *)result {
    
    NSArray *arrName = [result.name componentsSeparatedByString:@" "];
    NSString *firstName;
    NSString *lastName;
    if (arrName.count > 1) {
        firstName = [arrName objectAtIndex:0];
        lastName =  [arrName objectAtIndex:1];
    }else
        firstName = [arrName objectAtIndex:0];
    
    if (lastName.length == 0 && firstName.length == 0)
        firstName = result.screenName;

    NSString *idString = result.userID;
    
    //get tw picture
    NSString *imageURL = result.profileImageURL;
    
    User *user = [[User alloc] init];
    user.name = firstName;
    user.lastName = lastName;
    user.sex = NOSET;
    user.photo = imageURL;
    user.social = @{SOCIAL_NETWORK_ID[TW]:idString};
    
    return user;
}

@end
