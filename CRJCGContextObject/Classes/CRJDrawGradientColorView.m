//
//  CRJDrawGradientColorView.m
//  CRJCGContextObject_Example
//
//  Created by zhuyuhui on 2020/9/4.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "CRJDrawGradientColorView.h"

#import "CRJCGContextObject.h"
#import "CRJGradientColor.h"

@interface CRJDrawGradientColorView ()

@property (nonatomic, strong)  CRJCGContextObject  *contextObject;

@end

@implementation CRJDrawGradientColorView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    _contextObject = [[CRJCGContextObject alloc] initWithCGContext:UIGraphicsGetCurrentContext()
                                                         config:[CRJCGContextObjectConfig new]];
    
    {
        size_t  count             = 3;
        CGFloat locations[]       = {0.0, 0.5, 1.0};
        CGFloat colorComponents[] = {
            //red, green, blue, alpha
            0.254, 0.599, 0.82,  1.0,
            0.192, 0.525, 0.75,  1.0,
            0.096, 0.415, 0.686, 1.0};
        
        CRJGradientColor *gradientColor = [CRJGradientColor gradientColorWithLocations:locations
                                                                      components:colorComponents
                                                                           count:count];
        
        [_contextObject drawLinearGradientAtClipToRect:CGRectMake(0, 0, 10, self.frame.size.height)
                                         gradientColor:gradientColor
                                            startPoint:CGPointMake(0, 0)
                                              endPoint:CGPointMake(0, self.frame.size.height)];
    }
    
    {
        size_t  count             = 4;
        CGFloat locations[]       = {0.0, 0.3, 0.7, 1.0};
        CGFloat colorComponents[] = {
            //red, green, blue, alpha
            [self randomValue], [self randomValue], [self randomValue], 1.0,
            [self randomValue], [self randomValue], [self randomValue], 1.0,
            [self randomValue], [self randomValue], [self randomValue], 1.0,
            [self randomValue], [self randomValue], [self randomValue], 1.0};
        
        CRJGradientColor *gradientColor = [CRJGradientColor gradientColorWithLocations:locations
                                                                      components:colorComponents
                                                                           count:count];
        
        [_contextObject drawLinearGradientAtClipToRect:CGRectMake(20, 0, 10, self.frame.size.height)
                                         gradientColor:gradientColor
                                            startPoint:CGPointMake(0, 0)
                                              endPoint:CGPointMake(0, self.frame.size.height)];
    }
}

- (CGFloat)randomValue {

    CGFloat value = arc4random() % 101 / 100.f;
    return value;
}

@end

