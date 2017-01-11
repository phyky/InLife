//
//  ILHomeCell.h
//  InLife
//
//  Created by phy on 16/11/24.
//  Copyright © 2016年 physoft. All rights reserved.
//
#define ILHOME_CELL_H 320

#import <UIKit/UIKit.h>
#import "ILAppHeader.h"

@interface ILHomeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet YYLabel *date;
@property (weak, nonatomic) IBOutlet YYLabel *title;

@property (strong, nonatomic) ILHomePageEntity *HPEntity;

@end
