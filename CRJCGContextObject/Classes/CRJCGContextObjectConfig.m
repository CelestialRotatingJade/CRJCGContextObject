//
//  CRJCGContextObjectConfig.m
//  CRJCGContextObject_Example
//
//  Created by zhuyuhui on 2020/9/4.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "CRJCGContextObjectConfig.h"

@implementation CRJCGContextObjectConfig

- (instancetype)init {
    
    if (self = [super init]) {
    
        _lineCap     = kCGLineCapButt;
        _lineJoin    = kCGLineJoinRound;
        _lineWidth   = 1.f;
        _strokeColor = [CRJRGBColor colorWithUIColor:[UIColor blackColor]];
        _fillColor   = [CRJRGBColor colorWithUIColor:[UIColor grayColor]];
        
        _phase   = 0;
        _lengths = nil;
        _count   = 0;
    }
    
    return self;
}

@end
