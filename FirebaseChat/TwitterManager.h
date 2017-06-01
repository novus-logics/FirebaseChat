//
//  TwitterManager.h
//  FirebaseChat
//
//  Created by Novus Logics on 17/05/17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TwitterKit/TwitterKit.h>
#import <TwitterKit/TWTRTimelineType.h>

typedef void (^SuccessLoginTW)(BOOL status, NSError* error);

@interface TwitterManager : NSObject

+(TwitterManager*) sharedManager;
- (void)loginToTwitter:(SuccessLoginTW)successBlock;

@end
