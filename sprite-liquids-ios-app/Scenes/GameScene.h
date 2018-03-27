//
//  GameScene.h
//  Sprite Liquids
//
//  Created by Astemir Eleev on 21/10/2017.
//  Copyright © 2017 Astemir Eleev. All rights reserved.
//


#import <SpriteKit/SpriteKit.h>

@interface GameScene : SKScene

- (void) createaLiquid:(int) particlesCount;
- (void) removeLiquid;

@end
