//
//  ILPersonalViewController.m
//  InLife
//
//  Created by pang on 16/11/22.
//  Copyright © 2016年 physoft. All rights reserved.
//
#define PERSONAL_CELL_H 50

#import "ILPersonalViewController.h"
#import "PersonalCell.h"
#import "ILAppHeader.h"
#import "ILYuLuCollectionViewController.h"

@interface ILPersonalViewController ()
@property (weak, nonatomic) IBOutlet UITableView *personalTableView;

@end

@implementation ILPersonalViewController

- (void)viewDidLoad {
    self.title = @"我的";
    self.showBackButton = NO;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"PersonalCell";
    PersonalCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = GET_XIB_FIRST_OBJECT(identifier);
    }
    cell.imageView.image = [UIImage imageNamed:@"icon_message_like"];
    cell.textLabel.text = @"我的收藏";
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return PERSONAL_CELL_H;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *datas =  [[PHYDataBaseHelper shareInstance] getAllCollcetHomePageData];
    datas = [ILAppHelper sortDescriptorDataSource:datas key:@"strMarketTime" ascending:NO];
    if (datas.count >0) {
        ILYuLuCollectionViewController *collectionVC = [[ILYuLuCollectionViewController alloc]init];
        collectionVC.collectYuLus = datas;
        [self.navigationController pushViewController:collectionVC animated:YES];
    }else{
        [SVProgressHUD showInfoWithStatus:@"抱歉，暂无收藏"];
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
