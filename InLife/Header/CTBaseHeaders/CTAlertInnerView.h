//
//  CTAlertInnerView.h
//  CTBase
//
//  Created by Blacknight on 15-5-21.
//  Copyright (c) 2015年 cattsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTAlertInnerView : UIView

@property (unsafe_unretained, nonatomic) IBOutlet UILabel *titleLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *messageLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UIView *bodyView;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *cancleButton;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *okButton;
@property (weak, nonatomic) IBOutlet UIView *buttonView;
@property (weak, nonatomic) IBOutlet UIView *buttonSplitView;

@end
