//
//  RLPictureView.h
//  PreviewPicture
//
//  Created by Rachel on 16/5/27.
//  Copyright © 2016年 Rachel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RLPictureView : UICollectionViewCell


@property (nonatomic,strong) void (^singleTapBlock)(UITapGestureRecognizer *tapGestureRecognizer);


-(void)setImage:(UIImage *)image;
@end
