
//  ViewController.m
//  LHYPickerViewDemo
//
//  Created by Huoyi Lin on 2017/5/5.
//  Copyright © 2017年 Huoyi Lin. All rights reserved.
//

#import "ViewController.h"
#import "LHYPikerView.h"
//#import "LHYPickerViewHeadPch.h"



@interface ViewController ()<LHYPikerViewDelegate>

@property(nonatomic,strong)LHYPikerView *pickerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnAction:(UIButton *)sender {
    
    // dateType
//    self.pickerView = [[LHYPikerView alloc]initWithHeight:250.0 andType:dateType andDelegate:self];
//    [self.pickerView pikerViewsetYearStart:1997 toEndYear:2008];
//    [self.pickerView show];
    
//    // simpleType
//    self.pickerView = [[LHYPikerView alloc]initWithHeight:250.0 andType:simpleNoChangeType andDelegate:self];
//    [self.pickerView pikerViewsetSimpleArray: @[ @[@"hellow",@"world"],@[@"hellow",@"yours",@"world"],@[@"say",@"goodbye"] ]];
//    [self.pickerView show];
    

    //
//    self.pickerView = [[LHYPikerView alloc]initWithHeight:250.0 andType:levelSecondChangingType andDelegate:self];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"ProvincesAndCities" ofType:@"plist"];
//    NSArray * arr =[NSArray arrayWithContentsOfFile:path];
//    
//    [self.pickerView initArrayLevelKeys:@[@"Cities"] andValueKeys:@[@"State",@"city"] andarrDicTagArray:arr];
//    [self.pickerView show];
    
    self.pickerView = [[LHYPikerView alloc]initWithHeight:250.0 andType:levelSecondChangingType andDelegate:self];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"address" ofType:@"plist"];
    NSArray * arr =[NSArray arrayWithContentsOfFile:path];
    
    [self.pickerView initArrayLevelKeys:@[@"sub"] andValueKeys:@[@"name",@"name"] andarrDicTagArray:arr];
    [self.pickerView show];
    
}
-(void)lhyPickerViewGetResult:(id)data
{
    HYLog(@"data = %@",data);
}

@end
