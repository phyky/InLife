//
//  CollectionViewCell.h
//  InLife
//
//  Created by pang on 16/12/2.
//  Copyright © 2016年 physoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ILAppHeader.h"

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bg_image;
@property (weak, nonatomic) IBOutlet UILabel *titleText;
@property (weak, nonatomic) IBOutlet UILabel *date;

@property (strong, nonatomic) ILHomePageEntity *collectEntity;
@end
