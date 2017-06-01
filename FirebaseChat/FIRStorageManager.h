//
//  FIRStorageManager.h
//  FirebaseChat
//
//  Created by Novus Logics on 16.02.17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>



@class UIImage;

@interface FIRStorageManager : NSObject

+(FIRStorageManager*) sharedManager;

- (void)loadMediaMessage: (NSString*) imageName
             successBlock:(void (^)(UIImage* image))successBlock;

- (void)saveMediaMessage: (UIImage*)photo
                 withName: (NSString*)name
             successBlock:(void (^)(BOOL))successBlock;

- (void)saveVideoMessage: (NSURL*)urlVideo
                withName: (NSString*)name
            successBlock:(void (^)(NSString *url, NSError *error))successBlock;

//- (void)deleteImage: (NSString*)name
//        successBlock:(void (^)(BOOL status))successBlock;

//- (void)saveProfileImage:(UIImage*)image
//                withName:(NSString*)name
//            successBlock:(void (^)(BOOL status, NSError *error))successBlock;

//- (void)loadProfileImage:(NSString*)imageName
//            successBlock:(void (^)(UIImage* image))successBlock;


@end
