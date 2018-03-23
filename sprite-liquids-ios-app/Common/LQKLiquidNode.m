//
//  LQKLiquidNode.m
//  Sprite Liquids
//
//  Created by Astemir Eleev on 21/10/2017.
//  Copyright (c) 2017 Astemir Eleev
//

#import "LQKLiquidNode.h"
#import "LQKCILiquidFilter.h"

@implementation LQKLiquidNode

- (id) initWithBlurRadius:(NSInteger)radius withLiquidFilter:(CIFilter *)filter {
    
    if (self = [super init]) {
        
        // TODO: This class will contain the logic associated with grouping child nodes
        // together and rasterizing those groups individually for opimization
        
        /* effect node properties */
        self.filter = filter;
        self.shouldRasterize = NO;
        self.shouldEnableEffects = YES;
        self.physicsBody.usesPreciseCollisionDetection= NO;
        self.shouldCenterFilter = YES;
        
    }
    return self;
}

@end
