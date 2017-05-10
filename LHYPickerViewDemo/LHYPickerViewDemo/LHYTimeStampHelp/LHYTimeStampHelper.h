//
//  LHYTimeStampHelper.h
//  AFuSport
//
//  Created by Huoyi Lin on 2017/3/29.
//  Copyright © 2017年 阿福体育科技公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHYTimeStampHelper : NSObject


//输入 时间戳   返回 时间字符串
+(NSString *)timeStampChangeToTimeString:(double)timestamp timeFormatter:(NSString *)formatterStr;

// date ==> double
+(double)dateChangeToTimeStampWithDate:(NSDate *)date;

//nSString  ==> date

+(NSDate *)timeStringChangeToTimeDate:(NSString *)timesTring timeFormatter:(NSString *)formatterStr;

//获取 当天 开始的时间戳*（10）
+(double)geTodayStartTimeStampt;

//输入 年月日 返回 时间Date
+(NSDate *)creatTimeStampYear:(int)year month:(int)month dath:(int)day hour:(int)hour minite:(int)minites second:(int)second;

@end
