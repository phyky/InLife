//
//  ILArticleViewController.m
//  InLife
//
//  Created by pang on 16/11/25.
//  Copyright © 2016年 physoft. All rights reserved.
//
#define IMAGE_H 250

#import "ILArticleViewController.h"
#import "ILAppHeader.h"
#import "ILArticleCell.h"

@interface ILArticleViewController ()
@property (weak, nonatomic) IBOutlet UITableView *YuLuTableView;
@property (strong, nonatomic) UIView *headerView;
@property (strong, nonatomic) UIImageView *headerImage;
@end

@implementation ILArticleViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.naviView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.YuLuTableView.tableHeaderView = self.headerView;
}

#pragma mark - Setter&&Getter
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, IMAGE_H)];
        self.headerImage = [[UIImageView alloc]initWithFrame:_headerView.bounds];
        [self.headerImage sd_setImageWithURL:[NSURL URLWithString:self.entity.strOriginalImgUrl]];
        [_headerView addSubview:self.headerImage];
    }
    return _headerView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY < 0) {
        CGFloat factor = ABS(offsetY) + IMAGE_H;
        CGFloat w = SCREEN_WIDTH * factor/IMAGE_H;
        CGFloat x = - (w-SCREEN_WIDTH) * 0.5;
        CGFloat y = - ABS(offsetY);
        CGFloat h = factor;
        CGRect frame = CGRectMake(x,y,w,h);
        self.headerImage.frame = frame;
    }
}

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"ILArticleCell";
    ILArticleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = GET_XIB_FIRST_OBJECT(identifier);
    }
    cell.article_entity = self.entity;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = [ILAppHelper sizeWithString:self.entity.strContent font:18.0 maxWidth:SCREEN_WIDTH -100];
    CGFloat height = size.height + SCREEN_HEIGHT_NO_STATUS*0.55;
    height = height+IMAGE_H < SCREEN_HEIGHT ? SCREEN_HEIGHT-IMAGE_H:height;
    return height;
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
