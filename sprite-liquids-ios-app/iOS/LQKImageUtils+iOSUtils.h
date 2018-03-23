//
//  LQKImageUtils+iOSUtils.h
//  Sprite Liquids
//
//  Created by Astemir Eleev on 21/10/2017.
//  Copyright (c) 2017 Astemir Eleev
//

#import "LQKImageUtils.h"

@interface LQKImageUtils (iOSUtils)

+ (UIImage *) imageWithSize:(CGSize)size fromContextDrawBlock:(void (^) (CGContextRef))drawBlock;

@end
