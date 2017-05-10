//
//  LHYPickerChooseView.m
//  LHYPickerViewDemo
//
//  Created by Huoyi Lin on 2017/5/5.
//  Copyright © 2017年 Huoyi Lin. All rights reserved.
//

#import "LHYPickerChooseView.h"


@interface LHYPickerChooseView()<UIPickerViewDelegate,UIPickerViewDataSource>

@property(nonatomic,strong)UIPickerView *piker;

@property(nonatomic,strong)NSArray *arr1;

@property(nonatomic,strong)NSArray *arr2;

@property(nonatomic,strong)NSArray *arr3;

@property(nonatomic,strong)NSArray *arr4;

@property(nonatomic,strong)NSArray *arr5;


@end

@implementation LHYPickerChooseView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
      
    }
    return self;
}
-(void)setUpsubViews;
{
    self.piker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.piker.delegate = self;
    self.piker.dataSource = self;
    
    if (self.pickerType == dateType || self.pickerType == dateZSSchoolType) {
        if (self.startYear == 0) {
            self.startYear = 1970;
        }
        if (self.endYear  == 0) {
            self.endYear = (int)[NSCalendar currentYear] + 5;
        }
        
        self.chooseYear = self.startYear;
        self.chooseMonth = 1;
        self.chooseDay = 1;
        [self.piker selectRow:0 inComponent:0 animated:NO];
        [self.piker selectRow:0 inComponent:1 animated:NO];
        [self.piker selectRow:0 inComponent:2 animated:NO];
        
    }else if(self.pickerType == simpleNoChangeType)
    {
        [self.arrSimpleTypeResultArray removeAllObjects];
        for (int i = 0; i < self.arrData.count; i ++) {
            [self.piker selectRow:0 inComponent:i animated:NO];
            [self.arrSimpleTypeResultArray addObject:self.arrData[i].firstObject];
        }
        
    }else if (self.pickerType == levelSecondChangingType)
    {
        for (int i = 0; i < self.numberOfLevel; i ++) {
            [self.piker selectRow:0 inComponent:i animated:NO];
//            [self.arrSimpleTypeResultArray addObject:self.arrData[i].firstObject];
        }
        for (int component = 0; component < self.numberOfLevel; component ++) {
            NSString *  title = @"";
            switch (component) {
                case 0:
                {
                    title = self.arrDicTagArray[self.chooseNumLvl1][self.arrValueKeys[component]];
                    [self.arrLevelTypeResultArray addObject:title];
                }
                    break;
                case 1:
                {
                    NSArray *arr = self.arrDicTagArray[self.chooseNumLvl1][self.arrKeys[component - 1]];
                    title = arr[self.chooseNumLvl2][self.arrValueKeys[component]];
                    [self.arrLevelTypeResultArray addObject:title];
                }
                    break;
                case 2:
                {
                    
                }
                    break;
                    
                case 3:
                {
                    
                }
                    break;
                    
                default:
                {
                    
                }
                    break;
            }
        }
        
    }
    
   
    [self addSubview:self.piker];
    [self showResult];
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (self.pickerType) {
        case simpleNoChangeType:
        {
            switch (component) {
                case 0:
                    return self.arrData[0].count;
                    break;
                case 1:
                    return self.arrData[1].count;
                    break;
                case 2:
                    return self.arrData[2].count;
                    break;
                case 3:
                    return self.arrData[3].count;
                    break;
                    
                default:
                    return self.arrData[4].count;
                    break;
            }
        }
            break;
        case dateType:
        {
            switch (component) {
                case 0:
                    return self.endYear- self.startYear + 1;
                    break;
                case 1:
                    return 12;
                    break;
                case 2:
                    return [NSCalendar getDaysWithYear:(NSInteger)self.chooseYear month:(NSInteger)self.chooseMonth];
                    break;
                    
                default:
                    return 0;
                    break;
            }
        }
            break;
        case dateZSSchoolType:
        {
            switch (component) {
                case 0:
                    return self.endYear- self.startYear + 1;
                    break;
                case 1:
                    return 12;
                    break;
                case 2:
                    return 3;
                    break;
                case 3:
                    return 3;
                    break;
                    
                default:
                    return self.arrData[4].count;
                    break;
            }
        }
            break;
            case levelSecondChangingType:
        {
            
            if (component == 0) {
                return self.arrDicTagArray.count;
            }
            else if(component == 1)
            {
                NSArray *arr = self.arrDicTagArray[self.chooseNumLvl1][self.arrKeys[component - 1]];
                return arr.count;
            }
            else if(component == 2)
            {
                NSArray *arr = self.arrDicTagArray[self.chooseNumLvl2][self.arrKeys[component - 1]];
                return arr.count;
            }
            else if(component == 3)
            {
                NSArray *arr = self.arrDicTagArray[self.chooseNumLvl3][self.arrKeys[component - 1]];
                return arr.count;
            }
            else //if(component == 4)
            {
                NSArray *arr = self.arrDicTagArray[self.chooseNumLvl4][self.arrKeys[component - 1]];
                return arr.count;
            }
          

        }
            break;
            
            
        default:
            return 1;
            break;
    }
   
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    switch (self.pickerType) {
        case simpleNoChangeType:
        {
            return self.arrData.count;
        }
            break;
        case dateType:
        {
            return 3;
        }
            break;
        case dateZSSchoolType:
        {
            return 3;
        }
            break;
            
        case levelSecondChangingType:
        {
            return self.numberOfLevel;
        }
            break;

            
        default:
            return 1;
            break;
    }

   
}
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if (self.pickerType == dateZSSchoolType) {
        NSString *  title = [NSString string];
        NSArray *arr = @[@"上旬",@"中旬",@"下旬"];
        if (component == 0) {
           title = [self stringAddPlacrHodelZero:(long)row + self.startYear];
        }else  if (component == 1)
        {
            title = [self stringAddPlacrHodelZero:(long)row + 1];
        }else if (component == 2) {
            title = arr[row];
        }
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, AFScreenWidth - 140, 39)];
        label.text = title;
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;//NSTextAlignmentLeft;
        
        for(UIView *singleLine in self.piker.subviews)
        {
            if (singleLine.frame.size.height < 1)
            {
                singleLine.backgroundColor = [UIColor colorWithWhite:243/255.0 alpha:1];
            }
        }
        return label;
    }
    
    if (self.pickerType == dateType) {
        NSString *  title = [NSString string];
        if (component == 0) {
            title = [self stringAddPlacrHodelZero:(long)row + self.startYear];
        }else  if (component == 1)
        {
            title = [self stringAddPlacrHodelZero:(long)row + 1];
        }else if (component == 2) {
            title = [self stringAddPlacrHodelZero:(long)row + 1];
        }
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, AFScreenWidth - 140, 39)];
        label.text = title;
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;//NSTextAlignmentLeft;
        
        for(UIView *singleLine in self.piker.subviews)
        {
            if (singleLine.frame.size.height < 1)
            {
                singleLine.backgroundColor = [UIColor colorWithWhite:243/255.0 alpha:1];
            }
        }
        return label;
    }
    if (self.pickerType == simpleNoChangeType) {
        
        NSString *  title = self.arrData[component][row];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, AFScreenWidth - 140, 39)];
        label.text = title;
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;//NSTextAlignmentLeft;
        
        for(UIView *singleLine in self.piker.subviews)
        {
            if (singleLine.frame.size.height < 1)
            {
                singleLine.backgroundColor = [UIColor colorWithWhite:243/255.0 alpha:1];
            }
        }
        return label;
    }
    if (self.pickerType == levelSecondChangingType) {
         NSString *  title = @"adsad";
                switch (component) {
                    case 0:
                    {
                        title = self.arrDicTagArray[row][self.arrValueKeys[component]];
                    }
                        break;
                    case 1:
                    {
                        NSArray *arr = self.arrDicTagArray[self.chooseNumLvl1][self.arrKeys[component - 1]];
                        title = arr[row][self.arrValueKeys[component]];
                    }
                        break;
                    case 2:
                    {
        
                    }
                        break;
        
                    case 3:
                    {
        
                    }
                        break;
        
                    default:
                    {
        
                    }
                        break;
                }
        

       
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, AFScreenWidth - 140, 39)];
        label.text = title;
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;//NSTextAlignmentLeft;
        
        for(UIView *singleLine in self.piker.subviews)
        {
            if (singleLine.frame.size.height < 1)
            {
                singleLine.backgroundColor = [UIColor colorWithWhite:243/255.0 alpha:1];
            }
        }
        return label;
    }
    
    return [UILabel new];

}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return AFScreenWidth/3.0;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return self.piker.height/5.0;
}
//-(CGSize) rowSizeForComponent: (NSInteger) component;
//{
//    return CGSizeMake(AFScreenWidth/3.0, self.frame.size.height/3.0);
//}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (self.pickerType == dateType) {
        if (component == 0) {
             self.chooseYear = self.startYear + (int)row;
        }else if(component == 1)
        {
            self.chooseMonth = 1 + (int)row;
        }else if(component == 2)
        {
            self.chooseDay = 1 + (int)row;
        }
        [self.piker reloadAllComponents];
        [self showResult];
       
    }else if (self.pickerType == dateZSSchoolType)
    {
        if (component == 0) {
            self.chooseYear = self.startYear + (int)row;
        }else if(component == 1)
        {
            self.chooseMonth = 1 + (int)row;
        }else if(component == 2)
        {
            if (row == 0) {
                self.chooseDay = 1;
            }else if (row == 1)
            {
                self.chooseDay = 14;
            }else
            {
                 self.chooseDay = 27;
            }
        }
        [self.piker reloadAllComponents];
        [self showResult];

    }else if (self.pickerType == simpleNoChangeType)
    {
        if (self.arrSimpleTypeResultArray.count > component) {
            [self.arrSimpleTypeResultArray replaceObjectAtIndex:component withObject:self.arrData[component][row]];
        }else
        {
            HYLog(@"SimpleType 数组 出错");
        }
         [self showResult];
    }else
    {
        switch (component) {
            case 0:
            {
                self.chooseNumLvl1 = row;
                self.chooseNumLvl2 = 0;
                self.chooseNumLvl3 = 0;
                self.chooseNumLvl4 = 0;
                self.chooseNumLvl5 = 0;
                
            }
                break;
            case 1:
            {
                self.chooseNumLvl2 = row;
                self.chooseNumLvl3 = 0;
                self.chooseNumLvl4 = 0;
                self.chooseNumLvl5 = 0;
                
            }
                break;
            case 2:
            {
                self.chooseNumLvl3 = row;
                self.chooseNumLvl4 = 0;
                self.chooseNumLvl5 = 0;
            }
                break;
            case 3:
            {
                self.chooseNumLvl4 = row;
                self.chooseNumLvl5 = 0;
            }
                break;
            case 4:
            {
                self.chooseNumLvl5 = row;
            }
                break;
                
            default:
                break;
        }

         [self.piker reloadAllComponents];
        if (self.arrLevelTypeResultArray.count > component) {
            NSString *  title = @"";
            switch (component) {
                case 0:
                {
                   NSString * title1 = self.arrDicTagArray[self.chooseNumLvl1][self.arrValueKeys[component]];
                    [self.arrLevelTypeResultArray replaceObjectAtIndex:0 withObject:title1];
                    if (self.numberOfLevel > 1) {
                        NSArray *arr = self.arrDicTagArray[self.chooseNumLvl1][self.arrKeys[component]];
                      NSString *  title2 = arr[self.chooseNumLvl2][self.arrValueKeys[component + 1]];
                        [self.arrLevelTypeResultArray replaceObjectAtIndex:1 withObject:title2];
                    }

                }
                    break;
                case 1:
                {
                    NSArray *arr = self.arrDicTagArray[self.chooseNumLvl1][self.arrKeys[component - 1]];
                    title = arr[self.chooseNumLvl2][self.arrValueKeys[component]];
                     [self.arrLevelTypeResultArray replaceObjectAtIndex:1 withObject:title];
                }
                    break;
                case 2:
                {
                    
                }
                    break;
                    
                case 3:
                {
                    
                }
                    break;
                    
                default:
                {
                    
                }
                    break;
            }

//            [self.arrLevelTypeResultArray replaceObjectAtIndex:component withObject:self.arrData[component][row]];
        }else
        {
            HYLog(@"SimpleType 数组 出错");
        }
        [self showResult];
       
    }
}
// 保存并展示结果 （btnTitle）
-(void)showResult;
{
    if (self.pickerType == dateType) {
        
        NSDate *date = [LHYTimeStampHelper timeStringChangeToTimeDate:[NSString stringWithFormat:@"%d-%@-%@ 08:00:00",self.chooseYear,[self stringAddPlacrHodelZero:self.chooseMonth],[self stringAddPlacrHodelZero:self.chooseDay]] timeFormatter:@"YYYY-MM-dd HH:mm:ss"];
        [self.delegate lhyPickerChooseViewGetLastReSultNSString:[NSString stringWithFormat:@"%d-%@-%@",self.chooseYear,[self stringAddPlacrHodelZero:self.chooseMonth],[self stringAddPlacrHodelZero:self.chooseDay]] andDataDic:@{@"date":date}];
    }else if (self.pickerType == dateZSSchoolType)
    {
        NSString *strTree = [NSString string];
        if (self.chooseDay == 1) {
           strTree = @"上旬";
        }else if (self.chooseDay == 14)
        {
            strTree = @"中旬";
        }else
        {
             strTree = @"下旬";
        }
        
       
        
        NSString *dateString = [NSString stringWithFormat:@"%d-%@-%@ 08:00:00",self.chooseYear,[self stringAddPlacrHodelZero:self.chooseMonth],[self stringAddPlacrHodelZero:self.chooseDay]];
        NSString *dateStringRes = [NSString stringWithFormat:@"%d-%@-%@",self.chooseYear,[self stringAddPlacrHodelZero:self.chooseMonth],strTree];
        NSDate *date = [LHYTimeStampHelper timeStringChangeToTimeDate:dateString timeFormatter:@"YYYY-MM-dd HH:mm:ss"];
        
        [self.delegate lhyPickerChooseViewGetLastReSultNSString:dateStringRes andDataDic:@{@"date":date,@"dateString":dateStringRes}];
    }else if(self.pickerType == simpleNoChangeType)
    {
        
        __block  NSString * str = @"";
         [self.arrSimpleTypeResultArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if ([str isEqualToString:@""]) {
                str = [NSString stringWithFormat:@"%@%@",str,obj];
            }else
            {
                str = [NSString stringWithFormat:@"%@-%@",str,obj];
            }
            
        }];
        [self.delegate lhyPickerChooseViewGetLastReSultNSString:str andDataDic:@{@"stringRusult":str}];
        
    }else if(self.pickerType == levelSecondChangingType)
    {
        __block  NSString * str = @"";
        [self.arrLevelTypeResultArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if ([str isEqualToString:@""]) {
                str = [NSString stringWithFormat:@"%@%@",str,obj];
            }else
            {
                str = [NSString stringWithFormat:@"%@-%@",str,obj];
            }
            
        }];
        [self.delegate lhyPickerChooseViewGetLastReSultNSString:str andDataDic:@{@"stringRusult":str}];
    }
    
}
-(void)dateTypeInit;
{
     [self setUpsubViews];
}
-(void)setArrData:(NSArray<NSArray *> *)arrData
{
      _arrData = arrData;
    
    [self.piker removeFromSuperview];
    [self setUpsubViews];
    
    [self.piker reloadAllComponents];
}
-(void)setYearStart:(int)yearStart toEndYear:(int)yearEnd;
{
    self.endYear = yearEnd;
    self.startYear = yearStart;
    
    [self.piker removeFromSuperview];
    [self setUpsubViews];
    
    [self.piker reloadAllComponents];
    
 
}
-(void)initArrayLevelKeys:(NSArray *)arrKeys andValueKeys:(NSArray *)arrValueKeys andarrDicTagArray:(NSArray <NSDictionary *> *)arrDicTagArray;
{

    self.arrKeys = arrKeys;
    self.arrDicTagArray = arrDicTagArray;
    self.arrValueKeys = arrValueKeys;

        self.numberOfLevel = arrKeys.count + 1;
//        for (NSInteger i = 0; i < self.arrKeys.count + 1; i ++) {
//            switch (i) {
//                case 0:
//                self.arr1 = self.arrDicTagArray;
//                break;
//                    case 1:
//                {
//                    
//                }
//                    break；
//                    
//                default:
//                    break;
//            }
//        }
//    
    
    [self.piker removeFromSuperview];
    [self setUpsubViews];
    
    [self.piker reloadAllComponents];
}

-(NSString *)stringAddPlacrHodelZero:(long)number;
{
    if (number < 10) {
        return [NSString stringWithFormat:@"0%ld",number];
    }else
    {
         return [NSString stringWithFormat:@"%ld",number];
    }
}
- (NSMutableArray *)arrSimpleTypeResultArray
{
    if (_arrSimpleTypeResultArray == nil) {
        // 初始化
        _arrSimpleTypeResultArray = [[NSMutableArray alloc] init];
    }
    return _arrSimpleTypeResultArray;
}
- (NSMutableArray *)arrLevelTypeResultArray
{
    if (_arrLevelTypeResultArray == nil) {
        // 初始化
        _arrLevelTypeResultArray = [[NSMutableArray alloc] init];
    }
    return _arrLevelTypeResultArray;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
