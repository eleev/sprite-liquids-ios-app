//
//  LQKImageUtils+iOSUtils.m
//  Sprite Liquids
//
//  Created by Astemir Eleev on 21/10/2017.
//  Copyright (c) 2017 Astemir Eleev
//

#import "LQKImageUtils+iOSUtils.h"

@implementation LQKImageUtils (iOSUtils)

+ (UIImage *) imageWithSize:(CGSize)size fromContextDrawBlock:(void (^) (CGContextRef))drawBlock {
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    drawBlock(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
