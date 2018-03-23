//
//  LQKLiquidNode.h
//  Sprite Liquids
//
//  Created by Astemir Eleev on 21/10/2017.
//  Copyright (c) 2017 Astemir Eleev
//

#import <SpriteKit/SpriteKit.h>
#import "LQKImageUtils.h"

@interface LQKLiquidNode : SKEffectNode

- (id) initWithBlurRadius:(NSInteger)radius withLiquidFilter:(CIFilter *)filter;

@end
