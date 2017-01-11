//
//  PHYTabBarViewController.m
//  APPTest
//
//  Created by pang on 16/11/22.
//  Copyright © 2016年 gdcattsoft. All rights reserved.
//

#import "PHYTabBarViewController.h"
#import "PHYCommonMacro.h"

@interface PHYTabBarViewController ()
@property(nonatomic, strong) UIView *controllerView;
@end

@implementation PHYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tabBar];
    NSMutableArray *array = [self taBarItemEntities];
    self.tabBar.itemEntities = array;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - init
-(NSMutableArray *)taBarItemEntities{
    NSMutableArray *itemEntities = [NSMutableArray array];
    
    PHYTabBarEntity *item0 = [[PHYTabBarEntity alloc]init];
    item0.index = 0;
    item0.isSelected = YES;
    item0.title = @"语录";
    item0.normalImg = @"tab_首页";
    item0.selectedImg=@"tab_首页_pressed";
    item0.controllerName=@"ILHomeViewController";
    item0.normalTitleColor = [UIColor darkGrayColor];
    item0.selectedTitleColor = [UIColor redColor];
    [itemEntities addObject:item0];
    
//    PHYTabBarEntity *item1 = [[PHYTabBarEntity alloc]init];
//    item1.index = 1;
//    item1.isSelected = NO;
//    item1.title = @"每日一文";
//    item1.normalImg = @"tab_分类";
//    item1.selectedImg=@"tab_分类_pressed";
//    item1.controllerName=@"ILSortViewController";
//    item1.normalTitleColor = [UIColor darkGrayColor];
//    item1.selectedTitleColor = [UIColor redColor];
//    [itemEntities addObject:item1];
    
    PHYTabBarEntity *item2 = [[PHYTabBarEntity alloc]init];
    item2.index = 2;
    item2.isSelected = NO;
    item2.title = @"我的";
    item2.normalImg = @"tab_我的";
    item2.selectedImg=@"tab_我的_pressed";
    item2.controllerName=@"ILPersonalViewController";
    item2.normalTitleColor = [UIColor darkGrayColor];
    item2.selectedTitleColor = [UIColor redColor];
    [itemEntities addObject:item2];
    return itemEntities;
}

#pragma mark - Setter&Getter

- (UIView *)controllerView{
    if (_controllerView == nil) {
        _controllerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height)];//BOTTOM_BAR_HEIGHT(正常使用下需要减去tabbar高度)
        [self.view addSubview:_controllerView];
    }
    return  _controllerView;
}

-(PHYTabBar *)tabBar{
    if (!_tabBar) {
        _tabBar = [[PHYTabBar alloc]initWithFrame:CGRectMake(0, SCREEN_H_NO_STATUS-BOTTOM_BAR_HEIGHT-Default_Height, SCREEN_W, BOTTOM_BAR_HEIGHT) delegate:self controllerView:self.controllerView];
    }
    return _tabBar;
}


//点击tab事件
- (void)selectedItemAction:(PHYTabBarEntity *)selectedEntity{
    UIViewController *selectedController = nil;
    for(UIViewController *subController in self.childViewControllers){
        if(subController.view.tag==selectedEntity.index){
            selectedController = subController;
            //            break;
        } else {
            [subController.view removeFromSuperview];
        }
    }
    if(selectedController==nil){
        selectedController = [[NSClassFromString(selectedEntity.controllerName) alloc] init];
        selectedController.view.tag=selectedEntity.index;
        [self addChildViewController:selectedController];
    }
    [selectedController.view setFrame:self.controllerView.bounds];
    [self.controllerView addSubview:selectedController.view];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
@end
