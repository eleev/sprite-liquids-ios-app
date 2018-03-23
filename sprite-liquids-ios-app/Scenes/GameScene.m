//
//  GameScene.m
//  Sprite Liquids
//
//  Created by Astemir Eleev on 21/10/2017.
//  Copyright © 2017 Astemir Eleev. All rights reserved.
//

#import "GameScene.h"

#import "LQKSolidColorEffect.h"
#import "LQKCILiquidFilter.h"
#import "LQKLiquidParticleFactory.h"
#import "LQKLiquidNode.h"

@import CoreMotion;

@implementation GameScene {
    SKFieldNode* fieldNode;
    CMMotionManager* motionManager;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        
        fieldNode = [SKFieldNode magneticField];
        fieldNode.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:60];
        fieldNode.strength = 3.0;
        
        int particles = 120;
        [self createaLiquid:particles];
    }
    return self;
}

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
    
    motionManager = [CMMotionManager new];
    [motionManager startAccelerometerUpdates];
}

- (void)createaLiquid:(int) particlesCount {
    // TODO: The following function requires refactoring:
    // 1. Eliminate magical numbers
    // 2. Make it more weakly-coupled and provide possibility to change physical and visual properties of liquid particles
    
    /* Create a texturing strategy for the liquid -- built-in, or on your own */
    LQKSolidColorEffect *solidEffect = [[LQKSolidColorEffect alloc] initWithColor:[UIColor magentaColor] withIndex:100 withWidth:256];
    
    /* Create a liquid filter with the liquid texturing effect */
    LQKCILiquidFilter *filter = [[LQKCILiquidFilter alloc] initWithBlurRadius:40 withLiquidEffect:solidEffect];
    
    /* Create a liquid node with the liquid filter */
    SKNode *liquidNode = [[LQKLiquidNode alloc] initWithBlurRadius:40 withLiquidFilter:filter];
    
    /* Create a particle factory that can produce optimized particles of a given size */
    LQKLiquidParticleFactory *liquidParticleFactory = [[LQKLiquidParticleFactory alloc] initWithRadius:15];
    
    for (int p = 0; p < particlesCount; p++) {
    
        /* Spawn a single bead of liquid */
        SKNode *particleNode = [liquidParticleFactory createLiquidParticle];
        particleNode.position = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
        particleNode.physicsBody.density = 35;
        particleNode.physicsBody.mass = 0.25;
        
        /* Add the particle to the liquid so it will adopt its visual properties */
        [liquidNode addChild:particleNode];

    }
    [self addChild:liquidNode];
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
//        self.physicsWorld.gravity = CGVectorMake(data.acceleration.y * -100, data.acceleration.x * 100);
    }
     */
}

@end
