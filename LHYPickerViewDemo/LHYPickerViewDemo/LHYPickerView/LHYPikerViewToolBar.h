//
//  LHYPikerViewToolBar.h
//  LHYPickerViewDemo
//
//  Created by Huoyi Lin on 2017/5/5.
//  Copyright © 2017年 Huoyi Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  LHYPikerViewToolBarDelegate<NSObject>

-(void)lhyPikerViewBtnDidSelectAction:(NSString *)title;

@end


@interface LHYPikerViewToolBar : UIView

@property(nonatomic,assign)id<LHYPikerViewToolBarDelegate> delegate;

@property(nonatomic,strong)UIButton *btnTitle;

@end
