//
//  ILArticleCell.h
//  InLife
//
//  Created by pang on 16/11/30.
//  Copyright © 2016年 physoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ILAppHeader.h"
#import "YYText.h"
#import "UIImage+GIF.h"

@interface ILArticleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet YYLabel *articleText;
@property (weak, nonatomic) IBOutlet UILabel *articleDay;
@property (weak, nonatomic) IBOutlet UILabel *articleDate;
@property (weak, nonatomic) IBOutlet UILabel *articleIssue;
@property (weak, nonatomic) IBOutlet UILabel *articleTitle;
@property (weak, nonatomic) IBOutlet UIButton *collectionBtn;

@property (strong, nonatomic) ILHomePageEntity *article_entity;
@end
