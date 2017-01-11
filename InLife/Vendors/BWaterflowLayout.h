//
//  BWaterflowLayout.h
//  BingoWaterfallFlowDemo
//
//  Created by Bing on 16/3/17.
//  Copyright © 2016年 Bing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BWaterflowLayout;

@protocol BWaterflowLayoutDelegate <NSObject>

@required

/**
 *	@brief	cell的高度
 *
 *	@param 	waterflowLayout
 *	@param 	index 	某个cell
 *	@param 	itemWidth 	cell的宽度
 *
 *	@return	cell高度
 */
- (CGFloat)waterflowLayout:(BWaterflowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth;

@optional
/**瀑布流的列数*/
- (CGFloat)columnCountInWaterflowLayout:(BWaterflowLayout *)waterflowLayout;
/**每一列之间的间距*/
- (CGFloat)columnMarginInWaterflowLayout:(BWaterflowLayout *)waterflowLayout;
/**每一行之间的间距*/
- (CGFloat)rowMarginInWaterflowLayout:(BWaterflowLayout *)waterflowLayout;
/**cell边缘的间距*/
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(BWaterflowLayout *)waterflowLayout;

@end

@interface BWaterflowLayout : UICollectionViewLayout

@property (nonatomic, weak) id<BWaterflowLayoutDelegate> delegate;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com