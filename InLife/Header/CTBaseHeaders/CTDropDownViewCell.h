//
//  DropDownViewCell.h
//  OilServer
//
//  Created by cattsoft on 16/2/15.
//  Copyright © 2016年 wenrisheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTDropDownViewCell : UITableViewCell

+ (instancetype)getCell;

@property (weak, nonatomic) IBOutlet UILabel *dropText;


@end
