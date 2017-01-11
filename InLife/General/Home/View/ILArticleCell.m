//
//  ILArticleCell.m
//  InLife
//
//  Created by pang on 16/11/30.
//  Copyright © 2016年 physoft. All rights reserved.
//

#import "ILArticleCell.h"

@interface ILArticleCell ()
@property (nonatomic,strong) UIBezierPath *path;
@property (nonatomic, strong) UIImageView *anim_image;
@property (nonatomic, assign) BOOL collect_state;
@end

@implementation ILArticleCell

- (void)awakeFromNib {
    // Initialization code
    self.articleText.font = PHYFont(@"Devanagari Sangam MN", 18.0);
//    self.articleText.textColor = UIColorFromRGB(0x668B8B);
    self.articleDay.font = PHYFont(@"AmericanTypewriter",30.0);
    self.articleDate.font = PHYFont(@"AmericanTypewriter",16.0);
    self.articleIssue.font = PHYFont(@"Chalkduster", 17.0);
    self.articleTitle.font = PHYFont(@"Helvetica", 20.0);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setArticle_entity:(ILHomePageEntity *)article_entity{
    _article_entity = article_entity;
    self.articleTitle.text = [NSString stringWithFormat:@"《%@》",article_entity.strAuthor];
    self.articleText.text = article_entity.strContent;
    self.articleIssue.text = article_entity.strHpTitle;
    self.articleDay.text = [[article_entity.strMarketTime componentsSeparatedByString:@"-"] lastObject];
    self.articleDate.text = [PHYCalendarHelper getDateStrWithDate:[PHYCalendarHelper getDateWithDateStr:article_entity.strMarketTime format:@"yyyy-MM-dd"] format:@"yyyy-MM"];
    if ([self hasCollected]) {
        self.collect_state = YES;
        [self.collectionBtn setBackgroundImage:[UIImage sd_animatedGIFNamed:@"butterfly"] forState:UIControlStateNormal];
    }else{
        self.collect_state = NO;
        [self.collectionBtn setBackgroundImage:[UIImage imageNamed:@"icon_heart"] forState:UIControlStateNormal];
    }
}

- (IBAction)collectionAction:(UIButton *)sender {
    
    if (self.collect_state) {
        [self cancleCollectionAnimation];
    }else{
        [self collectionAnimation];
    }
    self.collect_state = !self.collect_state;
    //是否收藏改语录
    [[PHYDataBaseHelper shareInstance] updateHomePageDataToDB:self.article_entity dataId:self.article_entity.strHpId collectState:self.collect_state];
}


#pragma mark - private Method

-(BOOL)hasCollected{
 ILHomePageEntity *entity = [[PHYDataBaseHelper shareInstance]checkCollectionHomePageDataWithDataId:self.article_entity.strHpId];
    if (entity) {
        return YES;
    }else {
        return NO;
    }
}



#pragma mark - 收藏动画
-(void)collectionAnimation
{
    [UIView animateWithDuration:2.5f animations:^{
        self.collectionBtn.alpha = 0;
    }];
    self.anim_image = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH +50, self.heightv, 50, 50)];
    self.anim_image.image = [UIImage sd_animatedGIFNamed:@"butterfly"];
    [self addSubview:self.anim_image];
    self.path = [UIBezierPath bezierPath];
    [self.path moveToPoint:self.anim_image.layer.position];
    [self.path addCurveToPoint:self.collectionBtn.center controlPoint1:CGPointMake(SCREEN_WIDTH*0.75,self.heightv) controlPoint2:CGPointMake(SCREEN_WIDTH*0.25,self.collectionBtn.yv+30)];
    [self collectionGroupAnimation];
}
-(void)collectionGroupAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = self.path.CGPath;
    animation.rotationMode = kCAAnimationLinear;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0f];
    scaleAnimation.duration = 4.5f;
    scaleAnimation.toValue = [NSNumber numberWithFloat:0.5f];
    
    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[animation,scaleAnimation];
    groups.duration = 4.5f;
    groups.removedOnCompletion=NO;
    groups.fillMode=kCAFillModeForwards;
    groups.delegate = self;
    [self.anim_image.layer addAnimation:groups forKey:@"group"];
}


-(void)cancleCollectionAnimation{
    [UIView animateWithDuration:0.5f animations:^{
        [self.collectionBtn setBackgroundImage:[UIImage imageNamed:@"icon_heart"] forState:UIControlStateNormal];
    }];
    self.anim_image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.anim_image.center = self.collectionBtn.center;
    self.anim_image.image = [UIImage sd_animatedGIFNamed:@"butterfly"];
    [self addSubview:self.anim_image];
    
    self.path = [UIBezierPath bezierPath];
    [self.path moveToPoint:self.anim_image.layer.position];
    [self.path addLineToPoint:CGPointMake(-50, self.collectionBtn.yv-80)];
    [self cancleCollectionGroupAnimation];
}

-(void)cancleCollectionGroupAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = self.path.CGPath;
    animation.rotationMode = kCAAnimationLinear;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.5f];
    scaleAnimation.duration = 1.5f;
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    
    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[animation,scaleAnimation];
    groups.duration = 1.5f;
    groups.removedOnCompletion=NO;
    groups.fillMode=kCAFillModeForwards;
    groups.delegate = self;
    [self.anim_image.layer addAnimation:groups forKey:@"cancleGroup"];
}


#pragma mark - CAAnimationDelegate
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (anim == [self.anim_image.layer animationForKey:@"group"]) {
        [self.collectionBtn setBackgroundImage:[UIImage sd_animatedGIFNamed:@"butterfly"] forState:UIControlStateNormal];
        self.collectionBtn.alpha = 1;
        [self.anim_image removeFromSuperview];
        self.path = nil;
    }else{
        [self.anim_image removeFromSuperview];
        self.path = nil;
    }
}

@end
