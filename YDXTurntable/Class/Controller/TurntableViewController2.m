//
//  TurntableViewController2.m
//  YDXTurntable
//
//  Created by LIN on 16/11/26.
//  Copyright © 2016年 YDX. All rights reserved.
//

#import "TurntableViewController2.h"
#define screenW self.view.bounds.size.width
#define RADIAN_TO_DEGREE(__ANGLE__) ((__ANGLE__) * 180/M_PI)
#define DEGREE_TO_RADIAN(__ANGLE__) ((__ANGLE__) * M_PI/180.0)
@interface TurntableViewController2 ()

@property (nonatomic,strong) UIImageView * turntable;;
@property (nonatomic,assign) float angle;
@property (nonatomic,strong) NSTimer * timer;
@property (nonatomic,assign) BOOL updateEnable;

@end

@implementation TurntableViewController2

- (void)viewDidLoad
{
    _updateEnable = NO;
    _angle = 0;
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _turntable = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenW-50, screenW-50)];
    _turntable.image = [UIImage imageNamed:@"turntable.jpeg"];
    _turntable.center = self.view.center;
    [self.view addSubview:_turntable];
    
    //将NSTimer添加到NSRunloop
    NSRunLoop* runLoop = [NSRunLoop currentRunLoop];
    _timer =[ NSTimer timerWithTimeInterval:1.0f/60 target:self selector:@selector(updateMyAngle) userInfo:nil repeats:YES];
    [runLoop addTimer:_timer forMode:NSDefaultRunLoopMode];
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _updateEnable = NO;
    _angle = 0;
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    
    //1.捕捉起始点
    //2.算出相对与转盘中点的坐标
    //3.点（也就是坐标）转换成弧度
    //4.弧度转换成角度
    CGPoint previousLocation = [touch previousLocationInView:touch.view];
    CGPoint previousPoint = [self relativePoint:previousLocation and:_turntable.center];
    CGFloat previousVector = [self toAngle:previousPoint];
    CGFloat previousDrgress = RADIAN_TO_DEGREE(previousVector);
    
    //捕捉终点
    CGPoint nowLocation = [touch locationInView:touch.view];
    CGPoint nowPoint = [self relativePoint:nowLocation and:_turntable.center];
    CGFloat nowVector = [self toAngle:nowPoint];
    CGFloat nowDrgress = RADIAN_TO_DEGREE(nowVector);
    
    //得出相对角度
    _angle = -(nowDrgress - previousDrgress);
    NSLog(@"angle = %f",_angle);
    [self setRotate:_angle];
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _updateEnable = YES;
}

- (void)setRotate:(CGFloat)degress
{
    CGFloat rotate = DEGREE_TO_RADIAN(degress);
    
    CGAffineTransform transform = _turntable.transform;
    transform = CGAffineTransformRotate(transform, rotate);
    _turntable.transform = transform;
    
}

- (CGPoint)relativePoint:(CGPoint)point1 and:(CGPoint)point2
{
    CGPoint point;
    point.x = point1.x - point2.x;
    point.y = point1.y - point2.y;
    
    return point;
}

- (float)toAngle:(CGPoint)point
{
    //以弧度为单位计算并返回点 y/x 的角度值
    //该角度从圆的 x 轴（其中，0,0 表示圆心）沿逆时针方向测量
    return atan2f(point.x, point.y);
}

- (void)updateMyAngle
{
    if(_updateEnable)
    {
        if(fabs(_angle)>1)
        {
            [self setRotate:_angle];
            _angle = 0.99 * _angle;
        }
        else
        {
            _angle = 0;
        }
    }
}
@end
