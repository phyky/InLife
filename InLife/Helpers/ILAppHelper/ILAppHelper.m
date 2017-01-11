//
//  ILAppHelper.m
//  InLife
//
//  Created by pang on 16/11/29.
//  Copyright © 2016年 physoft. All rights reserved.
//

#import "ILAppHelper.h"

@implementation ILAppHelper

+(void)getImageSizeWithURL:(id)imageURL indexPath:(NSIndexPath*)indexPath callBack:(SizeCallBack)callBack
{
    NSURL* URL = nil;
    if([imageURL isKindOfClass:[NSURL class]]){
        URL = imageURL;
    }
    if([imageURL isKindOfClass:[NSString class]]){
        URL = [NSURL URLWithString:imageURL];
    }
    if(URL == nil){
        if (callBack) {
            callBack(indexPath,CGSizeZero.height); // url不正确返回CGSizeZero
        }
    }
    UIImageView  *temp_image = [[UIImageView alloc]init];
    [temp_image sd_setImageWithURL:URL completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (!error) {
            if (callBack) {
                CGFloat height = (image.size.width/SCREEN_SCANLE_W)*image.size.height;
                callBack(indexPath,height);
            }
        }else{
            if (callBack) {
                callBack(indexPath,CGSizeZero.height);
            }
        }
    }];
}

+(NSMutableArray *)sortDescriptorDataSource:(NSMutableArray *)dataSource key:(NSString *)key ascending:(BOOL)ascending{
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:key ascending:ascending]];
    [dataSource sortUsingDescriptors:sortDescriptors];
    return dataSource;
}


/** 返回自适应高度的文本 */

+ (CGSize)sizeWithString:(NSString *)string font:(CGFloat)font maxWidth:(CGFloat)maxWidth

{
    
    NSDictionary *attributesDict = @{NSFontAttributeName:PHYDefaultFont(font)};
    
    CGSize maxSize = CGSizeMake(maxWidth, MAXFLOAT);
    
    CGRect subviewRect = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDict context:nil];
    
    return subviewRect.size;
    
}



/** 返回自适应宽度的文本 */

+ (CGSize)sizeWithString:(NSString *)string font:(CGFloat)font maxHeight:(CGFloat)maxHeight

{
    
    NSDictionary *attributesDict = @{NSFontAttributeName:PHYDefaultFont(font)};
    
    CGSize maxSize = CGSizeMake(MAXFLOAT, maxHeight);
    
    CGRect subviewRect = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDict context:nil];
    
    return subviewRect.size;
    
}

@end
