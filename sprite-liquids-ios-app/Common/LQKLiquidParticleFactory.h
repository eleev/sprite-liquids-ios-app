//
//  LQKLiquidParticleFactory.h
//  Sprite Liquids
//
//  Created by Astemir Eleev on 21/10/2017.
//  Copyright (c) 2017 Astemir Eleev
//

#import <SpriteKit/SpriteKit.h>

@interface LQKLiquidParticleFactory : NSObject

/* Constants */
extern const CGFloat CIRCLE_COLOR[];

/* Properties */
@property CGFloat circleRadius;
@property SKTexture *circleTexture;

/* Instance methods */
- (id) initWithRadius:(CGFloat)radius;

- (SKNode*) createLiquidParticle;

@end
