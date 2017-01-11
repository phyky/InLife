//
//  CollectionViewCell.m
//  InLife
//
//  Created by pang on 16/12/2.
//  Copyright © 2016年 physoft. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    [self setBorderCornerWithBorderWidth:2.0 borderColor:[UIColor whiteColor] cornerRadius:8.0];
}

-(void)setCollectEntity:(ILHomePageEntity *)collectEntity{
    _collectEntity = collectEntity;
    [self.bg_image sd_setImageWithURL:[NSURL URLWithString:_collectEntity.strOriginalImgUrl]];
    self.titleText.text = [NSString stringWithFormat:@"《%@》",_collectEntity.strAuthor];
    self.date.text = _collectEntity.strMarketTime;
}

@end
