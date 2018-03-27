//
//  GameViewController.m
//  Sprite Liquids
//
//  Created by Astemir Eleev on 21/10/2017.
//  Copyright © 2017 Astemir Eleev. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Load the SKScene from 'GameScene.sks'
    _scene = (GameScene *)[SKScene nodeWithFileNamed:@"GameScene"];
    
    // Set the scale mode to scale to fit the window
    _scene.scaleMode = SKSceneScaleModeAspectFit;
    
    SKView *skView = (SKView *)self.view;
    
    // Present the scene
    [skView presentScene: _scene];
    
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAllButUpsideDown;
    
    /*
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma MARK: - Actions

- (IBAction)cleanAction:(UIButton *)sender {
    [_scene removeLiquid];
    [_scene createaLiquid:90];
}

@end
