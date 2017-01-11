//
//  PersonalCell.m
//  InLife
//
//  Created by pang on 16/11/30.
//  Copyright © 2016年 physoft. All rights reserved.
//

#import "PersonalCell.h"

@interface PersonalCell ()
@property (nonatomic,strong) UIView *line;
@end

@implementation PersonalCell

- (void)awakeFromNib {
    // Initialization code
//    [self addSubview:self.line];
}

-(UIView *)line{
    if (!_line) {
        _line = [[UIView alloc]initWithFrame:CGRectMake(10, self.heightv -1, self.widthv-10*2, 1)];
        _line.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.45];
    }
    return _line;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
