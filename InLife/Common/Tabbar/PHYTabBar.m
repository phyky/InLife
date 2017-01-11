//
//  PHYTabBar.m
//  APPTest
//
//  Created by pang on 16/11/22.
//  Copyright © 2016年 gdcattsoft. All rights reserved.
//

#import "PHYTabBar.h"

@implementation PHYTabBar

#pragma mark - 初始化

- (id)initWithFrame:(CGRect)frame delegate:(id)delegate controllerView:(UIView *)controllerView
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = delegate;
        self.controllerView = controllerView;
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = UIColorFromRGB(0xE3E3E5).CGColor;
        self.layer.borderWidth = 0.5;
    }
    return self;
}

-(void)initItems{
    float eachWidth = self.frame.size.width/self.itemEntities.count;
    self.itemViews = [NSMutableArray arrayWithCapacity:self.itemEntities.count];
    for(int i=0;i<self.itemEntities.count;i++){
        PHYTabBarEntity *entity = [self.itemEntities objectAtIndex:i];
        float x = i*eachWidth;
        PHYTabBarItem *item = [[PHYTabBarItem alloc]initWithFrame:CGRectMake(x, 0, eachWidth, self.frame.size.height) entity:entity delegate:self];
        //下面注释掉的是初始化时全部执行子controller的生命周期函数
        UIViewController *childViewController = [[NSClassFromString(entity.controllerName) alloc] init];
        childViewController.view.tag = entity.index;
        [(id)self.delegate addChildViewController:childViewController];
        
        if(entity.index==0){
            [item updateTabBarItemState:YES];
            [[childViewController view] setFrame:self.controllerView.bounds];
            [self.controllerView addSubview:[childViewController view]];
        }else{
            [item updateTabBarItemState:NO];
        }
        [self.itemViews addObject:item];
        [self addSubview:item];
    }
}

#pragma mark - setter&getter

-(void)setBgColor:(UIColor *)bgColor{
    self.backgroundColor = bgColor;
}

-(void)setItemEntities:(NSMutableArray *)itemEntities{
    _itemEntities = itemEntities;
    [self initItems];
}


#pragma mark - PHYTabBarItem Protocol Method
- (void)selectedItemAction:(PHYTabBarEntity *)selectedEntity{
    [self cleanSelectFlag];
    selectedEntity.isSelected=YES;
    
    if([self.delegate respondsToSelector:@selector(selectedItemAction:)]){
        [self.delegate selectedItemAction:selectedEntity];
    }
    [self updateTabBarItem];
}


#pragma mark - Pubic Method

-(void)selectIndex:(NSInteger)index{
    if(index < 0 || index > self.itemEntities.count-1){
        return;
    }
    PHYTabBarEntity *entity = [self.itemEntities objectAtIndex:index];
    [self selectedItemAction:entity];
}


#pragma mark - Private Method

/**
 *  清除被选择的标识
 */
-(void)cleanSelectFlag{
    for(int i=0;i<self.itemViews.count;i++){
        PHYTabBarItem *view = [self.itemViews objectAtIndex:i];
        view.entity.isSelected=NO;
    }
}

/**
 *  更新选中item
 */
-(void)updateTabBarItem{
    for(int i=0;i<self.itemViews.count;i++){
        PHYTabBarItem *view = [self.itemViews objectAtIndex:i];
        [view updateTabBarItemState:view.entity.isSelected];
    }
}
@end
