//
//  LHYPikerView.h
//  LHYPickerViewDemo
//
//  Created by Huoyi Lin on 2017/5/5.
//  Copyright © 2017年 Huoyi Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHYPickerViewHeadPch.h"

@protocol LHYPikerViewDelegate <NSObject>

-(void)lhyPickerViewGetResult:(id)data;

@end

@interface LHYPikerView : UIView

@property(nonatomic,weak)id<LHYPikerViewDelegate> delegate;

@property(nonatomic,strong)NSDictionary *dicData;

-(instancetype)initWithHeight:(CGFloat)kHeight andType:(myPikerViewType)pikerType andDelegate:(id)delegate;

-(void)pikerViewsetYearStart:(int)yearStart toEndYear:(int)yearEnd;

// 不变化的arrData 最多五列(根据需求 可以自己加) 字符串数组 例如 @[ @[@"hellow",@"world"],@[@"hellow",@"yours",@"world"],@[@"say",@"goodbye"] ]
-(void)pikerViewsetSimpleArray:(NSArray <NSArray *>*)arr;

-(void)initArrayLevelKeys:(NSArray *)arrKeys andValueKeys:(NSArray *)arrValueKeys andarrDicTagArray:(NSArray <NSDictionary *> *)arrDicTagArray;

-(void)show;

@end
