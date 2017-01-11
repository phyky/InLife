//
//  ILAppMacro.h
//  InLife
//
//  Created by pang on 16/11/23.
//  Copyright © 2016年 physoft. All rights reserved.
//

#ifndef ILAppMacro_h
#define ILAppMacro_h

#define NBA_GAME_APP_KEY @"d9fc0a5d36fc4b2dc40700df02eac9a1"

#define NAVBAR_CHANGE_POINT 100

#define page_size 20
// iOS8的字体
#define PHYFont(_fontName_,_size_) [UIFont fontWithName:_fontName_ size:_size_]

#define PHYDefaultFont(_size_) [UIFont fontWithName:@"FZLanTingHei-L-GBK" size:_size_]

//获取屏幕分辨率
#define SCREEN_SCANLE               [UIScreen mainScreen].scale
#define SCREEN_SCANLE_W            ([UIScreen mainScreen].applicationFrame.size.width)*SCREEN_SCANLE
#define SCREEN_SCANLE_H            ([UIScreen mainScreen].applicationFrame.size.height)*SCREEN_SCANLE

#endif /* ILAppMacro_h */
