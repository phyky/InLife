//
//  PopPasswordView.h
//  PasswordInputTest
//
//  Created by pang on 16/11/11.
//  Copyright © 2016年 gdcattsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTPasswordView.h"
typedef void(^PopCallback)(NSString* popPassword);

@interface PopPasswordView : UIView
@property(nonatomic, strong)PopCallback popCallback;

+(void)showInView:(UIView*)view andCallback:(PopCallback)callback;

@end
