//
//  UIView+RLSize.h
//  PreviewPicture
//
//  Created by Rachel on 16/5/25.
//  Copyright © 2016年 Rachel. All rights reserved.
//

#import <UIKit/UIKit.h>


#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)


@interface UIView (RLSize)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGSize size;

@end
