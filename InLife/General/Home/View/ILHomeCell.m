//
//  ILHomeCell.m
//  InLife
//
//  Created by phy on 16/11/24.
//  Copyright © 2016年 physoft. All rights reserved.
//

#import "ILHomeCell.h"

@implementation ILHomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.title.font = PHYFont(@"Party LET", 20.0);
    self.title.textColor = UIColorFromRGB(0x668B8B);
    self.date.font = PHYFont(@"Snell Roundhand",20.0);
    self.date.textColor = [UIColor darkGrayColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setHPEntity:(ILHomePageEntity *)HPEntity{
    self.title.text = HPEntity.strAuthor;
    self.date.text = HPEntity.strMarketTime;
    [self.bgImage sd_setImageWithURL:[NSURL URLWithString:HPEntity.strOriginalImgUrl] placeholderImage:[UIImage imageNamed:@"placeholder"] options:SDWebImageAllowInvalidSSLCertificates completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
}

@end
