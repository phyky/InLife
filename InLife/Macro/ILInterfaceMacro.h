//
//  ILInterfaceMacro.h
//  InLife
//
//  Created by pang on 16/11/23.
//  Copyright © 2016年 physoft. All rights reserved.
//

#ifndef ILInterfaceMacro_h
#define ILInterfaceMacro_h

/**
 *  每日一文服务器地址
 */
#define SERVER_PATH_MW    @"http://api.meiriyiwen.com/v2/day"

/**
 *  theone-服务器地址
 */
#define SERVER_PATH_YL    @"http://bea.wufazhuce.com/OneForWeb/one/"

/**************************请求URL****************************/

/**
 *  .theone-语录
 */
#define URL_GET_YULU_CONTENT [NSString stringWithFormat:@"%@/getHp_N",SERVER_PATH_YL]

/**
 *  .theone-文章
 */
#define URL_GET_YULU_ARTICLE [NSString stringWithFormat:@"%@/getOneContentInfo",SERVER_PATH_YL]

/**
 *  .theone-东西
 */
#define URL_GET_YULU_SOMETHING [NSString stringWithFormat:@"%@/o_f",SERVER_PATH_YL]


#endif /* ILInterfaceMacro_h */
