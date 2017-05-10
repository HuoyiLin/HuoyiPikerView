//
//  LHYPickerChooseView.h
//  LHYPickerViewDemo
//
//  Created by Huoyi Lin on 2017/5/5.
//  Copyright © 2017年 Huoyi Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHYPickerViewHeadPch.h"



@protocol LHYPickerChooseViewDelegate <NSObject>

-(void)lhyPickerChooseViewGetLastReSultNSString:(NSString *)str andDataDic:(NSDictionary *)dic;

@end

@interface LHYPickerChooseView : UIView



// 不变化的arrData  字符串数组 例如 @[ @[@"hellow",@"world"],@[@"hellow",@"yours",@"world"],@[@"say",@"goodbye"] ]
@property(nonatomic,strong)NSArray <NSArray *>*arrData;
// simpleType 结果保存
@property(nonatomic,strong)NSMutableArray *arrSimpleTypeResultArray;


@property(nonatomic,strong)NSArray *arrKeys;
@property(nonatomic,strong)NSArray *arrValueKeys;
// 字典的数组 字典@{@"tagName":,@"array":}
@property(nonatomic,strong)NSArray <NSDictionary *>*arrDicTagArray;

@property(nonatomic,assign)NSInteger numberOfLevel;

@property(nonatomic,strong)NSMutableArray *arrLevelTypeResultArray;


/*
 * @arrkeys 各级标识key的Name的NSString 数组
 * @isContain 第一级是否包含
 * @arrDicTagArray 全级数组
 */

-(void)initArrayLevelKeys:(NSArray *)arrKeys andValueKeys:(NSArray *)arrValueKeys andarrDicTagArray:(NSArray <NSDictionary *> *)arrDicTagArray;


-(void)dateTypeInit;



@property(nonatomic,assign)myPikerViewType pickerType;


-(void)setYearStart:(int)yearStart toEndYear:(int)yearEnd;

@property(nonatomic,assign)int startYear;

@property(nonatomic,assign)int endYear;

@property(nonatomic,assign)int chooseYear;

@property(nonatomic,assign)int chooseMonth;

@property(nonatomic,assign)int chooseDay;

@property(nonatomic,assign)NSInteger chooseNumLvl1;
@property(nonatomic,assign)NSInteger chooseNumLvl2;
@property(nonatomic,assign)NSInteger chooseNumLvl3;
@property(nonatomic,assign)NSInteger chooseNumLvl4;
@property(nonatomic,assign)NSInteger chooseNumLvl5;


@property(nonatomic,assign)id<LHYPickerChooseViewDelegate> delegate;





@end
