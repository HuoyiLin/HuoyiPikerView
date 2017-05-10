//
//  LHYPikerViewToolBar.m
//  LHYPickerViewDemo
//
//  Created by Huoyi Lin on 2017/5/5.
//  Copyright © 2017年 Huoyi Lin. All rights reserved.
//

#import "LHYPikerViewToolBar.h"
#import "LHYPickerViewHeadPch.h"

#define kBtnSideMargin 0
#define kBtnWith AFScreenWidth/6

@interface LHYPikerViewToolBar()

@property(nonatomic,strong)UIButton *btnSure;

@property(nonatomic,strong)UIButton *btnCancel;


@end

@implementation LHYPikerViewToolBar

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor cyanColor];
        self.userInteractionEnabled = YES;
        [self setUpButtons];
    }
    return self;
}
-(void)setUpButtons;
{
    self.btnSure = [self huoyi_creatbuttonTitle:@"确定" imageName:@"" backGroundColor:[UIColor whiteColor] titleColor:RGB(55,195,155) titleFontSize:13 cornerRadius:0];
    self.btnSure.frame  = CGRectMake(AFScreenWidth - kBtnWith - kBtnSideMargin, 0 , kBtnWith, self.frame.size.height);
    [self addSubview:self.btnSure];
    
    self.btnCancel = [self huoyi_creatbuttonTitle:@"取消" imageName:@"" backGroundColor:[UIColor whiteColor] titleColor:RGB(55,195,155) titleFontSize:13 cornerRadius:0];
    self.btnCancel.frame  = CGRectMake(kBtnSideMargin, 0 , kBtnWith, self.frame.size.height);
    [self addSubview:self.btnCancel];
    
    self.btnTitle = [self huoyi_creatbuttonTitle:@"" imageName:@"" backGroundColor:[UIColor whiteColor] titleColor:[UIColor blackColor] titleFontSize:13 cornerRadius:0];
    self.btnTitle.frame  = CGRectMake(kBtnWith + kBtnSideMargin, 0 ,AFScreenWidth - kBtnWith -  kBtnWith, self.frame.size.height);
    [self addSubview:self.btnTitle];
    
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor colorWithWhite:214.0/255.0 alpha:1];
    lineView.frame = CGRectMake(0, self.height - 1/[UIScreen mainScreen].scale, AFScreenWidth, 1/[UIScreen mainScreen].scale);
    [self addSubview:lineView];
    
    UIView *lineViewTop = [UIView new];
    lineViewTop.backgroundColor = [UIColor colorWithWhite:214.0/255.0 alpha:1];
    lineViewTop.frame = CGRectMake(0, 0, AFScreenWidth, 1/[UIScreen mainScreen].scale);
    [self addSubview:lineViewTop];
    
   [self.btnCancel addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
   [self.btnSure addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
}
-(UIButton *)huoyi_creatbuttonTitle:(NSString *)btnTitle
                          imageName:(NSString *)btnImageName
                    backGroundColor:(UIColor *)backGroundColor
                         titleColor:(UIColor *)titleColor
                      titleFontSize:(NSInteger)sizeOfFont
                       cornerRadius:(CGFloat)radius;
{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:btnTitle forState:UIControlStateNormal];
    if (btnImageName) {
        [btn setImage:[UIImage imageNamed:btnImageName] forState:UIControlStateNormal];
    }
    
    [btn setTitleColor:titleColor?titleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = backGroundColor;
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = radius;
    [btn.titleLabel setFont:AFSizeFont(sizeOfFont)];
    return btn;
    
}
-(void)btnAction:(UIButton *)sender;
{
    [self.delegate lhyPikerViewBtnDidSelectAction:sender.titleLabel.text];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
