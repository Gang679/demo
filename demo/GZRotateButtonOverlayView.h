//
//  RotateBtnView.h
//  MeiChou
//
//  Created by Mr泉 on 16/5/27.
//  Copyright © 2016年 Mr.quan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GZRotateButtonOverlayViewDelegate <NSObject>

//when item clicked call this

- (void)didSelected:(NSUInteger)index;

@end

@interface GZRotateButtonOverlayView : UIView

@property (nonatomic, weak) id<GZRotateButtonOverlayViewDelegate> delegate;
//初始化使用的菜单名称
//the titles
@property (nonatomic, strong) NSArray* titles;
//初始化使用的菜单图片
//the titls images
@property (nonatomic, strong) NSArray* titleImages;
//展示
//show the overlay
- (void)show;
//消失
//dismiss the overlay
- (void)dismiss;
@end
