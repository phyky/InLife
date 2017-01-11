//
//  PHYBaseViewController.m
//  APPTest
//
//  Created by pang on 16/11/22.
//  Copyright © 2016年 gdcattsoft. All rights reserved.
//

#import "PHYBaseViewController.h"
#import "PHYCommonMacro.h"

@interface PHYBaseViewController ()
/**
 *  没有数据显示的View
 */
@property (nonatomic,strong) UIView *noDataView;
/**
 *  没有数据显示的image
 */
@property (nonatomic,strong) UIImageView *noDataImage;
/**
 *  没有数据的提示文字
 */
@property (nonatomic,strong) UILabel *noDataDes;
/**
 *  是否是NavigationController
 */
@property (nonatomic,assign) BOOL isNavigationController;
@end

@implementation PHYBaseViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColorFromRGB(0xF3F3F3);
    [self.view addSubview:self.naviView];
    [self.view addSubview:self.noDataView];
    self.noDataView.hidden = !self.showDescript;
    
    if(IOS7){
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.isNavigationController = self.navigationController != nil;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.isNavigationController = self.navigationController != nil;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Init Method
- (instancetype)init{
    self = [super init];
    if(self){
        self.showBackButton = YES;
        self.showTitle = YES;
        self.showRightButton = NO;
        self.showDescript = NO;
    }
    return self;
}

-(UIView *)naviView{
    if (!_naviView) {
        _naviView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, TOP_BAR_HEIGHT)];
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, TOP_BAR_HEIGHT -1, SCREEN_W, 1)];
        line.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.35];
        [_naviView addSubview:line];
        _naviView.backgroundColor = UIColorFromRGB(0xB4CDCD);
        
        if(self.showBackButton){
            UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, Default_Y+44/2-30/2, 46, 30)];
            self.backButton = backBtn;
            [backBtn setImage:[UIImage imageNamed:@"ic_back"] forState:UIControlStateNormal];
            [backBtn addTarget:self action:@selector(baseBackBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            [_naviView addSubview:backBtn];
        }else{
            [self.backButton removeFromSuperview];
        }
        
        self.rightButton = [[UIButton alloc]initWithFrame:CGRectMake(self.naviView.frame.size.width-46-8, Default_Y+44/2-30/2, 46, 30)];
        self.rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
        if (self.showRightButtonBorder) {
            self.rightButton.layer.borderColor = [UIColor whiteColor].CGColor;
            self.rightButton.layer.borderWidth = 0.7f;
            self.rightButton.layer.cornerRadius = 5;
            self.rightButton.layer.masksToBounds = YES;
        }
        [self.rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.naviView addSubview:self.rightButton];
        self.rightButton.hidden = !self.showRightButton;
        
        if(self.showTitle){
            float backBtnWidth = 0;
            float rightBtnWidth = 0;
            if (self.showBackButton) {
                backBtnWidth = self.backButton.frame.size.width;
            }
            if (self.showRightButton) {
                rightBtnWidth = self.rightButton.frame.size.width;
            }
            
            float title_x = backBtnWidth > rightBtnWidth ? backBtnWidth:rightBtnWidth;
            UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(title_x, Default_Y, SCREEN_W - title_x*2, TOP_BAR_CONTENT_HEIGHT)];
            titleLabel.font = [UIFont fontWithName:@"FZLanTingHei-L-GBK" size:20.0];
            titleLabel.text = self.title;
            self.titleLabel = titleLabel;
            titleLabel.backgroundColor = [UIColor clearColor];
            titleLabel.textAlignment = NSTextAlignmentCenter;
            titleLabel.textColor = [UIColor whiteColor];
            [_naviView addSubview:titleLabel];
        }else{
            [self.titleLabel removeFromSuperview];
        }
    }
    return _naviView;
}

-(UIView *)noDataView{
    if (!_noDataView) {
        CGFloat temp_h = SCREEN_H*0.2;
        _noDataView = [[UIView alloc]initWithFrame:CGRectMake(20, (SCREEN_H-temp_h)/2, SCREEN_W-20*2, temp_h)];
        
        CGFloat image_w = (temp_h -20)*0.75;
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(((SCREEN_W-20*2) - image_w)/2, 0, image_w, image_w)];
        self.noDataImage = image;
        self.noDataImage.image = [UIImage imageNamed:@"img_nodata"];
        
        
        self.noDataDes = [[UILabel alloc]initWithFrame:CGRectMake(0, image_w +20, SCREEN_W-20*2, temp_h - image_w -20)];
        self.noDataDes.numberOfLines = 0;
        self.noDataDes.textAlignment = NSTextAlignmentCenter;
        self.noDataDes.textColor = UIColorFromRGB(0xff4081);
        self.noDataDes.text = @"没有数据哦~ ~ ~";//默认描述
        
        [self.noDataView addSubview:self.noDataImage];
        [self.noDataView addSubview:self.noDataDes];
        self.noDataView.userInteractionEnabled = NO;
    }
    return _noDataView;
}

#pragma mark - Setter&Getter Method

-(void)setShowRightButton:(BOOL)showRightButton{
    _showRightButton = showRightButton;
    self.rightButton.hidden = !showRightButton;
}

-(void)setShowRightButtonBorder:(BOOL)showRightButtonBorder{
    _showRightButtonBorder = showRightButtonBorder;
}

-(void)setInteractivePop:(BOOL)interactivePop{
    self.navigationController.interactivePopGestureRecognizer.enabled = interactivePop;
}

-(void)setShowDescript:(BOOL)showDescript{
    _showDescript = showDescript;
    self.noDataView.hidden = !showDescript;
}

#pragma mark - Private Method

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

- (BOOL)isDismissed:(UIViewController *)viewController{
    if (viewController.isBeingDismissed || viewController.isBeingPresented || (viewController.parentViewController == nil && self.isNavigationController && ![viewController.navigationController.viewControllers containsObject:viewController])){
        return YES;
    }
    if (viewController.parentViewController){
        if (viewController.parentViewController != [UIApplication sharedApplication].keyWindow.rootViewController){
            return [self isDismissed:viewController.parentViewController];
        }
    }
    return NO;
}


#pragma mark - Public methods
-(void)noDataImage:(NSString*)image andNoDataDescript:(NSString *)descript{
    self.noDataImage.image = [UIImage imageNamed:image];
    self.noDataDes.text = descript;
    self.showDescript = YES;
}

-(void)rightButtonAction:(UIButton *)button{
    
}

-(void)baseBackBtnAction:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
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
