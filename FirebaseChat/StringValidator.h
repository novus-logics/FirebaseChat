//
//  StringValidator.h
//  FirebaseChat
//
//  Created by Novus Logics on 31.01.17.
//  Copyright © 2017 Novus Logics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringValidator : NSObject
+ (BOOL)emailValidation:(NSString*)email;
+ (BOOL)passwordValidation:(NSString*)password;
+ (BOOL)nameValidation:(NSString*)name;
+ (BOOL)phoneValidator:(NSString *)phoneNumber;
+ (NSString*) checkPhoneNumberWithNewString: (NSString*) decimalString;
@end
