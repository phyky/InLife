//
//  CTDeviceUtil.h
//  CTBase
//
//  Created by wenrisheng on 16/2/25.
//  Copyright © 2016年 cattsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTDeviceUtil : NSObject

+ (NSString *)getIPAddress:(BOOL)preferIPv4;
+ (NSDictionary *)getIPAddresses;

@end
