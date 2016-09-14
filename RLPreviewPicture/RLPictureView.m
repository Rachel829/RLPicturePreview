//
//  RLPictureView.m
//  PreviewPicture
//
//  Created by Rachel on 16/5/27.
//  Copyright © 2016年 Rachel. All rights reserved.
//

#import "RLPictureView.h"
#import "UIView+RLSize.h"
#define kMinZoomScale 1.0f
#define kMaxZoomScale 2.0f

@interface RLPictureView ()<UIScrollViewDelegate>

@property (nonatomic,strong) UITapGestureRecognizer *doubleTap;
@property (nonatomic,strong) UITapGestureRecognizer *singleTap;


@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIScrollView *scrollView;



@end



@implementation RLPictureView

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.scrollView];
        
        [self addGestureRecognizer:self.doubleTap];

        [self addGestureRecognizer:self.singleTap];
        
    }
    self.backgroundColor = [UIColor blackColor];

    return self;
}


-(UIScrollView *)scrollView{

    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.frame = CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT);
        [_scrollView addSubview:self.imageView];
        _scrollView.delegate = self;
        _scrollView.clipsToBounds = YES;
        _scrollView.minimumZoomScale = kMinZoomScale;
        _scrollView.maximumZoomScale = kMaxZoomScale;
        _scrollView.zoomScale = 1.0f;
        
    }
    
    return _scrollView;
}


-(UIImageView *)imageView{

    if(!_imageView){
        _imageView = [[UIImageView alloc]init];
        _imageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        _imageView.userInteractionEnabled = YES;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        
    }

    return _imageView;
}

-(UITapGestureRecognizer *)doubleTap{

    if (!_doubleTap) {
        _doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleDoubleTap:)];
        _doubleTap.numberOfTapsRequired = 2;
        _doubleTap.numberOfTouchesRequired = 1;
    
    }

    return _doubleTap;
}


-(UITapGestureRecognizer *)singleTap{

    if (!_singleTap) {
        _singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTap:)];
        _singleTap.numberOfTouchesRequired = 1;
        _singleTap.numberOfTapsRequired = 1;
        [_singleTap requireGestureRecognizerToFail:self.doubleTap];
    }

    return _singleTap;

}

-(void)handleDoubleTap:(UITapGestureRecognizer *)recognizer{

    CGPoint touchPoint =[recognizer locationInView:self];
    
    if (self.scrollView.zoomScale <= 1.0) {
    
        CGFloat scaleX = touchPoint.x + self.scrollView.contentOffset.x;
        CGFloat scaleY = touchPoint.y + self.scrollView.contentOffset.y;
        [self.scrollView zoomToRect:CGRectMake(scaleX, scaleY, 10, 10) animated:YES];
        
    }else{
        
        [self.scrollView setZoomScale:1.0 animated:YES];

    }
    
  

}

-(void)handleSingleTap:(UITapGestureRecognizer *)recognizer{
  

    
    if (self.singleTapBlock) {
        self.singleTapBlock(recognizer);
    }
    
}



-(void)setImage:(UIImage *)image {

    [_imageView setImage:image];
  
    CGFloat imageHeight = SCREEN_WIDTH * image.size.height/image.size.width;
   
    _imageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, imageHeight);
    
    if(imageHeight < SCREEN_HEIGHT) {
        
        
        _imageView.center = CGPointMake(SCREEN_WIDTH * 0.5, self.height * 0.5);

    }
    
    [self.scrollView setZoomScale:1.0];


}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{

   
    return self.imageView;
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView{

  self.imageView.center = [self centerOfScrollViewContent:scrollView];
    
}

- (CGPoint)centerOfScrollViewContent:(UIScrollView *)scrollView
{
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    CGPoint actualCenter = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                                       scrollView.contentSize.height * 0.5 + offsetY);
    return actualCenter;
}

-(void)layoutSubviews{

    [super layoutSubviews];

    _scrollView.frame = self.bounds;
}

@end
