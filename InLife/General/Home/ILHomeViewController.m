//
//  ILHomeViewController.m
//  InLife
//
//  Created by pang on 16/11/22.
//  Copyright © 2016年 physoft. All rights reserved.
//

#import "ILHomeViewController.h"
#import "ILAppHeader.h"
#import "ILHomeCell.h"

@interface ILHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSDictionary *data;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataSource;
@property (assign, nonatomic) NSInteger pageNo;
@property (assign, nonatomic) NSInteger requestCount;
@property (strong, nonatomic) NSMutableDictionary *cellHeights;
@property (weak, nonatomic) IBOutlet UIButton *backToTopBtn;
@end

@implementation ILHomeViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    self.title = @"语录";
    self.showBackButton = NO;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self deploy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - init
//配置一些必要项
-(void)deploy{
    self.naviView.alpha = 0;
    self.pageNo = 1;
    self.requestCount = 0;
    self.dataSource = [NSMutableArray array];
    self.cellHeights = [NSMutableDictionary dictionary];
    [self.backToTopBtn setBorderCornerWithBorderWidth:1.0 borderColor:[UIColor whiteColor] cornerRadius:self.backToTopBtn.widthv/2];
    self.backToTopBtn.alpha = 0;
    [self getHomePageDatas];
    __weak ILHomeViewController *weekSelf = self;
    [self.tableView addLegendHeaderWithRefreshingBlock:^{
        self.pageNo = 1;
        [weekSelf getHomePageDatas];
    }];
    [weekSelf.tableView addLegendFooterWithRefreshingBlock:^{
        [weekSelf getHomePageDatas];
    }];
}


#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"ILHomeCell";
    ILHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = GET_XIB_FIRST_OBJECT(identifier);
    }
    if (self.dataSource.count >0) {
        cell.HPEntity = self.dataSource[indexPath.row];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ILHOME_CELL_H;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ILArticleViewController *article = [[ILArticleViewController alloc] init];
    article.view.frame = self.view.bounds;
    article.entity = self.dataSource[indexPath.row];
    [self.navigationController wxs_pushViewController:article makeTransition:^(WXSTransitionProperty *transition) {
        transition.backGestureType = WXSGestureTypePanRight;
        transition.animationType =WXSTransitionAnimationTypeBrickOpenHorizontal;
    }];
}



#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 100开始显示
    // 180显示完全
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat alpha = 0;
    
    if (offsetY > NAVBAR_CHANGE_POINT) {
        alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
    }
    
    if (alpha>0) {
        [self.navigationItem.titleView setHidden:NO];
        [self.navigationItem.leftBarButtonItem.customView setHidden:NO];
        [self.navigationItem.rightBarButtonItem.customView setHidden:NO];
    }
    self.backToTopBtn.alpha = alpha;
    self.naviView.alpha = alpha;
    if ([self.parentViewController isKindOfClass:[PHYTabBarViewController class]]) {
        ((PHYTabBarViewController *)self.parentViewController).tabBar.alpha = 1-alpha;
    }
}

#pragma mark - 返回顶部
- (IBAction)backToTopAction:(UIButton *)sender {
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

#pragma mark - 网络请求
-(void)getHomePageDatas{
    if (self.pageNo == 1) {
        [self.dataSource removeAllObjects];
    }
    self.requestCount = page_size;
    NSInteger count = self.pageNo *page_size;
    [SVProgressHUD show];
    for (int i = (self.pageNo -1) *page_size; i<count; i++) {
        NSDate *tempdate = [PHYCalendarHelper getDateFromDate:[NSDate date] afterDays:-i];
        NSString *date = [PHYCalendarHelper getDateStrWithDate:tempdate format:@"yyyy-MM-dd"];
        ILHomePageEntity *temp_entity = [[PHYDataBaseHelper shareInstance] getHomePageDataWithDate:date];
        if (temp_entity) {
            self.requestCount --;
            if (![self hasDataForDate:date]) {
                [self.dataSource addObject:temp_entity];
            }
            if (self.requestCount == 0) {
                self.pageNo ++;
                self.dataSource = [ILAppHelper sortDescriptorDataSource:self.dataSource key:@"strMarketTime" ascending:NO];
                [self.tableView reloadData];
                [self.tableView endHeaderAndFooterRefresh];
                [SVProgressHUD dismissWithDelay:1.0f];
            }
        }else{
            NSMutableDictionary *param = [NSMutableDictionary dictionary];
            [param setValue:date forKey:@"strDate"];
            [param setValue:@"1" forKey:@"strRow"];
            [ILInterfaceHelper requestWithUrl:URL_GET_YULU_CONTENT param:param methodType:CTRequestMethodTypeGet showHUD:NO showErrorMsg:NO resultCallback:^(CTRequestResultType resultType, id resultData) {
                switch (resultType) {
                   case CTRequestResultTypeSuccess:
                   {
                       if (resultData) {
                           ILHomePageEntity *entity = [ILHomePageEntity mj_objectWithKeyValues:[resultData objectForKey:@"hpEntity"]];
                           if (entity) {
                               if (![self hasDataForDate:date]) {
                                   [self.dataSource addObject:entity];
                               }
                               [[PHYDataBaseHelper shareInstance]insertHomePageDataToDB:entity date:date dataId:entity.strHpId];
                           }
                       }
                   }
                       break;
                   case CTRequestResultTypeFailed:
                   {
                       [SVProgressHUD showErrorWithStatus:@"数据出错"];
                   }
                       break;
                   default:
                       break;
                }
                self.requestCount --;
                if (self.requestCount == 0) {
                    self.pageNo ++;
                    self.dataSource = [ILAppHelper sortDescriptorDataSource:self.dataSource key:@"strMarketTime" ascending:NO];
                    [self.tableView reloadData];
                    [self.tableView endHeaderAndFooterRefresh];
                    [SVProgressHUD dismissWithDelay:1.0f];
                }
            }];
        }
    }
}

-(BOOL)hasDataForDate:(NSString *)date{
    for (ILHomePageEntity *entity in self.dataSource) {
        if ([entity.strMarketTime isEqualToString:date]) {
            return YES;
        }
    }
    return NO;
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
