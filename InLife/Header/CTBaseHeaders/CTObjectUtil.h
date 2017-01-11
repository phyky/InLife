//
//  CTObjectUtil.h
//  CTBase
//
//  Created by Blacknight on 15-7-3.
//  Copyright (c) 2015年 cattsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTObjectUtil : NSObject

+ (id)dictionaryToEntity:(NSDictionary *)dict class:(Class)Cls;

+ (NSMutableDictionary *)entityToDictionary:(id)entity;

@end
