//
//  ViewController.m
//  SFJStartViewDemo
//
//  Created by 沙缚柩 on 2017/5/15.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "ViewController.h"
#import "SFJStarView.h"


@interface ViewController ()

@property (nonatomic, strong) SFJStarView *star;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _star = [[SFJStarView alloc] initWithFrame:CGRectMake(10, 40, 100, 20)];
    _star.maxStarNum = 8;
    _star.rating = .5;
    [self.view addSubview:_star];
    
    
    SFJStarView *star = [[SFJStarView alloc] initWithFrame:CGRectMake(10, 100, 100, 20) maxStarNum:10];
    [self.view addSubview:star];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    _star.maxStarNum = 5;
    [_star setNeedsLayout];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
