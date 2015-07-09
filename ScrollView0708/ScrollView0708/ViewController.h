//
//  ViewController.h
//  ScrollView0708
//
//  Created by yishain on 7/9/15.
//  Copyright (c) 2015 yishain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>
{
    UIImageView *imageView;
    int pageCount;
    NSMutableDictionary *pageDic; }

@property(nonatomic,assign) id<UIScrollViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIPageControl *pageCtl;
@property (weak, nonatomic) IBOutlet UIScrollView *testScrollView;
@property(nonatomic) CGSize contentSize;
@property(nonatomic) CGPoint contentOffset;
@property(nonatomic) float minimumZoomScale; @property(nonatomic) float maximumZoomScale;
@property(nonatomic) float zoomScale;
@property(nonatomic,getter=isPagingEnabled)
BOOL pagingEnabled;
- (void)setZoomScale:(float)scale animated:(BOOL)animated;
- (void)zoomToRect:(CGRect)rect animated:(BOOL)animated;
- (void)setContentOffset:(CGPoint)contentOffset animated: (BOOL)animated;
@property(nonatomic) BOOL scrollsToTop;

@end

