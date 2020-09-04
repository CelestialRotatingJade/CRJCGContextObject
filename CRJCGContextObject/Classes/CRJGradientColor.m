//
//  CRJGradientColor.m
//  CRJCGContextObject_Example
//
//  Created by zhuyuhui on 2020/9/4.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "CRJGradientColor.h"

@interface CRJGradientColor ()

@property (nonatomic) CGGradientRef   gradientRef;

@end

@implementation CRJGradientColor

+ (instancetype)gradientColorWithLocations:(CGFloat[])locations components:(CGFloat[])components count:(size_t)count {

    CRJGradientColor *gradientColor = [[[self class] alloc] init];
    
    gradientColor.locations  = locations;
    gradientColor.components = components;
    gradientColor.count      = count;
    [gradientColor createCGGradient];
    
    return gradientColor;
}

- (void)createCGGradient {

    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    self.gradientRef           = CGGradientCreateWithColorComponents(colorSpace, self.components, self.locations, self.count);
    CGColorSpaceRelease(colorSpace);
}

- (void)dealloc {

    CGGradientRelease(self.gradientRef);
}

@end
