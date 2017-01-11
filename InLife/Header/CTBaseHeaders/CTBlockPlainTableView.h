//
//  CTBlockPlainTableView.h
//  平面表格视图块接口封装
//
//  Created by Blacknight on 15-5-11.
//  Copyright (c) 2015年 cattsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTBlockPlainTableView : UITableView

#pragma mark - block for UITableViewDataSource
@property (copy, nonatomic) NSInteger(^numberOfRowsInSection)(UITableView *tableView, NSInteger section);
@property (copy, nonatomic) UITableViewCell *(^cellForRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);

#pragma mark - block for UITableViewDelegate
@property (copy, nonatomic) CGFloat(^heightForRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);

@property (copy, nonatomic) NSIndexPath *(^willSelectRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (copy, nonatomic) NSIndexPath *(^willDeselectRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);

@property (copy, nonatomic) void(^didSelectRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (copy, nonatomic) void(^didDeselectRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);


@end
