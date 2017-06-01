//
//  NewProfileInfoCell.h
//  FirebaseChat
//
//  Created by Novus Logics on 3/13/17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewProfileInfoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellIcon;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
-(void)configurateInfoCell:(NSString*)model andSection:(BOOL)section;

@end
