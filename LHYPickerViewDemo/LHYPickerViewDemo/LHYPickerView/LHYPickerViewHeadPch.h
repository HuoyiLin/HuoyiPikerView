//
//  LHYPickerViewHeadPch.h
//  LHYPickerViewDemo
//
//  Created by Huoyi Lin on 2017/5/5.
//  Copyright © 2017年 Huoyi Lin. All rights reserved.
//

#ifndef LHYPickerViewHeadPch_h
#define LHYPickerViewHeadPch_h

#import "UIView+ST.h"
#import "NSCalendar+ST.h"
#import "LHYTimeStampHelper.h"

#define AFScreenWidth [UIScreen mainScreen].bounds.size.width
#define AFScreenHeight [UIScreen mainScreen].bounds.size.height

//不同设备的屏幕比例(当然倍数可以自己控制)
#define AFSizeScale (( AFScreenHeight > 667.0) ? AFScreenHeight/667.0 : 1)
//字体
#define AFSizeFont(sizeNumber)  [UIFont systemFontOfSize:sizeNumber*AFSizeScale]

#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define RGB(r,g,b) RGBA(r,g,b,1.0)

#ifdef DEBUG  ////#define AFLog(...) NSLog(__VA_ARGS__)
#define HYLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )

#else
#define HYLog(...)
#endif



typedef NS_OPTIONS(NSInteger, myPikerViewType) {
    
    simpleNoChangeType = 1 << 0,
    
    dateType = 1 << 1,
    
    dateZSSchoolType = 1 << 2,
    
    levelSecondChangingType = 1 << 3,
};

#endif /* LHYPickerViewHeadPch_h */
