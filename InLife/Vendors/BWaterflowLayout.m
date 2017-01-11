//
//  BWaterflowLayout.m
//  BingoWaterfallFlowDemo
//
//  Created by Bing on 16/3/17.
//  Copyright © 2016年 Bing. All rights reserved.
//

#import "BWaterflowLayout.h"

/**每一列之间的间距*/
static const CGFloat BDefaultColumnMargin = 10;
/**每一行之间的间距*/
static const CGFloat BDefaultRowMargin = 10;
/**边缘的间距*/
static const UIEdgeInsets BDefaultEdgeInsets = {10, 10, 10, 10};
/**瀑布流的列数*/
static const CGFloat BDefaultColumnCount = 3;

@interface BWaterflowLayout()

/**存放所有cell的布局属性*/
@property (nonatomic, strong) NSMutableArray * attrsArray;

/**存放所有列的当前高度*/
@property (nonatomic, strong) NSMutableArray * columnHeights;

/**内容的高度*/
@property (nonatomic, assign) CGFloat  contentHeight;


- (CGFloat)rowMargin;
- (CGFloat)columnMargin;
- (NSInteger)columnCount;
- (UIEdgeInsets)edgeInsets;

@end

@implementation BWaterflowLayout
#pragma mark - 常见数据处理
- (CGFloat)rowMargin
{
    if ([self.delegate respondsToSelector:@selector(rowMarginInWaterflowLayout:)]) {
        return [self.delegate rowMarginInWaterflowLayout:self];
    } else {
        return BDefaultRowMargin;
    }
}

- (CGFloat)columnMargin
{
    if ([self.delegate respondsToSelector:@selector(columnMarginInWaterflowLayout:)]) {
        return [self.delegate columnMarginInWaterflowLayout:self];
    } else {
        return BDefaultColumnMargin;
    }
}

- (NSInteger)columnCount
{
    if ([self.delegate respondsToSelector:@selector(columnCountInWaterflowLayout:)]) {
        return [self.delegate columnCountInWaterflowLayout:self];
    } else {
        return BDefaultColumnCount;
    }
}

- (UIEdgeInsets)edgeInsets
{
    if ([self.delegate respondsToSelector:@selector(edgeInsetsInWaterflowLayout:)]) {
        return [self.delegate edgeInsetsInWaterflowLayout:self];
    } else {
        return BDefaultEdgeInsets;
    }
}

#pragma mark - 懒加载
-(NSMutableArray *)attrsArray {
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}
-(NSMutableArray *)columnHeights {
    if (!_columnHeights) {
        _columnHeights = [NSMutableArray array];
    }
    return _columnHeights;
}

/*
 * 初始化
 */
- (void)prepareLayout {
    [super prepareLayout];
    
    self.contentHeight = 0;
    
    //清除以前计算的所以高度
    [self.columnHeights removeAllObjects];
    
    //默认高度
    for (NSInteger i = 0; i < self.columnCount; i++) {
        [self.columnHeights addObject:@(self.edgeInsets.top)];
    }
    
    //清除之前所以的布局属性
    [self.attrsArray removeAllObjects];
    
    //数组 (存放所以cell的布局属性)
    //开始创建每一个cell对应的布局属性
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (int i = 0; i < count; i++) {
        //创建位置
        NSIndexPath * indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        //获取cell布局属性
        UICollectionViewLayoutAttributes * attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        
        [self.attrsArray addObject:attrs];
    }
}

/**
 * 决定cell的布局
 */
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    return self.attrsArray;
}

//设置cell的布局属性
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes * attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    //设置布局属性的frame
    
    CGFloat collectionViewW = self.collectionView.frame.size.width;
    
    CGFloat w = (collectionViewW - self.edgeInsets.left - self.edgeInsets.right - (self.columnCount - 1)*self.columnMargin) / self.columnCount;
    CGFloat h = [self.delegate waterflowLayout:self heightForItemAtIndex:indexPath.item itemWidth:w];
    
    //找出高度最短的那一列
//    __block NSInteger destColumn = 0;
//    __block CGFloat minColumnHeight = 0;
//    [self.columnHeights enumerateObjectsUsingBlock:^(NSNumber * columnHeightNumber, NSUInteger idx, BOOL * _Nonnull stop) {
//        
//        CGFloat columnHeight = columnHeightNumber.doubleValue;
//        
//        if (minColumnHeight >  columnHeight) {
//            minColumnHeight = columnHeight;
//            destColumn = idx;
//        }
//    }];
    
    NSInteger destColumn = 0;
    CGFloat minColumnHeight = [self.columnHeights[0] doubleValue];
    for (NSInteger i = 1; i < self.columnCount; i++) {
          CGFloat columnHeight = [self.columnHeights[i] doubleValue];
        if (minColumnHeight > columnHeight) {
            minColumnHeight = columnHeight;
            destColumn = i;
        }
    }
    
    CGFloat x = self.edgeInsets.left + destColumn * (w +self.columnMargin);
    
    CGFloat y = minColumnHeight;
    if (y != self.rowMargin) {
        y += self.rowMargin;
    }
    
    attrs.frame = CGRectMake(x, y, w, h);

    //更新最短那列的高度
    self.columnHeights[destColumn] = @(CGRectGetMaxY(attrs.frame));
    
    // 记录内容的高度
    CGFloat columnHeight = [self.columnHeights[destColumn] doubleValue];
    if (self.contentHeight < columnHeight) {
        self.contentHeight = columnHeight;
    }
    
    return attrs;
}

-(CGSize)collectionViewContentSize {
    
//    CGFloat maxColumnHeight = [self.columnHeights[0] doubleValue];
//    for (NSInteger i = 1; i < self.columnCount; i++) {
//        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
//        if (maxColumnHeight <  columnHeight) {
//            maxColumnHeight = columnHeight;
//        }
//    }
    return CGSizeMake(0, self.contentHeight + self.edgeInsets.bottom);
}
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com