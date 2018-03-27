//
//  LQKSolidColorEffect.h
//  Sprite Liquids
//
//  Created by Astemir Eleev on 21/10/2017.
//  Copyright (c) 2017 Astemir Eleev
//

#import <Foundation/Foundation.h>

#import "LQKLiquidEffect.h"

@interface SolidColorEffect : NSObject<LQKLiquidEffect>

/* Properties */
@property XXColor* color;
@property CGFloat index;
@property CGFloat width;

- (id) initWithColor:(XXColor*)color withIndex:(CGFloat)index withWidth:(CGFloat)width;

- (CIImage *) thresholdGradient;

- (CIImage *) postProcessedFrameFrom:(CIImage *)input;

@end
