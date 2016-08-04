//
//  LeaderVC.m
//  MeiChou
//
//  Created by xinshijie on 16/8/1.
//  Copyright © 2016年 Mr.quan. All rights reserved.
//

#import "LeaderVC.h"
#import "MCMainTableViewController.h"
#import "MCTabBarViewController.h"

//屏幕宽度
#define GZScreenWidth [UIScreen mainScreen].bounds.size.width
//屏幕高度
#define GZScreenHeight [UIScreen mainScreen].bounds.size.height
@interface LeaderVC ()<UIScrollViewDelegate>


@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIPageControl *pageControl;
@property (nonatomic, strong)NSArray *imageArray;

@end

@implementation LeaderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageArray = @[@"image00", @"image01", @"image02",@"image03"];
    [self createScrollview];
    
    [self initWithData];
}

- (void)initWithData{
    
    
}

- (void)createScrollview{
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.contentSize = CGSizeMake(GZScreenWidth * self.imageArray.count, GZScreenHeight);//设置内容大小
    self.scrollView.pagingEnabled = YES;//是否分页
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    
    for (int i = 0; i < self.imageArray.count; i++) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
        img.image = [UIImage imageNamed:self.imageArray[i]];
        [self.scrollView addSubview:img];
        BOOL result = i == (self.imageArray.count-1) ? 2:0;
        if (result) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(self.view.frame.size.width/4, self.view.frame.size.height/2, self.view.frame.size.width/2, 44);
            [button setTitle:@"开启选美之旅吧!" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonToNextView) forControlEvents:UIControlEventTouchUpInside];
            [img addSubview:button];
        }
        img.userInteractionEnabled = YES;
    }
    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, GZScreenHeight - 20, GZScreenWidth, 20)];
    self.pageControl.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.pageControl];
    self.pageControl.numberOfPages = self.imageArray.count;
    self.pageControl.currentPage = 0;
}


- (void)buttonToNextView{
    MCMainTableViewController *MC = [[MCMainTableViewController alloc] init];
    self.view.window.rootViewController = MC;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.pageControl.currentPage = scrollView.contentOffset.x/self.view.frame.size.width;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
