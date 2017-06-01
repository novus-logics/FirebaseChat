//
//  CloudinaryManager.h
//  FirebaseChat
//
//  Created by Novus Logics on 3/27/17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIImage;


typedef void (^CompletionUploadBlock)(NSString *url, NSError *error);
typedef void (^CompletionDownloadBlock)(UIImage *image);



@interface CloudinaryManager : NSObject
+ (CloudinaryManager*)sharedManager;
- (void)uploadImage:(UIImage*)image withName:(NSString*)name completionBlock:(CompletionUploadBlock)completionBlock;
- (void)downloadImage:(NSString*)imageName completionBlock:(CompletionDownloadBlock)completionBlock;
@end
