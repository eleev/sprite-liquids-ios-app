//
//  LQKImageUtils.h
//  Sprite Liquids
//
//  Created by Astemir Eleev on 21/10/2017.
//  Copyright (c) 2017 Astemir Eleev
//

//#if TARGET_OS_IPHONE
#import <CoreImage/CoreImage.h>
//#else
////#import <QuartzCore/CoreImage.h>
//#endif

/* define common util functions here */
@interface LQKImageUtils : NSObject

@end

/* Attach platform specific utilities */
//#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#import "LQKImageUtils+iOSUtils.h"
typedef UIImage XXImage;
typedef UIColor XXColor;
//#else
//#import <AppKit/AppKit.h>
//#import "LQKImageUtils+OSXUtils.h"
//typedef NSImage XXImage;
//typedef NSColor XXColor;
//#endif

