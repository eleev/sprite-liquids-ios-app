//
//  LQKLiquidEffect.h
//  Sprite Liquids
//
//  Created by Astemir Eleev on 21/10/2017.
//  Copyright (c) 2017 Astemir Eleev
//

#import <Foundation/Foundation.h>

#import "LQKImageUtils.h"

@protocol LQKLiquidEffect<NSObject>

- (CIImage *) thresholdGradient;

- (CIImage *) postProcessedFrameFrom:(CIImage *)input;

@end
