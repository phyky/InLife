//
//  CTNavView.h
//  CTBase
//
//  Created by wenrisheng on 16/1/11.
//  Copyright © 2016年 cattsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTNavView : UIView
@property (weak, nonatomic) IBOutlet UIButton *backBut;
@property (weak, nonatomic) IBOutlet UIButton *rightBut;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightButWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightButWHAspectConstraint;

@end
