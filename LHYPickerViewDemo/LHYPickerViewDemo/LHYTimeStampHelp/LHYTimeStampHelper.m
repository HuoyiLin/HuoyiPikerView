//
//  LHYTimeStampHelper.m
//  AFuSport
//
//  Created by Huoyi Lin on 2017/3/29.
//  Copyright © 2017年 阿福体育科技公司. All rights reserved.
//

#import "LHYTimeStampHelper.h"
//1000?kai
@implementation LHYTimeStampHelper

//输入 时间戳   返回 时间字符串
+(NSString *)timeStampChangeToTimeString:(double)timestamp timeFormatter:(NSString *)formatterStr;
{
   
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    if (formatterStr) {
          [formatter setDateFormat:formatterStr];
    }else
    {
          [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    }
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    NSLog(@"confromTimespStr =  %@",confromTimespStr);
    return confromTimespStr;
}

+(double)dateChangeToTimeStampWithDate:(NSDate *)date;
{
   return (double)[date timeIntervalSince1970];
}
+(NSDate *)timeStringChangeToTimeDate:(NSString *)timesTring timeFormatter:(NSString *)formatterStr;
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    formatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    [formatter setTimeStyle:NSDateFormatterShortStyle];
    if (formatterStr) {
        [formatter setDateFormat:formatterStr];
    }else
    {
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    }
    
    NSDate *confromTimesp = [formatter dateFromString:timesTring];
    
    NSLog(@"ads date %@",confromTimesp);
    return confromTimesp;
    
}


//输入 年月日 返回 时间Date
+(NSDate *)creatTimeStampYear:(int)year month:(int)month dath:(int)day hour:(int)hour minite:(int)minites second:(int)second;
{
    NSString *strTime = [NSString stringWithFormat:@"%@-%@-%@ %@:%@:%@",
                         [LHYTimeStampHelper resettingNumberIsGreatterThanTenNumber:year],
                         [LHYTimeStampHelper resettingNumberIsGreatterThanTenNumber:month],
                         [LHYTimeStampHelper resettingNumberIsGreatterThanTenNumber:day],
                         [LHYTimeStampHelper resettingNumberIsGreatterThanTenNumber:hour],
                         [LHYTimeStampHelper resettingNumberIsGreatterThanTenNumber:minites],
                         [LHYTimeStampHelper resettingNumberIsGreatterThanTenNumber:day]];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:strTime];
    return date;
}
+(NSString *)resettingNumberIsGreatterThanTenNumber:(int)number;
{
    if (number >= 10) {
        return [NSString stringWithFormat:@"%d",number];
    }else if(number == 0)
    {
        return @"00";
    }else
    {
        return [NSString stringWithFormat:@"0%d",number];
    }
}

-(NSString *)getDayWeek:(int)dayDelay{
    NSString *weekDay;
    NSDate *dateNow;
    dateNow=[NSDate dateWithTimeIntervalSinceNow:dayDelay*24*60*60];//dayDelay代表向后推几天，如果是0则代表是今天，如果是1就代表向后推24小时，如果想向后推12小时，就可以改成dayDelay*12*60*60,让dayDelay＝1
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];//设置成中国阳历
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;//这句我也不明白具体时用来做什么。。。
    comps = [calendar components:unitFlags fromDate:dateNow];
    long weekNumber = [comps weekday]; //获取星期对应的长整形字符串
    long day=[comps day];//获取日期对应的长整形字符串
    long year=[comps year];//获取年对应的长整形字符串
    long month=[comps month];//获取月对应的长整形字符串
    long hour=[comps hour];//获取小时对应的长整形字符串
    long minute=[comps minute];//获取月对应的长整形字符串
    long second=[comps second];//获取秒对应的长整形字符串
    NSString *riQi =[NSString stringWithFormat:@"%ld日",day];//把日期长整形转成对应的汉字字符串
    switch (weekNumber) {
        case 1:
            weekDay=@"星期日";
            break;
        case 2:
            weekDay=@"星期一";
            break;
        case 3:
            weekDay=@"星期二";
            break;
        case 4:
            weekDay=@"星期三";
            break;
        case 5:
            weekDay=@"星期四";
            break;
        case 6:
            weekDay=@"星期五";
            break;
        case 7:
            weekDay=@"星期六";
            break;
            
        default:
            break;
    }
    weekDay=[riQi stringByAppendingString:weekDay];//这里我本身的程序里只需要日期和星期，所以上面的年月时分秒都没有用上
    return weekDay;
}





//获取 当天 开始的时间戳*（10）
+(double)geTodayStartTimeStampt;{
   
    NSDate *dateNow;
    dateNow=[NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];//设置成中国阳历
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;//这句我也不明白具体时用来做什么。。。
    comps = [calendar components:unitFlags fromDate:dateNow];
//    long weekNumber = [comps weekday]; //获取星期对应的长整形字符串
    long day=[comps day];//获取日期对应的长整形字符串
    long year=[comps year];//获取年对应的长整形字符串
    long month=[comps month];//获取月对应的长整形字符串
//    long hour=[comps hour];//获取小时对应的长整形字符串
//    long minute=[comps minute];//获取月对应的长整形字符串
//    long second=[comps second];//获取秒对应的长整形字符串

   NSDate *date = [LHYTimeStampHelper creatTimeStampYear:(int)year month:(int)month dath:(int)day hour:0 minite:0 second:0];
    return (double)[date timeIntervalSince1970];
}


@end
