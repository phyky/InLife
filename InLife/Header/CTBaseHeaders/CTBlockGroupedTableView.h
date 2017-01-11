//
//  CTBlockGroupedTableView.h
//  分组表格视图块接口封装
//
//  Created by Blacknight on 15-5-11.
//  Copyright (c) 2015年 cattsoft. All rights reserved.
//

#import "CTBlockPlainTableView.h"

@interface CTBlockGroupedTableView : CTBlockPlainTableView

#pragma mark - block for UITableViewDataSource
@property (copy, nonatomic) NSInteger(^numberOfSectionsInTableView)(UITableView *tableView);

#pragma mark - block for UITableViewDelegate
@property (copy, nonatomic) CGFloat(^heightForHeaderInSection)(UITableView *tableView, NSInteger section);
@property (copy, nonatomic) CGFloat(^heightForFooterInSection)(UITableView *tableView, NSInteger section);

@property (copy, nonatomic) UIView *(^viewForHeaderInSection)(UITableView *tableView, NSInteger section);
@property (copy, nonatomic) UIView *(^viewForFooterInSection)(UITableView *tableView, NSInteger section);

@end
