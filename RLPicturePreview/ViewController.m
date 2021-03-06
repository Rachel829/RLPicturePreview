//
//  ViewController.m
//  RLPicturePreview
//
//  Created by Rachel on 16/9/14.
//  Copyright © 2016年 Rachel. All rights reserved.
//

#import "ViewController.h"

#import "RLPreviewPicturesViewController.h"

#import "UIView+RLSize.h"
#import "RLPictureView.h"


@interface ViewController ()

@property (nonatomic,strong) NSMutableArray * imagesArr;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setUpData];
    [self setUpUI];
    
    
}


-(void)setUpData{


    
    _imagesArr = [NSMutableArray arrayWithCapacity:0];
    
    for (int i = 1; i < 6; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%i.jpg",i];
//        UIImage *img = [UIImage imageNamed:imageName];
        [_imagesArr addObject:imageName];
    }

}


-(void)setUpUI{
    
    self.view.backgroundColor = [UIColor whiteColor];


    UIButton *pushToPreviewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    pushToPreviewBtn.width = 200;
    pushToPreviewBtn.height = 40;
    pushToPreviewBtn.centerX = SCREEN_WIDTH/2;
    pushToPreviewBtn.centerY = SCREEN_HEIGHT/2;
    [pushToPreviewBtn setTitle:@"预览图片" forState:UIControlStateNormal];
    [pushToPreviewBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [pushToPreviewBtn addTarget:self action:@selector(pushToPreviewVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushToPreviewBtn];

    

}






-(void)pushToPreviewVC{
    
    
    RLPreviewPicturesViewController *previewVC = [[RLPreviewPicturesViewController alloc]init];
    previewVC.imageArray = _imagesArr;
    
    [self.navigationController pushViewController:previewVC animated:YES];
    

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end