//
//  AsyncVideoMediaItem.m
//  FirebaseChat
//
//  Created by Novus Logics on 16/05/17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import "AsyncVideoMediaItem.h"
#import "CloudinaryManager.h"


#import <JSQMessagesViewController/JSQMessagesMediaPlaceholderView.h>
#import "UIColor+JSQMessages.h"


@implementation JSQMessagesMediaPlaceholderView (ActivityIndicator)

+ (instancetype)viewWithAlwaysActivityIndicator {
    UIColor *lightGrayColor = [UIColor jsq_messageBubbleLightGrayColor];
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    spinner.color = [lightGrayColor jsq_colorByDarkeningColorWithValue:0.4f];
    spinner.hidesWhenStopped = NO;
    
    JSQMessagesMediaPlaceholderView *view = [[JSQMessagesMediaPlaceholderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 120.0f)
                                                                                   backgroundColor:lightGrayColor
                                                                             activityIndicatorView:spinner];
    return view;
}

@end

@implementation AsyncVideoMediaItem

- (instancetype)init
{
    return [self initWithMaskAsOutgoing:YES];
}

- (instancetype)initWithURL:(NSString*)videoName andVideo:(NSString *)videoUrl {
    self = [super init];
    if (self) {
        CGSize size = [self mediaViewDisplaySize];
        
        self.videoUrl = videoUrl;
        
        self.asyncImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        self.asyncImageView.contentMode = UIViewContentModeScaleToFill;
        self.asyncImageView.clipsToBounds = YES;
        self.asyncImageView.layer.cornerRadius = 20;
        self.asyncImageView.backgroundColor = [UIColor jsq_messageBubbleLightGrayColor];
        
        self.playButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.playButton.frame = CGRectMake(0, 0, size.width, size.height);
        self.playButton.userInteractionEnabled = NO;
        [self.playButton setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
        [self.playButton setHidden:YES];
        
        UIView *activityIndicator = [JSQMessagesMediaPlaceholderView viewWithAlwaysActivityIndicator];
        activityIndicator.frame = self.asyncImageView.frame;
        
        [self.asyncImageView addSubview:activityIndicator];
        [self.asyncImageView addSubview:self.playButton];
        
        __weak AsyncVideoMediaItem *selfWeak = self;
        __weak UIView *weakActivityIndicator = activityIndicator;
        __weak UIButton *weakPlay = _playButton;
        [[CloudinaryManager sharedManager] downloadImage:videoName completionBlock:^(UIImage *image) {
            if (image) {
                [selfWeak.asyncImageView setImage:image];
                [weakActivityIndicator removeFromSuperview];
                [weakPlay setHidden:NO];
            }
        }];
    }
    return self;
}

#pragma mark - JSQMessageMediaData protocol
- (UIView *)mediaView {
    return self.asyncImageView;
}


@end
