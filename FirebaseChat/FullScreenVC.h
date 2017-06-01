//
//  FullScreenVC.h
//  BreedFinder
//
//  Created by Novus Logics on 23.02.17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface FullScreenVC : UIViewController

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *name;

+ (UINavigationController*)returnFromStorybord;
- (instancetype)init NS_UNAVAILABLE;
- (void)setFullSizeImage:(UIImage *)image;
@end
