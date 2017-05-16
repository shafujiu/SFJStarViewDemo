//
//  SFJStarView.m
//  SFJStartViewDemo
//
//  Created by 沙缚柩 on 2017/5/15.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import "SFJStarView.h"

@interface SFJStarView ()
{
    UIImage *grayImg_;
    UIImage *yellowImg_;
}

@property (nonatomic, strong) UIView *grayView;
@property (nonatomic, strong) UIView *yellowView;

@end

@implementation SFJStarView

static NSInteger const DefaultStartNum = 5;

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self p_setupUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame maxStarNum:(NSInteger)maxStarNum{
    self = [self initWithFrame:frame];
    [self setMaxStarNum:maxStarNum];
    return self;
}

- (void)p_setupUI{
    grayImg_ = [UIImage imageNamed:@"SFJStarView.bundle/gray"];
    yellowImg_ = [UIImage imageNamed:@"SFJStarView.bundle/yellow"];
    
    self.maxStarNum = DefaultStartNum;
    [self addSubview:self.grayView];
    [self addSubview:self.yellowView];
}
// 点击事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    CGFloat rating = point.x  / self.frame.size.width;
    [self setRating:rating];
}

// 移动
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    CGFloat rating = point.x  / self.frame.size.width;
    [self setRating:rating];
}

// 扩大响应范围
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    CGRect rect = self.bounds;
    rect = CGRectInset(rect, -20, -10);
    return CGRectContainsPoint(rect, point);
}

- (void)setRating:(CGFloat)rating{
    _rating = rating;
    if (rating > 1 ) _rating = 1;
    if (rating < 0 ) _rating = 0;
    [self setNeedsLayout];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //通过 图片本身的尺寸与设置的星星视图的高 计算 缩放倍数
    CGFloat scale = self.frame.size.height / grayImg_.size.height;
    CGFloat scaleX = self.frame.size.width * 1.0 / (grayImg_.size.width * _maxStarNum);
    _grayView.transform = CGAffineTransformMakeScale(scaleX, scale);
    _yellowView.transform = CGAffineTransformMakeScale(scaleX, scale);
    
    //恢复星星起始点
    CGRect yeloFrame = _yellowView.frame;
    yeloFrame.origin = CGPointZero;
    _yellowView.frame = yeloFrame;

    _grayView.frame = self.bounds;
    
//    NSLog(@"RATING %f",_rating);
    //设置星星的宽度
    CGFloat yeloViewwidth = _rating * _grayView.frame.size.width;
    
    _yellowView.frame = CGRectMake(0, 0, yeloViewwidth, _grayView.frame.size.height);
}

- (void)setMaxStarNum:(NSInteger)maxStarNum{
    _maxStarNum = maxStarNum;
    [self setNeedsLayout];
}

- (UIView *)grayView{
    
    if (!_grayView) {
         _grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, grayImg_.size.width * _maxStarNum, grayImg_.size.height)];
        _grayView.backgroundColor = [UIColor colorWithPatternImage:grayImg_];
    }
    return _grayView;
}

- (UIView *)yellowView{
    
    if (!_yellowView) {
        _yellowView = [[UIView alloc] init];
        _yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowImg_];
    }
    return _yellowView;
}

@end
