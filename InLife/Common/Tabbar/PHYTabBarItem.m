//
//  PHYTabBarItem.m
//  APPTest
//
//  Created by pang on 16/11/22.
//  Copyright © 2016年 gdcattsoft. All rights reserved.
//

#import "PHYTabBarItem.h"
#define item_width 26

@implementation PHYTabBarItem

- (id)initWithFrame:(CGRect)frame entity:(PHYTabBarEntity *)entity delegate:(id)delegate{
    self = [super initWithFrame:frame];
    if (self) {
        self.entity = entity;
        self.delegate = delegate;
        self.itemIcon = [[UIButton alloc]initWithFrame:CGRectMake((frame.size.width-item_width)/2, 3, item_width, item_width)];
        [self.itemIcon setImage:[UIImage imageNamed:entity.normalImg] forState:UIControlStateNormal];
        [self.itemIcon setImage:[UIImage imageNamed:entity.selectedImg] forState:UIControlStateSelected];
        [self addSubview:self.itemIcon];
        
        self.itemTitle = [[UIButton alloc]initWithFrame:CGRectMake(0, self.itemIcon.frame.size.height+self.itemIcon.frame.origin.y+4, frame.size.width, 10)];
        [self.itemTitle.titleLabel setFont:[UIFont systemFontOfSize:13]];
        [self.itemTitle setTitle:entity.title forState:UIControlStateNormal];
        [self.itemTitle setTitleColor:entity.normalTitleColor forState:UIControlStateNormal];
        
        [self.itemTitle setTitleColor:entity.selectedTitleColor forState:UIControlStateSelected];
        [self addSubview:self.itemTitle];
        
//        [self setImage:[UIImage imageNamed:entity.normalImg] forState:UIControlStateNormal];
//        [self setImage:[UIImage imageNamed:entity.selectedImg] forState:UIControlStateSelected];
        
        [self addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.itemIcon addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.itemTitle addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)clickAction:(UIButton *)button{
    if([self.delegate respondsToSelector:@selector(selectedItemAction:)]){
        [self.delegate selectedItemAction:self.entity];
    }
}

//更新tabbar的选中状态
-(void)updateTabBarItemState:(BOOL)state{
    [self setSelected:state];
    [self.itemIcon setSelected:state];
    [self.itemTitle setSelected:state];
}

@end
