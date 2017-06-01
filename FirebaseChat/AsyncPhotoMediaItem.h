//
//  AsyncPhotoMediaItem.h
//  FirebaseChat
//
//  Created by Novus Logics on 14.02.17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSQPhotoMediaItem.h"



@interface AsyncPhotoMediaItem : JSQPhotoMediaItem

@property (nonatomic, strong) UIImageView *asyncImageView;

- (instancetype)initWithURL:(NSString*)photoName;

@end
