//
//  SFJStarView.h
//  SFJStartViewDemo
//
//  Created by 沙缚柩 on 2017/5/15.
//  Copyright © 2017年 沙缚柩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFJStarView : UIView

@property (nonatomic, assign) IBInspectable CGFloat rating;
@property (nonatomic, assign) IBInspectable NSInteger maxStarNum;

- (instancetype)initWithFrame:(CGRect)frame maxStarNum:(NSInteger)maxStarNum;

@end
