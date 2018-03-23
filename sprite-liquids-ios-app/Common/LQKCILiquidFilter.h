//
//  LQKLiquidEffect.h
//  Sprite Liquids
//
//  Created by Astemir Eleev on 21/10/2017.
//  Copyright (c) 2017 Astemir Eleev
//

//#if TARGET_OS_IPHONE
#import <CoreImage/CoreImage.h>
//#else
//#import <QuartzCore/CoreImage.h>
//#endif

#import "LQKLiquidEffect.h"

@interface LQKCILiquidFilter: CIFilter {
    CIImage *inputImage;
}

@property (retain, nonatomic) CIImage *inputImage;

@property CIFilter *threshFilter;
@property CIFilter *compositeFilter;
@property CIFilter *blurFilter;
@property CIImage *backgroundColor;

@property CGFloat blurRadius;
@property NSObject<LQKLiquidEffect> *liquidEffect;

- (id) initWithBlurRadius:(CGFloat)blurRadius withLiquidEffect:(NSObject<LQKLiquidEffect>*)liquidEffect;

@end

