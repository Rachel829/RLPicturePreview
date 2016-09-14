//
//  RLPreviewPicturesViewController.m
//  PreviewPicture
//
//  Created by Rachel on 16/5/25.
//  Copyright © 2016年 Rachel. All rights reserved.
//

#import "RLPreviewPicturesViewController.h"
#import "UIView+RLSize.h"
#import "RLPictureView.h"


@interface RLPreviewPicturesViewController()<UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>


@property (strong,nonatomic) UIScrollView *myScrollView;

@property (assign,nonatomic) NSInteger totalPage;

@property (strong,nonatomic) UICollectionView *myCollection;


@end

@implementation RLPreviewPicturesViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view = self.myCollection;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _totalPage = _imageArray.count;
    
}


-(void)viewWillLayoutSubviews{
    
    [super viewWillLayoutSubviews];
    
    _myCollection.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64);
    
    
}




-(UICollectionView *)myCollection{

    if (!_myCollection) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 64);
        layout.minimumLineSpacing = 0.0f;
        layout.minimumInteritemSpacing = 0.0f;
        _myCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) collectionViewLayout:layout];
        _myCollection.delegate = self;
        _myCollection.dataSource = self;
        _myCollection.allowsSelection = NO;
        _myCollection.pagingEnabled = YES;
        [_myCollection registerClass:[RLPictureView class] forCellWithReuseIdentifier:@"RLPictureView"];
        
    }
    
    return _myCollection;
}






-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{


    return _imageArray.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

  
    RLPictureView *pictureView = [collectionView dequeueReusableCellWithReuseIdentifier:@"RLPictureView" forIndexPath:indexPath];
    
    [pictureView setImage:_imageArray[indexPath.row]];
    
    pictureView.singleTapBlock = ^(UITapGestureRecognizer *recognizer){
    
        NSLog(@"dsfdsf");
    
    };
    
    return pictureView;

}




-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat x = scrollView.contentOffset.x;
    _currentPage = (x + SCREEN_WIDTH / 2) /  SCREEN_WIDTH;
    
    self.title = [NSString stringWithFormat:@"%li/%li",_currentPage + 1 ,(long)_totalPage];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}



@end
