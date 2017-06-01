//
//  AsyncVideoMediaItem.h
//  FirebaseChat
//
//  Created by Novus Logics on 16/05/17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import <JSQMessagesViewController/JSQMessagesViewController.h>
#import "JSQVideoMediaItem.h"

@interface AsyncVideoMediaItem : JSQVideoMediaItem

@property (nonatomic, strong) UIImageView *asyncImageView;
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) NSString *videoUrl;

- (instancetype)initWithURL:(NSString*)videoName andVideo:(NSString *)videoUrl;

@end
