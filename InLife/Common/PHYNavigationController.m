//
//  PHYNavigationController.m
//  APPTest
//
//  Created by pang on 16/11/22.
//  Copyright © 2016年 gdcattsoft. All rights reserved.
//

#import "PHYNavigationController.h"

@implementation PHYNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])){
        [self openInteractivePopGestureRecognizer];
    }
    return self;
}

- (id)initWithRootViewController:(UIViewController *)rootViewController{
    if ((self = [super initWithRootViewController:rootViewController])){
        [self openInteractivePopGestureRecognizer];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationBarHidden = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods


/**
 * Custom initialization
 * 在naviVC中统一处理栈中各个vc是否支持滑动返回的情况
 * 当前仅最底层的vc关闭滑动返回
 */
- (void)openInteractivePopGestureRecognizer{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7){
        UIGestureRecognizer *interactivePopGestureRecognizer = [self performSelector:@selector(interactivePopGestureRecognizer)];
        interactivePopGestureRecognizer.delegate = self;
    }
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.viewControllers.count == 1){//关闭主界面的右滑返回
        return NO;
    }else{
        return YES;
    }
}

// 解决手势会跟tableview和scrollview冲突问题 begin
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return [gestureRecognizer isKindOfClass:NSClassFromString(@"UIScreenEdgePanGestureRecognizer")];
}

@end
