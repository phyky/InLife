//
//  CTPasswordView.h
//  PasswordInputTest
//
//  Created by pang on 16/10/26.
//  Copyright © 2016年 gdcattsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLPasswordInputView.h"

typedef void(^PsdCallback)(NSString *password);


@interface CTPasswordView : UIView<SLPasswordInputViewDelegate>
//@property (nonatomic,strong) SLPasswordInputView *inputView;
@property (nonatomic,strong) PsdCallback callback;

/** 密码长度 */
@property (assign, nonatomic) NSUInteger passwordLength;
/** 成为第一响应 */
@property (assign, nonatomic) BOOL firstResponder;

-(instancetype)initWithFrame:(CGRect)frame callback:(PsdCallback)callback;

@end
