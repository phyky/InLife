//
//  UIImage+PECrop.h
//  PhotoCropEditor
//
//  Created by Ernesto Rivera on 2013/07/29.
//  Copyright (c) 2013 kishikawa katsumi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (PECrop)

/**
 *  将transform改成了Transform，因为其和新浪微博SDK扩展的类别方法名一致
 *
 */
- (UIImage *)rotatedImageWithTransform:(CGAffineTransform)rotation
                         croppedToRect:(CGRect)rect;

@end
