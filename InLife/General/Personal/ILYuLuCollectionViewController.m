//
//  ILYuLuCollectionViewController.m
//  InLife
//
//  Created by pang on 16/12/2.
//  Copyright © 2016年 physoft. All rights reserved.
//

#import "ILYuLuCollectionViewController.h"
#import "BWaterflowLayout.h"
#import "CollectionViewCell.h"

@interface ILYuLuCollectionViewController ()<BWaterflowLayoutDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collection;

@end

static NSString * const collectionID =  @"collect";
@implementation ILYuLuCollectionViewController

- (void)viewDidLoad {
    self.title = @"我的收藏";
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setupLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)setupLayout {
    //创建布局
    BWaterflowLayout * layout = [[BWaterflowLayout alloc]init];
    
    layout.delegate = self;
    self.collection.collectionViewLayout = layout;
    [self.collection registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:collectionID];
}

#pragma mark - <UICollectionViewDataSource>

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.collectYuLus.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionID forIndexPath:indexPath];
    
    cell.collectEntity = self.collectYuLus[indexPath.item];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ILArticleViewController *article = [[ILArticleViewController alloc] init];
    article.view.frame = self.view.bounds;
    article.entity = self.collectYuLus[indexPath.row];
    [self.navigationController wxs_pushViewController:article makeTransition:^(WXSTransitionProperty *transition) {
        transition.backGestureType = WXSGestureTypePanRight;
        transition.animationType = WXSTransitionAnimationTypePointSpreadPresent;
    }];
}

#pragma mark - <BWaterflowLayoutDelegate>

-(CGFloat)waterflowLayout:(BWaterflowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth {
    return 120 +arc4random()%60;
}
//瀑布流列数
- (CGFloat)columnCountInWaterflowLayout:(BWaterflowLayout *)waterflowLayout {
    return 2;
}
- (CGFloat)columnMarginInWaterflowLayout:(BWaterflowLayout *)waterflowLayout {
    return 5;
    
}
- (CGFloat)rowMarginInWaterflowLayout:(BWaterflowLayout *)waterflowLayout {
    return 5;
    
}
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(BWaterflowLayout *)waterflowLayout {
    return UIEdgeInsetsMake(5, 5, 5, 5);
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
