//
//  MCTabBarViewController.m
//  MeiChou
//
//  Created by Mr泉 on 16/3/27.
//  Copyright © 2016年 Mr.quan. All rights reserved.
//
#import "MCTabBarViewController.h"
//#import "Example0ViewController.h"
#import "UIView+ST.h"
#import "GZRotateButtonOverlayView.h"

@interface MCTabBarViewController ()<GZRotateButtonOverlayViewDelegate>

@property (nonatomic, strong) GZRotateButtonOverlayView * overlayView;

//@property (nonatomic, strong) UIButton* btn;

@end

@implementation MCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.tabBar.tintColor = [UIColor colorWithRed:254.0f/255.0f green:51.0f/255.0f blue:121.0f/255.0f alpha:1];
    
    UIButton *plusBtn = [UIButton new];
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"形状-11"] forState:UIControlStateNormal];
    [plusBtn setBackgroundImage:[UIImage imageNamed:@"形状-11"] forState:UIControlStateHighlighted];
    
    [plusBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    plusBtn.centerX = self.tabBar.centerX -20;
    NSLog(@"%f",plusBtn.centerX);
    //调整发布按钮的中线点Y值
    plusBtn.centerY = self.tabBar.height * 0.5 - 40 ;
    
    plusBtn.size = CGSizeMake(plusBtn.currentBackgroundImage.size.width, plusBtn.currentBackgroundImage.size.height);
    
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"发布";
    label.font = [UIFont systemFontOfSize:11];
    [label sizeToFit];
    label.textColor = [UIColor grayColor];
    [self.tabBar addSubview:label];
    label.centerX = plusBtn.centerX;
    label.centerY = CGRectGetMaxY(plusBtn.frame) + 10 ;

    
    [self.tabBar addSubview:plusBtn];

    
    
}

- (void)btnClicked:(UIButton*)btn
{
    [self.view addSubview:self.overlayView];
    [self.overlayView show];
}

//离开时隐藏View
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    [self.overlayView dismiss];
}

- (GZRotateButtonOverlayView *)overlayView
{
    if (_overlayView == nil) {
        _overlayView = [[GZRotateButtonOverlayView alloc] init];
        [_overlayView setTitles:@[@"视频",@"图片"]];
        [_overlayView setTitleImages:@[@"文字",@"图片"]];
        [_overlayView setDelegate:self];
        [_overlayView setFrame:self.view.bounds];
    }
    return _overlayView;
}


#pragma mark - GZRotateButtonOverlayViewDelegate
- (void)didSelected:(NSUInteger)index
{

//        Example0ViewController *ex = [[Example0ViewController alloc]init];
//
//        [self presentViewController:ex animated:YES completion:^{
//            
//        }];
//    }
    NSLog(@"clicked %zd btn",index);
}

#pragma mark - 初始化设置tabBar上面单个按钮的方法

/**
 *
 *  设置单个tabBarButton
 *
 *  @param Vc            每一个按钮对应的控制器
 *  @param image         每一个按钮对应的普通状态下图片
 *  @param selectedImage 每一个按钮对应的选中状态下的图片
 *  @param title         每一个按钮对应的标题
 */
//- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
//{
//    GZNavigationViewController *nav = [[GZNavigationViewController alloc] initWithRootViewController:Vc];
////
//    
//    Vc.view.backgroundColor = [UIColor whiteColor];
//    
//    UIImage *myImage = [UIImage imageNamed:image];
//    
//    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
//    Vc.tabBarItem.image = myImage;
//    
//    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
//    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    Vc.tabBarItem.selectedImage = mySelectedImage;
//    
//    Vc.tabBarItem.title = title;
//    
//    Vc.navigationItem.title = title;
//    
//    [self addChildViewController:nav];
//    
//}

@end
