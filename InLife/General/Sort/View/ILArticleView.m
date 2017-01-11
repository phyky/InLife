//
//  ILArticleView.m
//  InLife
//
//  Created by pang on 16/11/25.
//  Copyright © 2016年 physoft. All rights reserved.
//

#import "ILArticleView.h"

@implementation ILArticleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.editable = NO;
        self.font = PHYFont(@"Devanagari Sangam MN", 18.0);
        self.textColor = UIColorFromRGB(0x668B8B);
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}

@end
