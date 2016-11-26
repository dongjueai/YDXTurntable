//
//  TurntableView.h
//  YDXTurntable
//
//  Created by LIN on 16/11/26.
//  Copyright © 2016年 YDX. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TurntableView <NSObject>

- (void)TurnTableViewDidFinishWithIndex:(NSInteger)index;

@end

@interface TurntableView : UIView

@property (nonatomic,assign) NSInteger numberIndex;

@property (nonatomic,strong) UIButton * playButton;      // 抽奖按钮

@property (nonatomic,strong) UIImageView * rotateWheel;  // 转盘背景

@property (nonatomic,strong) NSArray * numberArray;      // 存放奖励

@property (nonatomic,assign) id <TurntableView>delegate;


@end
