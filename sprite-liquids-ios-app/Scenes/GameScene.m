//
//  GameScene.m
//  Sprite Liquids
//
//  Created by Astemir Eleev on 21/10/2017.
//  Copyright © 2017 Astemir Eleev. All rights reserved.
//

#import "GameScene.h"

#import "SolidColorEffect.h"
#import "LiquidFilter.h"
#import "LiquidParticleFactory.h"
#import "LiquidNode.h"

@import CoreMotion;

@implementation GameScene {
    SKFieldNode* fieldNode;
    CMMotionManager* motionManager;
}

-(instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        
        fieldNode = [SKFieldNode magneticField];
        fieldNode.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:60];
        fieldNode.strength = 3.0;
        
        int particles = 90;
        [self createaLiquid:particles];
    }
    return self;
}

-(void)didMoveToView:(SKView *)view {
    // Setup your scene here
    
    motionManager = [CMMotionManager new];
    [motionManager startAccelerometerUpdates];
}

-(void)createaLiquid:(int) particlesCount {
    // TODO: The following function requires refactoring:
    // 1. Eliminate magical numbers
    // 2. Make it more weakly-coupled and provide possibility to change physical and visual properties of liquid particles
    
    int blurRadius = 60;
    int particleRadius = 18;
    
    /* Create a texturing strategy for the liquid -- built-in, or on your own */
    SolidColorEffect *solidEffect = [[SolidColorEffect alloc] initWithColor:[UIColor colorWithRed:0.2 green:0.2 blue:1.0 alpha:0.6] withIndex:100 withWidth:256];
    
    /* Create a liquid filter with the liquid texturing effect */
    LiquidFilter *filter = [[LiquidFilter alloc] initWithBlurRadius:blurRadius withLiquidEffect:solidEffect];
    
    /* Create a liquid node with the liquid filter */
    SKNode *liquidNode = [[LiquidNode alloc] initWithBlurRadius:blurRadius withLiquidFilter:filter];
    liquidNode.name = @"liquid-node";
    
    /* Create a particle factory that can produce optimized particles of a given size */
    LiquidParticleFactory *liquidParticleFactory = [[LiquidParticleFactory alloc] initWithRadius:particleRadius];
    
    CGFloat midX = CGRectGetMidX(self.view.bounds) / 2;
    CGFloat midY = CGRectGetMidY(self.view.bounds);
    midY = midY + 300;
    
    for (int p = 0; p < particlesCount; p++) {
        dispatch_async(dispatch_get_main_queue(), ^{
            /* Spawn a single bead of liquid */
            SKNode *particleNode = [liquidParticleFactory createLiquidParticle];
            CGPoint position = CGPointMake(midX + p / 2, midY);
            particleNode.position = position;
            particleNode.physicsBody.density = 50.0;
            particleNode.physicsBody.mass = 0.5;
            particleNode.physicsBody.restitution = 0.1;
            
            /* Add the particle to the liquid so it will adopt its visual properties */
            [liquidNode addChild:particleNode];
        });
    }
    [self addChild:liquidNode];
}

-(void) removeLiquid {
    SKNode *liquidNode = [self childNodeWithName:@"liquid-node"];
    [liquidNode removeAllChildren];
    [liquidNode removeAllActions];
    [liquidNode removeFromParent];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self addChild:fieldNode];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    for (UITouch *t in touches) {
        CGPoint location = [t locationInNode:self];
        fieldNode.position = location;
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [fieldNode removeFromParent];
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [fieldNode removeFromParent];
}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered

/*
    CMAccelerometerData* data = [motionManager accelerometerData];
    
    if (data != nil) {
        self.physicsWorld.gravity = CGVectorMake(data.acceleration.y * -1, data.acceleration.x * -1);
    }
*/
}

@end
