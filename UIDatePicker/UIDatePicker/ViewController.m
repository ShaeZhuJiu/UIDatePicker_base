//
//  ViewController.m
//  UIDatePicker
//
//  Created by 谢鑫 on 2019/7/18.
//  Copyright © 2019 Shae. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UIDatePicker *datePicker;
@property(nonatomic,strong)UIButton *button;
@end

@implementation ViewController
- (UIDatePicker *)datePicker{
    if (_datePicker==nil) {
        _datePicker=[[UIDatePicker alloc]initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 200)];
        _datePicker.datePickerMode=UIDatePickerModeDateAndTime;
        _datePicker.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    }
    return _datePicker;
}
-(UIButton *)button{
    if (_button==nil) {
        _button=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
        _button.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
        [_button setTitle:@"确定" forState:normal];
        [_button addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
        _button.backgroundColor=[UIColor redColor];
    }
    return _button;
}
- (void)clicked{
    //获取用户通过UIDatePicker设置的日期和时间
    NSDate *selected=[self.datePicker date];
    //创建一个日期格式器
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    //为日期格式器设置格式字符串
    [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm +0800"];
    //使用日期格式器格式化日期和时间
    NSString *destDateString=[dateFormatter stringFromDate:selected];
    NSString *message=[NSString stringWithFormat:@"您选择的日期是：%@",destDateString];
    //警告框
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"时间" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:[self datePicker]];
    [self.view addSubview:[self button]];
}


@end
