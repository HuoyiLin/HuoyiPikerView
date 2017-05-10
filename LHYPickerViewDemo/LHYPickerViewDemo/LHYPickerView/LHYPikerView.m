//
//  LHYPikerView.m
//  LHYPickerViewDemo
//
//  Created by Huoyi Lin on 2017/5/5.
//  Copyright © 2017年 Huoyi Lin. All rights reserved.
//

#import "LHYPikerView.h"

#import "LHYPikerViewToolBar.h"
#import "LHYPickerChooseView.h"



#define kHeightToolBar 44

@interface LHYPikerView()<LHYPikerViewToolBarDelegate,LHYPickerChooseViewDelegate>

@property(nonatomic,strong)UIView *toolControlBackView;

@property(nonatomic,strong)LHYPikerViewToolBar *toolBar;

@property(nonatomic,strong)LHYPickerChooseView *pikerView;

@property(nonatomic,assign)CGFloat kHeightToolCotroller;

@property(nonatomic,assign)myPikerViewType pikerType;

@end

@implementation LHYPikerView

-(instancetype)initWithHeight:(CGFloat)kHeight andType:(myPikerViewType)pikerType andDelegate:(id)delegate;
{
    if (self = [super initWithFrame:CGRectMake(0, 0, AFScreenWidth, AFScreenHeight)]) {
        
        self.kHeightToolCotroller = kHeight;
        self.pikerType = pikerType;
        self.delegate = delegate;
        self.backgroundColor = [UIColor yellowColor];
        
        [self setUpSubViews];
        
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:CGRectMake(0, 0, AFScreenWidth, AFScreenHeight)]) {
         self.kHeightToolCotroller = frame.size.height;
        self.backgroundColor = [UIColor yellowColor];
        
        [self setUpSubViews];
    }
    return self;
}

-(void)setUpSubViews;
{
 
    
    // 回收手势
    UITapGestureRecognizer *tap  = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
    
    //Controller栏高
    self.toolControlBackView = [[UIView alloc]initWithFrame:CGRectMake(0, AFScreenHeight ,AFScreenWidth , self.kHeightToolCotroller)];
    self.toolControlBackView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.toolControlBackView];
    
    //toolBar
    self.toolBar = [[LHYPikerViewToolBar alloc]initWithFrame:CGRectMake(0, 0, AFScreenWidth, kHeightToolBar)];
    self.toolBar.delegate = self;
    [self.toolControlBackView addSubview:self.toolBar];
    
    //pickerView
    self.pikerView = [[LHYPickerChooseView alloc]initWithFrame:CGRectMake(0, kHeightToolBar, AFScreenWidth, self.toolControlBackView.frame.size.height - kHeightToolBar)];
    self.pikerView.delegate = self;
    self.pikerView.pickerType = self.pikerType;// simpleNoChangeType  dateZSSchoolType dateType]
    // 初始化
    [self.pikerView dateTypeInit];
    [self.toolControlBackView addSubview:self.pikerView];
    
}
-(void)pikerViewsetYearStart:(int)yearStart toEndYear:(int)yearEnd;
{
   [self.pikerView setYearStart:yearStart toEndYear:yearEnd];
}
-(void)pikerViewsetSimpleArray:(NSArray <NSArray *>*)arr;
{
    self.pikerView.arrData = arr;
}
-(void)show;
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [self setCenter:[UIApplication sharedApplication].keyWindow.center];
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:self];
    
    CGRect frameTool = self.toolControlBackView.frame;
    frameTool.origin.y -= self.kHeightToolCotroller;
    
    [UIView animateWithDuration:0.33 animations:^{
        [self.layer setOpacity:1];
        self.toolControlBackView.frame = frameTool;
    } completion:^(BOOL finished) {
    }];
}
-(void)dismiss;
{
    CGRect frameTool = self.toolControlBackView.frame;
    frameTool.origin.y += self.kHeightToolCotroller;
    [UIView animateWithDuration:0.33 animations:^{
        [self.layer setOpacity:0];
        self.toolControlBackView.frame = frameTool;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
-(void)lhyPikerViewBtnDidSelectAction:(NSString *)title
{
    if ([title isEqualToString:@"确定"]) {
        if (self.pikerType == dateZSSchoolType) {
           
            [self.delegate lhyPickerViewGetResult:self.dicData];
        }else if (self.pikerType == dateType)
        {
            [self.delegate lhyPickerViewGetResult:self.dicData];
        }else if (self.pikerType == simpleNoChangeType)
        {
            [self.delegate lhyPickerViewGetResult:self.dicData];
        }else if (self.pikerType == levelSecondChangingType)
        {
            [self.delegate lhyPickerViewGetResult:self.dicData];
        }
         [self dismiss];
        
//        [self.toolBar.btnTitle setTitle:@"ads" forState:UIControlStateNormal];
    }else
    {
        [self dismiss];
    }
}
-(void)lhyPickerChooseViewGetLastReSultNSString:(NSString *)str andDataDic:(NSDictionary *)dic
{
    [self.toolBar.btnTitle setTitle:str forState:UIControlStateNormal];
    self.dicData = dic;
}
-(void)initArrayLevelKeys:(NSArray *)arrKeys andValueKeys:(NSArray *)arrValueKeys andarrDicTagArray:(NSArray<NSDictionary *> *)arrDicTagArray
{
    [self.pikerView initArrayLevelKeys:arrKeys andValueKeys:arrValueKeys andarrDicTagArray:arrDicTagArray];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
