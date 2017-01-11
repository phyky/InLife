//
//  WSIdentifierValidator.h
//  TestProj
//
//  Created by wrs on 15/4/23.
//  Copyright (c) 2015年 wrs. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, IdentifierType) {
    IdentifierTypeKnown = 0,
    IdentifierTypeZipCode,      //1
    IdentifierTypeEmail,        //2
    IdentifierTypePhone,        //3
    IdentifierTypeUnicomPhone,  //4
    IdentifierTypeQQ,           //5
    IdentifierTypeNumber,       //6
    IdentifierTypeString,       //7
    IdentifierTypeIdentifier,   //8
    IdentifierTypePassort,      //9
    IdentifierTypeCreditNumber, //10
    IdentifierTypeBirthday,     //11
};

@interface CTIdentifierValidator : NSObject

+ (BOOL) isValid:(IdentifierType) type value:(NSString*) value;


+ (BOOL) isValidZipcode:(NSString*)value;
+ (BOOL) isValidEmail:(NSString *)candidate;
+ (BOOL) isValidNumber:(NSString*)value;
+ (BOOL) isValidPhone:(NSString*)value;
+ (BOOL) isValidString:(NSString*)value;
+ (BOOL) isValidIdentifier:(NSString*)value;
+ (BOOL) isValidPassport:(NSString*)value;
//+ (BOOL) isValidCreditNumber:(NSString*)value;
+ (BOOL) isValidBirthday:(NSString*)birthday; // yyyyMMdd
+ (BOOL) isChinaUnicomPhoneNumber:(NSString*) phonenumber;
+ (BOOL) isValidOnlyNumberOrLetter:(NSString *)str;
//车牌号码校验
+(BOOL) isValidateCarNo:(NSString*)carNo;
@end
