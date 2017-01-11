//
//  CTEchartWebView.h
//  echarts图表组件
//
//  Created by jjh on 15-5-6.
//  Copyright (c) 2015年 cattsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

//刷新
#define EVENT_REFRESH @"refresh"
//还原
#define EVENT_RESTORE @"restore"
//显示空间变化
#define EVENT_RESIZE @"resize"
//点击
#define EVENT_CLICK @"click"
//双击
#define EVENT_DBLCLICK @"dblclick"
//悬浮
#define EVENT_HOVER @"hover"
//鼠标离开数据图形
#define EVENT_MOUSEOUT @"mouseout"
//数据修改，如拖拽重计算
#define EVENT_DATA_CHANGED @"dataChanged"
//数据视图修改
#define EVENT_DATA_VIEW_CHANGED @"dataViewChanged"
//动态类型切换
#define EVENT_MAGIC_TYPE_CHANGED @"magicTypeChanged"
//时间轴变化
#define EVENT_TIMELINE_CHANGED @"timelineChanged"
//数据区域缩放
#define EVENT_DATA_ZOOM @"dataZoom"
//值域漫游
#define EVENT_DATA_RANGE @"dataRange"
//值域开关选择
#define EVENT_DATA_RANGE_SELECTED @"dataRangeSelected"
//值域漫游hover
#define EVENT_DATA_RANGE_HOVERLINK @"dataRangeHoverLink"
//图例开关选择
#define EVENT_LEGEND_SELECTED @"legendSelected"
//图例hover
#define EVENT_LEGEND_HOVERLINK @"legendHoverLink"
//地图漫游
#define EVENT_MAP_ROAM @"mapRoam"
//地图选择
#define EVENT_MAP_SELECTED @"mapSelected"
//饼图选择
#define EVENT_PIE_SELECTED @"pieSelected"
//力导向布局结束
#define EVENT_FORCE_LAYOUT_END @"forceLayoutEnd"

@interface CTEchartWebView : UIWebView<UIWebViewDelegate>

/**
 *  echarts图表组件委托<br>
 *  不要使用UIWebView原本的委托对象
 */
@property(nonatomic,assign) id<UIWebViewDelegate> echartWebViewDelegate;

/**
 *  加载默认html文件
 */
- (void)loadDefaultHtmlFile;

/**
 *  加载本地html文件
 *
 *  @param fileName html的文件名称，不包含扩展名
 */
- (void)loadLocalHtmlFile:(NSString *)fileName;

/**
 *  设置图表内容，请参考js版echarts的文档
 *
 *  @param option 内容选项
 */
- (void)setOption:(NSDictionary *)option;

/**
 *  设置图表内容，请参考js版echarts的文档
 *
 *  @param jsonOption 内容选项的json格式
 */
- (void)setJsonOption:(NSString *)jsonOption;

/**
 *  设置事件处理器
 *
 *  @param handler   处理器
 *  @param eventType 事件类型，参考事件类型宏定义
 */
- (void)setHandler:(void (^)(NSDictionary *event))handler forEventType:(NSString *)eventType;

@end
