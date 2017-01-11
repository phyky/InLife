//
//  ILSortViewController.m
//  InLife
//
//  Created by pang on 16/11/22.
//  Copyright © 2016年 physoft. All rights reserved.
//

#import "ILSortViewController.h"
#import "ILAppHeader.h"
#import "ILHomeCell.h"

@interface ILSortViewController ()
@property (weak, nonatomic) IBOutlet UITableView *MWTableView;
@property (strong, nonatomic) NSMutableArray *dataSource;
@property (assign, nonatomic) NSInteger pageNo;
@end

@implementation ILSortViewController

- (void)viewDidLoad {
    self.title = @"分类";
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.naviView.alpha = 0;
    
    self.dataSource = [NSMutableArray  arrayWithArray:[[PHYDataBaseHelper shareInstance]getMeiWenData]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"ILHomeCell";
    ILHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = GET_XIB_FIRST_OBJECT(identifier);
        cell.bgImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",(long)(indexPath.row%4+1)]];
    }
    if (self.dataSource.count >0) {
//        cell.MWEntity = self.dataSource[indexPath.row];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ILHOME_CELL_H;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ILArticleViewController *article = [[ILArticleViewController alloc] init];
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
    self.naviView.alpha = alpha;
}


#pragma mark - 网络请求
-(void)getArticles{
    for (int i = 0; i<20; i++) {
        NSMutableDictionary *param = [NSMutableDictionary dictionary];
        NSString *date = [NSString stringWithFormat:@"201611%02d",i+1];
        [param setValue:date forKey:@"date"];
        [param setValue:@"4" forKey:@"version"];
        [ILInterfaceHelper requestWithUrl:SERVER_PATH_MW param:param methodType:CTRequestMethodTypeGet showHUD:YES showErrorMsg:YES resultCallback:^(CTRequestResultType resultType, id resultData) {
            if (resultData) {
                ILMeiWenEntity *temp_entity = [[PHYDataBaseHelper shareInstance] getMeiWenDataWithDate:date];
                if (temp_entity) {
                    
                }else{
                    ILMeiWenEntity *entity = [ILMeiWenEntity mj_objectWithKeyValues:resultData];
                    if (entity) {
                        [[PHYDataBaseHelper shareInstance]insertMeiWenDataToDB:entity date:date];
                    }
                }
            }
        }];
    }
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
